module DealsHelper
  def brief_time(date)
    date.strftime("%b. %e, %Y")
  end
end
