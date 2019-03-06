function addHomeAirport() {
  let input = $('#home_airport_selector')[0]
  let iata = input.value.slice(0, 3)
  // Get user, because for some reason current_user is nil in the post request?!
  $.get('/api/user', res => {
    $.post('/api/user/airports', {iata: iata, user_id: res.id}).done((airports) => {
      let list = airports.map(a =>`<li>${a.name} (${a.iata})</li>`)
      $('#home-airports-list').html(list)
    })
  })
}