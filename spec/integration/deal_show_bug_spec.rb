require 'rails_helper'

describe "Clicking on a deal in Africa page" do
  it "goes to the deal show page after clicking on a deal from 'All Africa Deals'" do
    deal = dummy_deal_to "GCJ"
    region = Region.find_by(name:"Africa")

    visit regions_path
    click_on region.name
    expect(current_path).to_not include "filter=true" 
    click_on deal.headline

    expect(current_path).to eq region_deal_path region, region.deals.first 
    expect(page).to have_content deal.headline
  end
end

# =begin

# My Africa Deals:
#   params: {"filter"=>"true", "region_slug"=>"africa"}
#   deals#index
#   region_index
#   _my_region_deals
# Follow link:
#   deal#show
#   params: {"slug"=>"iad-to-johannesburg-south-africa-for-683-round-trip-ethiopian-air"}
#   show
#   _detail

# All Africa Deals
#   params: {"region_slug"=>"africa"}
#   deals#index
#   region_index
#   _all_region_deals
# Follow link:
#   params: {"region_slug"=>"africa", "id"=>"iad-to-johannesburg-south-africa-for-683-round-trip-ethiopian-air"}
#   deals#show
#   show
#   _detail

# Region Routes:
# edit_region_deal GET    /regions/:region_slug/deals/:id/edit(.:format) deals#edit
#      region_deal GET    /regions/:region_slug/deals/:id(.:format)      deals#show
#                  DELETE /regions/:region_slug/deals/:id(.:format)      deals#destroy

# end