# Deals: Origins and Destinations

Deal.origins => [Airport]
Airport.origin_deals => [Deals] 
Airport.destination_deals => [Deals] 

Deal has_many :origins

Ways to do this:
- Bi-directional associations with `Deal has_many :origins, class_name" 'Airport', foreign_key: '???'` and `Airpot has_many :origin_deals, class_name: 'Deal', foreign_key: '???'`
- Model-less join tables: 
``` ruby
def change
  create_table :origins, id: false do |t|
    t.integer :airport_id, index: true
    t.integer :deal_id, index: true
  end
end
```

- If that doesn't work, I think a model and a join table should work.
  - Origins model/table and Destinations model/table, identical to DealAirports model/tablle