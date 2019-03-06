function showHomeAirportsForUser(user) {
  const list = user.home_airports
    .map(a => new Airport(a))
    .map(a => a.homeAirportListItem(user.id));
  $("#home-airports-list").html(
    user.home_airports.length > 0 ? list : "You haven't added any airports."
  );
}

function addHomeAirport(form, user) {
  $.post(`/api/users/${user.id}/airports`, form).done(user => {
    showHomeAirportsForUser(user);
    $("#home_airport_selector")[0].value = "";
  });
}

function deleteHomeAirport(airportID, userID) {
  $.ajax({
    url: `/api/users/${userID}/airports/${airportID}`,
    type: "DELETE",
    success: user => showHomeAirportsForUser(user)
  });
}

function addHomeAirportFormListener(user) {
  $("#home_airport_form").submit(function(e) {
    e.preventDefault();
    const formInfo = $(this).serialize();
    addHomeAirport(formInfo, user);
  });
}

class Airport {
  constructor({ id, name, iata, city, country }) {
    this.id = id;
    this.name = name;
    this.iata = iata;
    this.city = city;
    this.country = country;
  }

  homeAirportListItem(userID) {
    return (
      `<li>${this.name} (${this.iata}) ` +
      `<a href="" onclick="deleteHomeAirport(${
        this.id
      },${userID}); return false;">(delete)</a>` +
      `</li>`
    );
  }
}
