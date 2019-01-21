require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe "existing_blog_wrapper_for_date" do
    # let(:deal_with_info) { 
    #   Deal.create(posted_date: Date.today, blog_head: "Header", blog_foot: "Footer") 
    # }
    let(:new_deal) { Deal.create(posted_date: Date.today) }

    it "finds a deal posted on the same date, with blog info and assigns the current deal's blog info to match the one it found" do
      deal_with_info = Deal.create(posted_date: Date.today, blog_head: "Header", blog_foot: "Footer") 
      new_deal.set_existing_blog_wrapper_for_date
      expect(new_deal.blog_head).to eq(deal_with_info.blog_head)
      expect(new_deal.blog_foot).to eq(deal_with_info.blog_foot)
    end
  end
end
