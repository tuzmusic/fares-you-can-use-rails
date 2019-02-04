module DealsHelper

  # ---- INDEX/SHOW ---- 
  def brief_time(date) date&.strftime("%b. %e, %Y") end

  def date_range(deal, hyphen=false)
    [brief_time(deal.start_date), brief_time(deal.end_date)].join(hyphen ? " - " : " to ")
  end

  def instructions_for(deal)
    "<p><b>How To Get It:</b><br>#{deal.instructions}</p>" unless deal&.instructions&.empty? || !deal.instructions
  end

  def deal_paragraphs_for_group(deals)
    deals.map do |deal|
      deal_paragraph_for_deal(deal)
    end.join
  end

  def expired_warning(deal)
    deal.probably_expired? ? "<span class='warning'>POSSIBLY EXPIRED! - </span>" : ""
  end

  def deal_paragraph_for_deal(deal, region=nil)
    text = "<p class='deal'>"
    text += expired_warning(deal)
    text += region ? (link_to deal.headline, region_deal_path(region, deal)) : (link_to deal.headline, deal)
    text += "<br><span class='fly-dates'>Fly from " + date_range(deal)
    text += "</span></p>"
  end

  # ---- NEW/EDIT ---- 
  def airport_codes(airports)
    airports.map do |a|
      "#{a.iata} (#{a.name.chomp(" Airport")})" 
    end.join("<br>")
  end

  def builder_date_select(builder, attribute, id="")
    builder.date_select attribute, order: [:month, :day, :year], start_year: Date.today.year, use_short_month: true, id: id 
  end

  def date_select_for(object, attribute)
    date_select object, attribute, order: [:month, :day, :year], start_year: Date.today.year, use_short_month: true 
  end

  def delete_deal_button
    button_to "Delete Deal", { action: "destroy", id: @deal.id }, method: :delete, data: { confirm: "Are you sure you want to delete this deal?" }
  end

  def edit_deal_button
    button_to "Edit Deal", { action: "edit", id: @deal.id }, method: :get
  end  
end
