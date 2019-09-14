//$(function() {
//$('.slider').slick();
//});
$(function() {
  $('.slider').slick({
      prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
      nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
      speed: 800
  });

  $('.slick-dots li').on('click', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});
//$(document).on('turbolinks:load', function(){
  //$('.slick').slick({
    //autoplay:true,
    //dots:true,
  //});
//});
