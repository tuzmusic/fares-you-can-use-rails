class Deal < ApplicationRecord
  
  def self.list_deals_by_region
    Deal.all.select { |d| d.destinations.present?}.map do |deal|
      {headline: deal.headline, region: deal.region&.name}
    end
  end

  def self.regionless
    Deal.select {|d| d.posted_date && !d.region}
  end  

end