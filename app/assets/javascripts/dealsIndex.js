function myDeals() {
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

function allDeals() {
  $("#my-deals-active-all-deals-linked")[0].hidden = true;
  $("#all-deals-active-my-deals-linked")[0].hidden = false;

  $.get("api/deals", deals => {
    // debugger
    $("#deals").html(
      deals
        .map(d => new Deal(d))
        .sort((a, b) => { 
          // debugger
          b.posted_date > a.posted_date })
        .map(d => d.indexParagraph())
        .join("")
    );
  });
}

let user;
$(function() {
  // if (current_user)
  myDeals();
  // else allDeals()
});
