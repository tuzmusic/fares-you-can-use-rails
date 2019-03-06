function showVacations(vacations) {
  let list = vacations
    .map(v => new Vacation(v))
    .map(v => v.vacationsListParagraph());
  $("p#vacations").html(
    vacations.length > 0 ? list : "You haven't added any vacations."
  );
}
