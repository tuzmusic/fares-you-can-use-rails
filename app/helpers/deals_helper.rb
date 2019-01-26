module DealsHelper

  # ---- INDEX/SHOW ---- 
  def brief_time(date)
    date&.strftime("%b. %e, %Y")
  end

  def date_range(deal)
    "#{brief_time(deal.start_date)} to #{brief_time(deal.end_date)}"
  end

  def instructions_for(deal)
    "<p><b>How To Get It:</b><br>#{deal.instructions}</p>" unless deal&.instructions&.empty? || !deal.instructions
  end

  def deal_paragraphs_for_group(deals)
    deals.map do |deal|
      text = "<p>"
      text += "<span class='warning'>POSSIBLY EXPIRED! - </span>" if deal.probably_expired?
      text += link_to deal.headline, deal
      text += "<br> Fly from " + date_range(deal) 
      text += "</p>"
    end.join
  end

  # ---- NEW/EDIT ---- 
  def airport_codes(airports)
    airports.map do |a|
      "#{a.iata} (#{a.name.chomp(" Airport")})" 
    end.join("<br>")
  end

  def deal_date_select(symbol)
    date_select :deal, symbol, order: [:month, :day, :year], start_year: Date.today.year, use_short_month: true 
  end

  def delete_deal_button
    button_to "Delete Deal", { action: "destroy", id: @deal.id }, method: :delete, data: { confirm: "Are you sure you want to delete this deal?" }
  end

  def edit_deal_button
    button_to "Edit Deal", { action: "edit", id: @deal.id }, method: :get
  end  
end
