function showDeal() {
  
}

$(function () {
  // HOW DO I ONLY LOAD THIS SCRIPT ON THE SHOW PAGE?
  // Fine for now because I /have/ circumvented the dealsIndex script which is the only other one I have at the moment.
  if (location.pathname == "/" || location.pathname == "deals/") return

  // debugger

  let slug = location.pathname.split('/').slice(-1)[0]
  $.get('')


  showDeal()

})

/* 
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/products/" + nextId + ".json", function(data) {
      var product = data;
      $(".productName").text(product["name"]);
      $(".productPrice").text(product["price"]);
      $(".productDescription").text(product["description"]);
      $(".productInventory").text(product["inventory"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", product["id"]);
    });
  });
});
 */