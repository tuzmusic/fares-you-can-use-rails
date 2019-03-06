function showVacations(vacations) {
  let list = vacations
    .map(v => new Vacation(v))
    .map(v => v.vacationsListParagraph());
  $("#vacations-list").html(
    vacations.length > 0 ? list : "You haven't added any vacations."
  );
}

function addVacation(form, userID) {
  $.post(`/api/users/${userID}/vacations`, form).done((res) => {
    showVacations(res)
  })
}