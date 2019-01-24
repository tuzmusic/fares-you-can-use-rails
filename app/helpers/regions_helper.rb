module RegionsHelper
  def region_with_deals_count(region)
    "#{region.name} (#{region.deals.count} deals)"
  end
end
