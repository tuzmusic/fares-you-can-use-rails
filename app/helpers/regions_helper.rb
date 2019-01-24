module RegionsHelper
  def region_with_deals_count(region)
    # binding.pry if region.name == "Europe"
    "#{region.name} (#{pluralize region.deals.count, 'deal'})"
  end
end
