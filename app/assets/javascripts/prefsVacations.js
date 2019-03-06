function showVacations(vacations) {
  let list = vacations
    .map(v => new Vacation(v))
    .map(v => v.vacationsListParagraph());
  $("#vacations-list").html(
    vacations.length > 0 ? list : "You haven't added any vacations."
  );
}

function addVacation(form, userID) {
  $.post(`/api/users/${userID}/vacations`, form).done((vacations) => {
    showVacations(vacations)
  })
}

function deleteVacation(id) {
  $.get("/api/user", user => {
    $.ajax({
      url: `/api/users/${user.id}/vacations/${id}`,
      type: "DELETE",
      success: vacations => showVacations(vacations)
    });
  });
}

function addFormListener(user) {
  $('#new_vacation_form').submit(function (e) {
    e.preventDefault()
    addVacation($(this).serialize(), user.id)
  })

}