module DealsHelper
  def brief_time(date)
    date.strftime("%b. %e, %Y")
  end

  def airport_codes(airports)
    airports.map(&:iata).join(', ')
  end
end
