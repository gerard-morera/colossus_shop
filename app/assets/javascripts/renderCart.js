// $(document ).ready(function() {
//   $(".button_to").click(function(e) {
//     (setTimeout(function() {
//       $.get("/carts", function(data) {
//         $(".cart").html(data);
//       });
//     }), 1000); 
//   })
// })


// this has to be triggered from the server. actually 
// after line controller has add line to cart

$(document).ready(function(){
  $(".button_to").click(setTimeout(function() {
    $.get("/carts", function(data) {
      $(".cart").html(data);
    });
  }), 3000);
})




$(document).ready(function(){
  $(".button_to").click(function() {
    $.get("/carts", function(data) {
      $(".cart").html(data);
    });
  })
})
