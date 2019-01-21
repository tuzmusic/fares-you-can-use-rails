class Deal < ApplicationRecord
  has_many :origin_airports, dependent: :destroy
  has_many :origins, through: :origin_airports, source: :airport

  has_many :destination_airports, dependent: :destroy
  has_many :destinations, through: :destination_airports, source: :airport
  
  def self.airports_from_string(comma_separated_string)
    airports = []
    iata_codes = comma_separated_string.split(', ') 
    iata_codes.each do |code|
      if airport = Airport.find_by(iata: code)
        airports << airport
      end
    end
    airports
  end

  def origin_codes=(comma_separated_string)
    self.origins = Deal.airports_from_string(comma_separated_string)
  end

  def destination_codes=(comma_separated_string)
    self.destinations = Deal.airports_from_string(comma_separated_string)
  end

  def set_existing_blog_wrapper_for_date
    deal_with_blog_wrapper = Deal.find do |deal|
      deal.id != self.id && 
      deal.posted_date == self.posted_date &&
      deal.blog_head.present? || deal.blog_foot.present?
    end
    self.blog_head = deal_with_blog_wrapper.blog_head
    self.blog_foot = deal_with_blog_wrapper.blog_foot
    self.save
  end

end

