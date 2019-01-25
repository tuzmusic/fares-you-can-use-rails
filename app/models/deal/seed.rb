class Deal < ApplicationRecord

   def self.import
    Deal.create(posted_date:Date.new(2019,1,15)).tap do |d|
      d.headline = "DCA to Des Moines, IA for $193 non-stop round trip - American Airlines"
      d.blog_head = "I'm back on the grid - and bringing you a special 2020 Presidential Campaign Edition of Fares You Can Use.
      <br><br>
      I've been seeing some good deals for these particular locales for a while, and if you're planning some campaign travel (or to run for president), you may want to book these deals before the demand spike happens. 
      <br><br>
      (I hope to provide an update on these for you every once in a while.)"
      d.blog_foot = ""
      d.description = "This is a pretty great deal for a non-stop to DSM from DCA, but the departure dates are pretty limited from January 25 to February 25 (and not exactly daily but close). You can check out the calendar <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-iowa-new-hampshire-south-carolina-nevada/13473421-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>here</a>. After that, this route runs for more than $360 and sometimes more than $600! Though, prices are of course subject to change at any time, and I'm sure we'll see this fare fluctuate."
      d.start_date = Date.new(2019,1,25)
      d.end_date = Date.new(2019,2,25)
      d.origin_codes = "DCA" 
      d.destination_codes = "DSM" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,15)).tap do |d|
      d.headline = "DCA/BWI to Manchester, NH/Boston from $163/$81 round trip - American Airlines/Spirit"
      d.set_existing_blog_wrapper_for_date
      d.description = "Okay, so if you're looking for cheap, there's a non-stop round trip from BWI to Boston on Spirit running from <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-iowa-new-hampshire-south-carolina-nevada/13473425-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>$81</a> right now for most of February. But if you're looking for convenient, I would check out early May (1, 4, 6, 7, 8, 11, 13, 14) when you can get a non-stop from DCA to Manchester on American Airlines for <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-iowa-new-hampshire-south-carolina-nevada/13473429-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>$163 round trip</a>. This route regularly runs at around $188 to $285 so this is a solid deal, but you might see it at $120 if you're willing to wait and pounce (rare but it happens)."
      d.start_date = Date.new(2019,5,1)
      d.end_date = Date.new(2019,5,14)
      d.origin_codes = "DCA, BWI" 
      d.destination_codes = "MHT" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,15)).tap do |d|
      d.headline = "DCA to Charleston, SC for $117 non-stop round trip - American Airlines/Jet Blue"
      d.set_existing_blog_wrapper_for_date
      d.description = "Deals to Charleston have been great for a while, but this is the best I've seen with lots of dates. Check out the calendar <a href='Deals to Charleston have been great for a while, but this is the best I've seen with lots of dates. Check out the calendar here for departure date options from February all the way through September (with some limits on Friday and Saturday departures).'>here</a> for departure date options from February all the way through September (with some limits on Friday and Saturday departures)."
      d.start_date = Date.new(2019,2,1)
      d.end_date = Date.new(2019,9,1)
      d.origin_codes = "DCA" 
      d.destination_codes = "CHS" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,15)).tap do |d|
      d.headline = "BWI to Las Vegas, NV for $141 non-stop round trip - Spirit Airlines"
      d.set_existing_blog_wrapper_for_date
      d.description = "The cheapest non-stop is on Spirit from BWI. Sorry. You can check dates <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-iowa-new-hampshire-south-carolina-nevada/13473437-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>here</a>. The best are January 29 to February 11. (If you want a non-stop from DCA, check out American Airlines' <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-iowa-new-hampshire-south-carolina-nevada/13473441-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>options</a> that start at $305 on just a few dates, and soar far far far past that. I would wait and watch that one. They will probably get better before they get worse.)"
      d.start_date = Date.new(2019,1,29)
      d.end_date = Date.new(2019,2,11)
      d.origin_codes = "BWI, DCA" 
      d.destination_codes = "LSV" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,21)).tap do |d|
      d.headline = "IAD to Shanghai for $403 round trip - United Airlines"
      d.description = "This flight has one quick stop there and one quick stop on the way back, and is just about the best you can do for Shanghai. <i>And</i> all the flights in the route are operated by United, so you know exactly what you're getting! Lots of dates in February, March, and April. Find yours <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-shanghai-beijing-moscow-lisbon/13513653-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>here</a>. Make sure to check your flight times and who operates each flight before you book to confirm."
      d.start_date = Date.new(2019,2,1)
      d.end_date = Date.new(2019,4,30)
      d.origin_codes = "IAD" 
      d.destination_codes = "SHA" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,21)).tap do |d|
      d.headline = "IAD to Beijing for $535 non-stop round trip - United Airlines"
      d.description = 'Departure dates available from February 20 to April 6 almost daily. Check out the calendar <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-shanghai-beijing-moscow-lisbon/13513657-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.'
      d.start_date = Date.new(2019,2,20)
      d.end_date = Date.new(2019,4,6)
      d.origin_codes = "IAD" 
      d.destination_codes = "PEK" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,21)).tap do |d|
      d.headline = "IAD to Moscow for $508 non-stop round trip - Aeroflot"
      d.description = %(This one is a little tricky to find, but leave and return any Monday in February or March for this price. For the spring, same deal but the price goes up a bit to $650 for April. After that it's $697 and has a few more date options - Monday, Thursday, and Saturday. All of these are great deals for non-stops to Moscow - if you're into that kind of thing. Find your dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-shanghai-beijing-moscow-lisbon/13513661-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,2,1)
      d.end_date = Date.new(2019,6,1)
      d.origin_codes = "IAD" 
      d.destination_codes = "SVO" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,21)).tap do |d|
      d.headline = "IAD to Lisbon for $542 non-stop round trip - Tap Air Portugal"
      d.description = %(This deal went away for a bit but now it's back - and it's for those of you who plan your vacations far in advance. You can get this price for most Sunday, Monday, and Thursday departures in September, October, November, and December (not Christmas yet but it's too soon to know if that will be added to the sale). Find your dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-shanghai-beijing-moscow-lisbon/13513665-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,9,1)
      d.end_date = Date.new(2019,12,25)
      d.origin_codes = "IAD" 
      d.destination_codes = "LIS" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,18)).tap do |d|
      d.headline = "San Juan, Puerto Rico - non-stop round trip on Spirit from BWI for $160"
      d.blog_head = %(Today is a special edition – based on the <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498197-www.nytimes.com/interactive/2019/travel/places-to-visit.html?c=cf040a38-8c96-4f9b-9338-8c223c053a53">New York Times' 52 Places to Go in 2019 List</a> – and is the first in a series. 
      <br><br>
      I've been poring over the list, and some places are very difficult and/or very expensive to get to (Iran, Falkland Islands!). I'll be highlighting a few places from the NYT's list where there are currently great deals from Washington.
      <br><br>
      Today's deals are only the domestic destinations. I'll follow up with Europe, Asia, and Africa/Middle East deals – based on the New York Times' list – in separate emails later this week.)
      d.description = %(This is a great price for a non-stop round trip. Check out the calendar <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498201-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a> to find your dates.There are a few departure dates in February, March, April, and May at this price. If you want to avoid Spirit, there are some other non-stop options in United or Jet Blue starting at $260 round trip, but with very limited dates. You can check them out <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498205-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,2,1)
      d.end_date = Date.new(2019,4,30)
      d.origin_codes = "BWI" 
      d.destination_codes = "SIG" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,18)).tap do |d|
      d.headline = "Columbus, Ohio - non-stop round trip on American Airlines from DCA for $159"
      d.set_existing_blog_wrapper_for_date
      d.description = %(This a great deal. You can depart almost any day between now and May. After that, the price ticks up to $173 for June through September. Find your dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498209-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,1,1)
      d.end_date = Date.new(2019,9,30)
      d.origin_codes = "DCA" 
      d.destination_codes = "LCK" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,18)).tap do |d|
      d.headline = "Huntsville, Alabama - non-stop round trip on United from IAD for $277"
      d.set_existing_blog_wrapper_for_date
      d.description = %(This is a great deal for people who like to plan in advance and are looking for a weekend trip. You can leave any Thursday, Friday, or Saturday between February 8 and December 14. Find your dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498213-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>. I've never seen a good price like this that's available for an entire year, including holiday weekends. (I'll be booking this one!))
      d.start_date = Date.new(2019,2,8)
      d.end_date = Date.new(2019,12,14)
      d.origin_codes = "IAD" 
      d.destination_codes = "HSV" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,18)).tap do |d|
      d.headline = "Los Angeles, California (and Santa Barbara) - non-stop round trip on Spirit from BWI for $140"
      d.set_existing_blog_wrapper_for_date
      d.description = %(Again, it's Spirit but a super deal. You can check out the calendar <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498217-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a> to find your dates - with lots of departures in January and February and a few in March. If you want to avoid Spirit, Alaska Airlines has non-stops from IAD for $197 with lots of date options as well. Find your dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498221-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,1,1)
      d.end_date = Date.new(2019,3,31)
      d.origin_codes = "BWI, IAD" 
      d.destination_codes = "LAX" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,18)).tap do |d|
      d.headline = "Houston, Texas - non-stop round trip on Spirit from BWI for $120"
      d.set_existing_blog_wrapper_for_date
      d.description = %(This isn't the only well-priced flight to Houston from DC but it's the cheapest. Find dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498225-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a> (departures in February only). Avoiding Spirit, the next best flights are non-stops on United for $165 round trip for select February dates. Check out that deal <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-puerto-rico-la-houston-columbus-and-other-destinations-on-the-nyt-s-52-places-to-go-in-2019-list/13498229-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,2,1)
      d.end_date = Date.new(2019,2,28)
      d.origin_codes = "BWI" 
      d.destination_codes = "IAH" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,7)).tap do |d|
      d.headline = "IAD to Lome, Togo for $611 round trip - United Airlines."
      d.blog_head = %(There are still a bunch of great deals on flights to African destinations for February and March.)
      d.description = %(Almost daily departures between February 4 and March 31. Check the calendar <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-big-africa-deals/13413529-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,2,4)
      d.end_date = Date.new(2019,3,31)
      d.origin_codes = "IAD" 
      d.destination_codes = "LFW" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,7)).tap do |d|
      d.headline = "IAD to Kigali, Rwanda for $560 round trip - United Airlines/Brussels Air."
      d.set_existing_blog_wrapper_for_date
      d.description = %(Almost daily departures between February 4 and March 31. Check the calendar <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-big-africa-deals/13413533-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,2,4)
      d.end_date = Date.new(2019,3,31)
      d.origin_codes = "IAD" 
      d.destination_codes = "KGL" 
      d.save
    end

    Deal.create(posted_date:Date.new(2019,1,7)).tap do |d|
      d.headline = "IAD to Dar Es Salaam, Tanzania for $552 round trip - United Airlines."
      d.set_existing_blog_wrapper_for_date
      d.description = %(Depart on most Wednesdays and Sundays from February 20 through March 31. Check your dates <a href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-big-africa-deals/13413537-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53">here</a>.)
      d.start_date = Date.new(2019,2,20)
      d.end_date = Date.new(2019,3,31)
      d.origin_codes = "IAD" 
      d.destination_codes = "DAR" 
      d.save
    end
    Deal.create(posted_date:Date.new(2019,1,7)).tap do |d|
      d.headline = "IAD to Johannesburg, South Africa for $683 round trip - Ethiopian Air."
      d.set_existing_blog_wrapper_for_date
      d.description = %(This one is a little tricky to find as the price doesn't load into the calendar - and then once you click on dates, it takes a few extra seconds to tell you what it is. (Initially it says "price unavailable" but just give it a second.) Looks like you can depart almost any day in February or March, but try your dates <a href="This one is a little tricky to find as the price doesn't load into the calendar - and then once you click on dates, it takes a few extra seconds to tell you what it is. (Initially it says "price unavailable" but just give it a second.) Looks like you can depart almost any day in February or March, but try your dates here.">here</a>.)
      d.start_date = Date.new(2019,2,1)
      d.end_date = Date.new(2019,3,31)
      d.origin_codes = "IAD" 
      d.destination_codes = "GCJ" 
      d.save
    end
  end
  
end