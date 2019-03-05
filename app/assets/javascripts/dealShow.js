function showDeal(deal) {
  
}

$(function () {
  // HOW DO I ONLY LOAD THIS SCRIPT ON THE SHOW PAGE?
  // Fine for now because I /have/ circumvented the dealsIndex script which is the only other one I have at the moment.
  if (location.pathname == "/" || location.pathname == "deals/") return

  // debugger

  let slug = location.pathname.split('/').slice(-1)[0]
  $.get(`/api/deals/${slug}`, res => {
    let deal = new Deal(res)
    // debugger
    $('#deal').html(deal.showPageParagraph())
  })
})