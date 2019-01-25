require 'rails_helper'

describe Deal, type: :model do

  let(:cdg) { Airport.iata("CDG") }
  let(:mad) { Airport.iata("MAD") }
  let(:eur) { Region.find_by(name:"Europe") }
  let(:afr) { Region.find_by(name:"Africa") }
  
  context "importing manually from code" do    
    describe "set_existing_blog_wrapper_for_date" do
      let(:new_deal) { Deal.create(posted_date: Date.today) }
  
      it "finds a deal posted on the same date, with blog info and assigns the current deal's blog info to match the one it found" do
        deal_with_info = Deal.create(posted_date: Date.today, blog_head: "Header", blog_foot: "Footer") 
        new_deal.set_existing_blog_wrapper_for_date
        expect(new_deal.blog_head).to eq(deal_with_info.blog_head)
        expect(new_deal.blog_foot).to eq(deal_with_info.blog_foot)
      end
    end
  end

  describe "#probably_expired?" do
    it "returns true if deal was posted more than a week ago" do
      d = Deal.create(posted_date:(Date.today-8))
      expect(d.probably_expired?).to eq(true)
    end
    it "returns false if deal is less than a week old" do
      d = Deal.create(posted_date:Date.yesterday)
      expect(d.probably_expired?).to eq(false)
    end
  end

  describe "Deal creation" do
    it "sets region for a new deal with destinations" do
      d = Deal.create(destinations: [cdg, mad])
      expect(d.region).to eq(eur)
      expect(d.posted_date).to eq(Date.today)
    end
  end
end
