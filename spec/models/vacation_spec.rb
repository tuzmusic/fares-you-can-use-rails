require 'rails_helper'

describe Vacation, type: :model do
  let(:user) { create_user }
  before :each do
    user.vacations.create(name:"Summer", start_date:Date.new(2019,6,1), end_date:Date.new(2019,9,1))
    user.vacations.create(name:"Christmas Break", start_date:Date.new(2019,12,18), end_date:Date.new(2020,1,4))
  end

  describe "User" do
    it "has many vacations" do
      expect(user.vacations.count).to eq 2 
      expect(user.vacations.first.name).to eq "Summer" 
    end
  end

  describe "Vacation" do
    it "belongs to a user" do
      expect(Vacation.first.user).to eq user 
    end
  end
end
