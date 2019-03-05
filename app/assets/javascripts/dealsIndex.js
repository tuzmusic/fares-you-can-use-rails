function myDeals() {
  $("#all-deals-signed-out")[0].hidden = true;
  $("#all-deals-active-my-deals-linked")[0].hidden = true;
  $("#my-deals-active-all-deals-linked")[0].hidden = false;

  $.get("api/user", user => {
    $("#deals").html(
      user.vacations
        .map(v => new Vacation(v))
        .map(v => v.indexParagraph())
        .join("")
    );
  });
}

let allDealsList;
function allDeals(signedOut) {
  // debugger
  if (allDealsList) {
    $("#all-deals-signed-out")[0].hidden = !signedOut;
    $("#all-deals-active-my-deals-linked")[0].hidden = signedOut;
    $("#my-deals-active-all-deals-linked")[0].hidden = true;

    $("#deals").html(
      "<br>" +
        allDealsList
          .map(d => new Deal(d))
          .sort((a, b) => {
            b.posted_date > a.posted_date;
          })
          .map(d => d.indexParagraph())
          .join("")
    );
  } else {
    $.get("api/deals", deals => {
      allDealsList = deals;
      allDeals(signedOut);
    });
  }
}

let user;
$(function() {
  $.get("api/user", user => {
    if (user) {
      debugger
      myDeals();
      fetch("api/deals")
        .then(res => res.json())
        .then(json => {
          allDealsList = json;
        });
    } else {
      debugger
      allDeals(true);
    }
  });
});
