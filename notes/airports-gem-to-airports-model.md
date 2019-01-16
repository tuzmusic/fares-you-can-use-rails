It appears that the airports gem uses JSON data.
I need to convert it to ActiveRecord objects.
  rake task import_airports

I also need to have a way to update my AR Airports database.
  run airports' update task
  run my import task

Do I want my model to simply refer to an Airport gem model? Not sure I can, actually, since it would need to be an AR model which is my problem in the first place!

---

# Model from gem

"DCA":{"name":"Ronald Reagan Washington National Airport",
      "city":"Washington",
      "country":"United States",
      "iata":"DCA",
      "icao":"KDCA"
      ,"latitude":"38.8521",
      "longitude":"-77.037697",
      "altitude":"15",
      "timezone":"-5",
      "dst":"A"}