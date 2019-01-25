class State < ApplicationRecord
  validates :name, uniqueness: true
  
  has_many :airports
  belongs_to :region, optional: true

  def self.import_all_and_assign_to_airports
    require 'csv'
    require 'json'

    csv = CSV.new(File.read('notes/airports-by-state.csv'), :headers => true, :header_converters => :symbol, :converters => :all)
    rows = csv.to_a.map {|row| row.to_hash }
    rows.delete_at(-1)
    rows.find{|r| r[:faa]=="LHD"}[:iata] = "LHD" # fix missing iata for Anchorage LHD

    airports = {}
    state = nil
    rows.each do |row|
      if row[:airport].nil?
        state_name = row[:city].titleize
        state = State.find_or_create_by(name: state_name)
      elsif row[:iata] && airport = Airport.iata(row[:iata])
        airports[row[:iata].to_sym] = state.name
        airport.state = state if state
        airport.save   
        puts "Assigned #{airport.iata} to #{state.name}" if airport.state 
      end  
    end
  end



end
