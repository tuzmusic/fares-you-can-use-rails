function addHomeAirport() {
  let input = $("#home_airport_selector")[0];
  let iata = input.value.slice(0, 3);
  // Get user, because for some reason current_user is nil in the post request?!
  $.get("/api/user", res => {
    $.post("/api/user/airports", { iata: iata, user_id: res.id }).done(
      airports => {
        showHomeAirports(airports);
        input.value = "";
      }
    );
  });
}

function deleteHomeAirport(id) {
  $.get("/api/user", res => {
    $.ajax({
      url: `/api/users/${res.id}/airports/${id}`,
      type: "DELETE",
      success: airports => showHomeAirports(airports)
    });
  });
}

function showHomeAirports(airports) {
  let list = airports.map(
    a =>
      `<li>${a.name} (${a.iata}) ` +
      `<a href="" onclick="deleteHomeAirport(${
        a.id
      }); return false;">(delete)</a>` +
      `</li>`
  );
  $("#home-airports-list").html(
    airports.length > 0 ? list : "You haven't added any airports."
  );
}
