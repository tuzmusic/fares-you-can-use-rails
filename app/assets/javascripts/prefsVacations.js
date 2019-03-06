function showVacations(vacations) {
  let list = vacations
    .map(v => new Vacation(v))
    .map(v => v.vacationsListParagraph());
  $("#vacations-list").html(
    vacations.length > 0 ? list : "You haven't added any vacations."
  );
}

function addVacation(form) {
  debugger
  const name = $('#vacation_name')[0].value
  const start_year = $('#vacation_start_date_1i')[0].value
  const start_month = $('#vacation_start_date_2i')[0].value
  const start_day = $('#vacation_start_date_3i')[0].value
  const end_year = $('#vacation_end_date_1i')[0].value
  const end_month = $('#vacation_end_date_2i')[0].value
  const end_day = $('#vacation_end_date_3i')[0].value
  // debugger
}

function addListener() {
  let form = $('#new-vacation-form')[0]
  debugger
  form.addEventListener('submit', addVacation())

}