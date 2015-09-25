$(document ).ready(function() {
  $(".button_to").click(function(e) {
    $.get("/carts", function(data) {
      console.log(data)
      $(".cart").html(data)  
    })
  })
})