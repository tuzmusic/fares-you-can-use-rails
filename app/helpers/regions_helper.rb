module RegionsHelper
  def region_with_deals_count(region)
    text = "#{region.name} (#{pluralize region.deals.count, 'deal'})"
    link_to text, region_deals_path(region, params:{filter:true})
  end
end
