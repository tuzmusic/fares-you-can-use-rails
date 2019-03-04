function myDeals() {
  $("#all-deals-active-my-deals-linked")[0].hidden = true;
  $("#my-deals-active-all-deals-linked")[0].hidden = false;

  // get user deals
  $.get("api/user", user => {
    // render each vacation
    // debugger;
    user.vacations.forEach(v => {
      // debugger;
      vacation = new Vacation(v)
      $('#deals').append(vacation.indexParagraph())
    });
    // render each deal
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
