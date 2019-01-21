module DealsHelper
  def brief_time(date)
    date.strftime("%b. %e, %Y")
  end

  def airport_codes(airports)
    airports.map(&:iata).join(', ')
  end

  def deal_date_select(symbol)
    date_select :deal, symbol, order: [:month, :day, :year], start_year: Date.today.year, use_short_month: true 
  end

  def instructions_for(deal)
    "<p><b>How To Get It:</b><br>#{deal.instructions}</p>" unless deal&.instructions&.empty?
  end
end
