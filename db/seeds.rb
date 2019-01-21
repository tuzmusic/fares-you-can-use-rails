binding.pry
d = Deal.create(posted_date:Date.new(2019,1,15))

d.headline = "DCA to Des Moines, IA for $193 non-stop round trip - American Airlines"
d.blog_head = "I'm back on the grid - and bringing you a special 2020 Presidential Campaign Edition of Fares You Can Use.
<br><br>
I've been seeing some good deals for these particular locales for a while, and if you're planning some campaign travel (or to run for president), you may want to book these deals before the demand spike happens. 
<br><br>
(I hope to provide an update on these for you every once in a while.)"
d.blog_foot = ""
d.description = "This is a pretty great deal for a non-stop to DSM from DCA, but the departure dates are pretty limited from January 25 to February 25 (and not exactly daily but close). You can check out the calendar <a href='http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-iowa-new-hampshire-south-carolina-nevada/13473421-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53'>here</a>. After that, this route runs for more than $360 and sometimes more than $600! Though, prices are of course subject to change at any time, and I'm sure we'll see this fare fluctuate."
d.instructions = ""
d.start_date = Date.new(2019,1,25)
d.end_date = Date.new(2019,2,25)
d.origin_codes = "DCA" 
d.destination_codes = "DSM" 
d.save

