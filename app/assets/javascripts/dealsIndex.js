console.log("hello from dealindex");


function myDeals() {
  console.log("hello from mydeals");
  
  $('#allDealsHeader').hidden = true
}

$(function(){
  $('body').text("this page has been taken over from 'onReady' in dealsIndex.js!!!")
})