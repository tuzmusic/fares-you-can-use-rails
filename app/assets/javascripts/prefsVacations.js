function showVacationsForUser(user) {
  const list = user.vacations
    .map(v => new Vacation(v))
    .map(v => v.vacationsListParagraph(user.id));
  $("#vacations-list").html(
    user.vacations.length > 0 ? list : "You haven't added any vacations."
  );
}

function addVacation(form, user) {
  $.post(`/api/users/${user.id}/vacations`, form).done(user =>
    showVacationsForUser(user)
  );
}

function deleteVacation(vacation_id, user_id) {
  $.ajax({
    url: `/api/users/${user_id}/vacations/${vacation_id}`,
    type: "DELETE",
    success: user => showVacationsForUser(user)
  });
}

function addVacationFormListener(user) {
  $("#new_vacation_form").submit(function(e) {
    e.preventDefault();
    const formInfo = $(this).serialize();
    addVacation(formInfo, user);
  });
}
