require 'rails_helper'

describe "Preference views", type: :feature do
  
  describe "show page" do
    let(:user) { User.first }
    let(:pref) { Preference.create(user: User.first) }
    
    before :each do
      create_and_log_in_user
    end
    
    describe "vacations section" do
      before :each do
        pref.vacations.create(name: "Summer vacation", start_date: Date.new(2019,6,1), end_date: Date.new(2019,8,31))
        pref.vacations.create(name: "Winter break", start_date: Date.new(2019,12,21), end_date: Date.new(2019,12,31))
        visit preferences_path
      end

      it "show's the user's vacations" do
        expect(page).to have_content "Summer vacation"
        expect(page).to have_content "Winter break"
      end
      
      it "has a link to edit vacations" do
        expect(page).to have_link "Edit Vacations" 
        # preference#edit
      end

      it "has a link to create a new vacation" do
        expect(page).to have_link "New Vacation" 
        # preference#new
      end

      xit "doesn't show vacations that have passed (OR marks vacations that have passed)" do
      end

      it "displays a message if a user has defined no vacations" do
        Vacation.destroy_all
        page.refresh
        expect(pref.vacations.count).to eq 0
        expect(page).to have_content "You haven't added any vacations" 
      end
    end

    describe "home airports section" do

      before :each do
        pref.home_airports << Airport.iata("DCA")
        pref.home_airports << Airport.iata("IAD")
        visit preferences_path
      end


      it "shows the user's home airports" do
        expect(page).to have_content "Ronald Reagan Washington National Airport"
        expect(page).to have_content "Washington Dulles International Airport"
        # preference#show
      end
      
      it "has a form to add one home airport, with an auto-fill text field" do
        expect(page).to have_field "home_airport_selector" 
        expect(page.body).to include "datalist"
      end

      it "adds a home airport if a valid airport is selected" do
        page.select "BWI (Baltimore/Washington International Thurgood Marshall Airport)", from: 'home_airport_selector'
        click_button "Add"
        expect(page).to have_content "Baltimore/Washington International Thurgood Marshall Airport (BWI)"
        # preference#update
      end
      
      it "does not add an airport if an invalid airport is entered" do
        fill_in 'home_airport_selector', with: "poop"
        click_button "Add"
        expect(page.all('#home_airports_list')).to_not have_content "poop"
        expect(page).to have_content "poop is not a valid airport."
      end
    end

    describe "regions section" do
      it "shows all the regions with checkboxes" do
        expect(false).to eq true 
        # preference#show
      end

      it "shows the user's currently selected regions ('destinations')" do
        expect(false).to eq true 

      end
      
      it "has a save button for regions" do
        expect(false).to eq true 
        
      end

      it "saves updated regions when the button is clicked" do
        expect(false).to eq true 
        # preference#update
      end
    end
  end

  describe "edit vacations view" do
    it "shows an edit form for vacations when the vacations edit button was clicked" do
      expect(false).to eq true 
        # preference#edit
    end

    it "has a button to delete vacation" do
      expect(false).to eq true 
      # preference#edit
    end
  end

  describe "new view" do
    it "has a form to create a new vacation" do
      expect(false).to eq true 
      # preference#new  (IS THIS CORRECTLY RESTFUL?)
    end

    it "shows all the user's current vacations" do
      expect(false).to eq true 
      
    end

    it "saves the new vacation" do
      expect(false).to eq true 
      # using to preference#update
    end
  end
  
  describe "access control" do
    it "can only access the preferences for the current user" do
      expect(false).to eq true 
      
    end
  end
end