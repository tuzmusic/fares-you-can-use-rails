class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string    :name
      t.string    :city
      t.string    :country
      t.string    :iata
      t.string    :icao
      t.float     :latitude
      t.float     :longitude
      t.float     :altitude
      t.integer   :timezone
      t.string    :dst
      
      t.timestamps
    end
  end
end
