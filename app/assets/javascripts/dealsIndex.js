function myDeals() {
  $("#all-deals-active-my-deals-linked")[0].hidden = true;
  $("#my-deals-active-all-deals-linked")[0].hidden = false;

  $.get("api/user", user => {
    $("#deals").html("");
    $("#deals").html(
      user.vacations
        .map(v => new Vacation(v))
        .map(v => v.indexParagraph())
        .join("")
    );
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
