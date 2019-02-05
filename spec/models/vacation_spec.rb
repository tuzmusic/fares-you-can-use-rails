require 'rails_helper'

describe Vacation, type: :model do
  let(:user) { create_user }
  let(:pref) { Preference.create(user:user)}
  # before :each do
  #   pref.vacations.create(name:"Summer", start_date:Date.new(2019,6,1), end_date:Date.new(2019,9,1))
  #   pref.vacations.create(name:"Christmas Break", start_date:Date.new(2019,12,18), end_date:Date.new(2020,1,4))
  # end

  # describe "Preference" do
  #   it "has many vacations" do
  #     expect(pref.vacations.count).to eq 2 
  #     expect(pref.vacations.first.name).to eq "Summer" 
  #   end
  # end

  describe "Vacation" do
    it "can be created without preferences? " do
      v = Vacation.create
      expect(Vacation.count).to eq 1 
    end
    it "belongs to (has) many preferences" do
      v = Vacation.create
      p = Preference.create(user: user)
      expect(Preference.count).to eq 1 
      v.preferences << p
      expect(pref.vacations.count).to eq 1 
      expect(v.preferences.count).to eq 1 
    end
  end
end
