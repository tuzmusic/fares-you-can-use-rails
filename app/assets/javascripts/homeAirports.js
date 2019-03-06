function addHomeAirport() {
  let input = $("#home_airport_selector")[0];
  let iata = input.value.slice(0, 3);
  // Get user, because for some reason current_user is nil in the post request?!
  $.get("/api/user", res => {
    $.post("/api/user/airports", { iata: iata, user_id: res.id }).done(
      airports => {
        let list = airports.map(
          a =>
            `<li>${a.name} (${a.iata})` +
            `<a href="/preferences/delete_airport/${a.id}">(delete)</a>` +
            `</li>`
        );
        $("#home-airports-list").html(
          airports.length > 0 ? list : "You haven't added any airports."
        );
        // debugger
        input.value = "";
      }
    );
  });
}
