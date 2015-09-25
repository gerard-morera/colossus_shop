$(document ).ready(function() {
  $(".button_to").click(function(e) {
    $.get("/cart", function(data) {
      console.log(data)
      $(".cart").html(data)  
    })
  })
})