$(document).ready(function(){
  
  $("#price-range").ionRangeSlider({
    type: "double",
    grid: true,
    prefix:'&#8377;',
    min: -0,
    max: 300,
    from: 30,
    to: 100
});
  
//   active color
  $('.color-list .color').on("click",function(){
    $('.color-list .color').removeClass("active");
    $(this).addClass("active");
  });
});