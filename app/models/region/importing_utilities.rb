class Region < ApplicationRecord

  def state_names=(comma_separated_string)
    states = comma_separated_string.split(", ")
    states.each do |state_name|
      if state = State.find_by(name:state_name) 
        if !self.states.include?(state)
          self.states << State.find_by(name:state_name)
          puts "#{state_name} assigned to #{self.name}"
        end
      end
    end
  end

  def self.import_all
    continents = ['Africa', 'Europe', 'Asia', 'Australia', 'South America']
    countries = ['Canada', 'Mexico']
    us_regions = ['Northeastern USA', 'Southeastern USA', 'Midwestern USA', 'Southern USA', 'Northwestern USA', 'Southwestern USA']
    (continents + countries + us_regions).each do |name| 
      if Region.create(name: name).valid?
        puts "created #{name}"
      else 
        puts "could not create #{name}, probably because it already exists"
      end
    end
  end 

  def self.assign_us_states
    ne = Region.find_by(name:"Northeastern USA")
    se = Region.find_by(name:"Southeastern USA")
    mw = Region.find_by(name:"Midwestern USA")
    s = Region.find_by(name:"Southern USA")
    nw = Region.find_by(name:"Northwestern USA")
    sw = Region.find_by(name:"Southwestern USA")

    # from https://en.wikipedia.org/wiki/List_of_regions_of_the_United_States
    # Region 1: Northeast
    ne.state_names = "Connecticut, Maine, Massachusetts, New Hampshire, Rhode Island, Vermont, New Jersey, New York, Pennsylvania, Delaware, Maryland"
    # Region 2: Midwest
    mw.state_names = "Illinois, Indiana, Michigan, Ohio, Wisconsin, Iowa, Kansas, Minnesota, Missouri, Nebraska, North Dakota, South Dakota"
    # Region 3: South
    se.state_names = "Florida, Georgia, North Carolina, South Carolina, Virginia, West Virginia"
    s.state_names = "Alabama, Kentucky, Mississippi, Tennessee, Arkansas, Louisiana, Oklahoma, Texas"
    # Region 4: West
    sw.state_names = "Arizona, Colorado, Idaho, Montana, Nevada, New Mexico, Utah, Wyoming"
    nw.state_names = "Alaska, California, Hawaii, Oregon, Washington"
  end


end