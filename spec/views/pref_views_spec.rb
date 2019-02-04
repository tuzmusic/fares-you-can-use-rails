require 'rails_helper'

describe "Preference views", type: :feature do
  
  let(:user) { User.first }
  let(:pref) { Preference.create(user: User.first) }
  
  before :each do
    create_and_log_in_user
  end

  describe "show page" do
    
    
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
        pref.vacations.delete_all
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

      it "does not add an airport if an invalid 3-letter airport is entered" do
        fill_in 'home_airport_selector', with: "XXX"
        click_button "Add"
        expect(page.all('#home_airports_list')).to_not have_content "XXX"
        expect(page).to have_content "XXX is not a valid airport."
      end

      it "allows deletion of home airports" do
        page.all('#home-airports-list a').first.click
        expect(page).to_not have_content "DCA"
      end

      it "displays a message if a user has defined no home airports" do
        pref.home_airports.delete_all
        page.refresh
        expect(pref.home_airports.count).to eq 0
        expect(page).to have_content "You haven't added any airports" 
      end

    end

    describe "regions section" do
      let(:afr) { Region.find_by(name:"Africa") }
      let(:eur) { Region.find_by(name:"Europe") }
      let(:asia) { Region.find_by(name:"Asia") }

      before :each do
        pref.regions << afr
        pref.regions << eur
        visit preferences_path
      end

      it "shows all the regions with checkboxes" do
        expect(page.all('input[type=checkbox]').count).to eq Region.count
      end

      it "shows the user's currently selected regions ('destinations')" do
        expect(page.all('input[type=checkbox][checked=checked]').count).to eq 2
      end
      
      it "has a save button for regions" do
        expect(page).to have_button "Save"
      end

      xit "saves updated regions when the button is clicked" do
        uncheck "preferences_region_ids_#{afr.id}"
        check "preferences_region_ids_#{asia.id}"
        click_button "Save"
        expect(pref.regions).to_not include afr
        expect(pref.regions).to include asia

        afr_box = page.all("#preferences_region_ids_#{afr.id}").first 
        expect(afr_box.checked?).to eq false
        
        asia_box = page.all("#preferences_region_ids_#{asia.id}").first 
        expect(asia_box.checked?).to eq true
        # preference#update
      end
    end
  end

  describe "edit vacations view" do
      before :each do
        pref.vacations.create(name: "Summer vacation", start_date: Date.new(2019,6,1), end_date: Date.new(2019,8,31))
        pref.vacations.create(name: "Winter break", start_date: Date.new(2019,12,21), end_date: Date.new(2019,12,31))
        visit edit_preferences_path
      end

    it "shows an edit form for vacations when the vacations edit button was clicked, with the vacations in chronological order" do
      inputs = page.all('#edit_vacations_form input[type="text"]')
      expect(inputs.count).to eq 2
      expect(inputs.first.value).to eq "Summer vacation"  
        # preference#edit
    end

    xit "lists the vacations in order" do
    end

    it "has a button to delete each vacation" do
      expect(page.all('input[type=submit][value=Delete]').count).to eq 2
    end

    it "has a button to save each vacation" do
      expect(page.all('input[type=submit][value=Save]').count).to eq 2
    end

    it "can edit a vacation" do
      fill_in 'vacation_0_name', with: "Spring Break"
      page.all('input[type=submit][value=Save]').first.click
      expect(page).to have_content "Spring Break"
      expect(page).to_not have_content "Summer vacation"
    end

    it "can delete a vacation" do
      expect(false).to eq true 
    end

    it "shows the rest of the show page" do
      expect(false).to eq true 
    end

    context "it functions just like the show page" do
      it "can add a new home airport" do
        
      end
      it "can change the regions" do
        
      end
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