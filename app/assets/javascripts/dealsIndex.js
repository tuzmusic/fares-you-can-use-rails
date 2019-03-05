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
  // debugger
  $("#my-deals-active-all-deals-linked")[0].hidden = true;
  $("#all-deals-active-my-deals-linked")[0].hidden = false;

  $.get('api/deals', deals => {
    // debugger
    $('#deals').html(
      deals.map(d => new Deal(d))
      .map(d => d.indexParagraph())
      .join('')
    )
  })
}

let user;
$(function() {
  myDeals();
});
