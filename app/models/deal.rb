class Deal < ApplicationRecord
  has_many :deal_origins, dependent: :destroy
  has_many :origins, through: :deal_origins, source: :airport

  has_many :destination_airports, dependent: :destroy
  has_many :destinations, through: :destination_airports, source: :airport
  
  belongs_to :region

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

  def origin_codes
    self.origins.map(&:iata).join(', ')
  end

  def destination_codes=(comma_separated_string)
    self.destinations = Deal.airports_from_string(comma_separated_string)
  end

  def destination_codes
    self.destinations.map(&:iata).join(', ')
  end

  # def region
  #   destinations&.first&.region
  # end

  def probably_expired?
    posted_date < Date.today - 7 if posted_date
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

  def self.list_deals_by_region
    Deal.all.select { |d| d.destinations.present?}.map do |deal|
      {headline: deal.headline, region: deal.region&.name}
    end
  end

  def self.regionless
    Deal.select {|d| d.posted_date && !d.region}
  end

end

