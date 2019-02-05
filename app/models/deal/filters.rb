class Deal < ApplicationRecord  

  scope :current, -> { where('end_date > ?', Date.today) }

  scope :from_airport, -> (airport) {select {|d| d.origins.include? airport }}
  
end