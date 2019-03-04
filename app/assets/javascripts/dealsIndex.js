function myDeals() {
  $("#all-deals-active-my-deals-linked")[0].hidden = true;
  $("#my-deals-active-all-deals-linked")[0].hidden = false;

  // get user deals
  $.get("api/user/deals", deals => {
    deals.forEach(hash => {
      deal = new Deal(hash);
      debugger;
      $('#deals').append(deal.indexParagraph())
    });
  });
}

function allDeals() {
  // debugger
  $("#my-deals-active-all-deals-linked")[0].hidden = true;
  $("#all-deals-active-my-deals-linked")[0].hidden = false;
}

let user;
$(function() {
  myDeals();
});
