function myDeals() {
  $("#all-deals-active-my-deals-linked")[0].hidden = true;
  $("#my-deals-active-all-deals-linked")[0].hidden = false;

  $.get("api/user", user => {
    $('#deals').html("")
    let vacations = user.vacations.map(v => new Vacation(v))
    let html = vacations.map(v => v.indexParagraph()).join('')
    $('#deals').html(html)
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
