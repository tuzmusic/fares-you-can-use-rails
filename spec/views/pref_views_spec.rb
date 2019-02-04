require 'rails_helper'

describe "Preference views", type: :feature do
  
  describe "show page" do
    let(:user) { create_user }
    let(:pref) { Preference.create(user: user) }
    let(:v1)  { pref.vacations.create(name: "Summer vacation", start_date: Date.new(2019,6,1), end_date: Date.new(2019,8,31) }
    let(:v2)  { pref.vacations.create(name: "Winter break", start_date: Date.new(2019,12,21), end_date: Date.new(2019,12,31) }

    
    describe "vacations section" do
      before :each do
        v1; v2    
      end

      it "show's the user's vacations" do
        
      end
      
      it "has a button to edit vacations" do
        # preference#edit
      end

      it "has a button to create a new vacation" do
        # preference#edit
      end

      it "has a button to delete vacation" do
        # preference#edit
      end

      it "doesn't show vacations that have passed" do
        
      end

      it "displays a message if a user has defined no vacations" do
        
      end
    end

    describe "home airports section" do
      it "shows the user's home airports" do
        # preference#show
      end
      
      it "has a form to add one home airport, with an auto-fill text field" do

      end

      it "adds a home airport" do
        # preference#update
      end
    end

    describe "regions section" do
      it "shows all the regions with checkboxes" do
        # preference#show
      end

      it "shows the user's currently selected regions ('destinations')" do

      end
      
      it "has a save button for regions" do
        
      end

      it "saves updated regions when the button is clicked" do
        # preference#update
      end
    end
  end

  describe "edit vacations view" do
    it "shows an edit form for vacations when the vacations edit button was clicked" do
        # preference#edit
    end
  end

  describe "new view" do
    it "has a form to create a new vacation" do
      # preference#new  (IS THIS CORRECTLY RESTFUL?)
    end

    it "shows all the user's current vacations" do
      
    end

    it "saves the new vacation" do
      # using to preference#update
    end
  end
  
  describe "access control" do
    it "can only access the preferences for the current user" do
      
    end
  end
end