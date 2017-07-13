$(document).ready( function (){
  moveToAbout();
})
moveToAbout();

function moveToAbout() {
  if ($(".move-to-about")) {
    $(".move-to-about").click(function (event) {
      event.preventDefault();
      var todoTop = $('.contact').offset().top;
      $('body, html').animate({scrollTop: todoTop}, 1000);
    })
  }
}
