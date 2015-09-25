$( document ).ready(function() {
  $("button").click(function(e) {
    e.preventDefault();
    $.get("/cart", function(data) {
      console.log(data)
      $(".cart").html(data)  
    })
  })
})