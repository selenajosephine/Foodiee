//instantiate a TimelineLite    
var tl = new TimelineLite(),
  //element variables
  $headerInfo = $(".header-info"),
  $edit = $(".edit"),
  $orderListingWrapper = $(".order-listing-wrapper"),
  $lineListingWrapper = $(".line-listing-wrapper"),
  $orderDetailsWrapper = $(".order-details-wrapper"),
  $actionCompleteBar = $(".action-complete-bar"),
  $actionList = $(".action-list"),
  $editContainer = $(".edit-container"),
$backButton = $(".back-button");

//From Order Listing to Order Detail Animation
$('#orderLink').on('click',
  function() {
    tl.to($orderListingWrapper, 0.2, {
      autoAlpha: 0,
      scale: 1.05,
      display: "none",
    });
//    tl.to($orderListingWrapper, 0, {
//      height: 0,
//    })
    tl.fromTo($orderDetailsWrapper, 0.2, {
      display: "none",
      autoAlpha: 0,
      scale: 0.95,
      y: -10,
    }, {
      display: "block",
      autoAlpha: 1,
      scale: 1,
      y: 0,
    }, "-=0.1");
  });
//Edit Button Animation
$('.edit').on('click',
  function() {
    tl.to($headerInfo, 0.2, {
      yPercent: -100,
      display: "none",
    });
    tl.to($lineListingWrapper, 0.2, {
      autoAlpha: 0,
      display: "none",
    }, "-=0.2");
    tl.to($actionList, 0.2, {
      autoAlpha: 0,
      scale: 0.95,
    });
    tl.fromTo($actionCompleteBar, 0.2, {
      autoAlpha: 0,
    }, {
      autoAlpha: 1
    });
     tl.fromTo($editContainer, 0.2, {
      autoAlpha: 0,
      display: "none",
    }, {
      autoAlpha: 1,
      display: "block",
    });
  });
//Done button animation
$('.done').on('click',
  function() {
     tl.fromTo($editContainer, 0.2, {
      autoAlpha: 1,
      display: "block",
    }, {
      autoAlpha: 0,
      display: "none",
    });
     tl.fromTo($actionCompleteBar, 0.2, {
      autoAlpha: 1,
    }, {
      autoAlpha: 0
    });
     tl.to($actionList, 0.2, {
      autoAlpha: 1,
      scale: 1,
    });
     tl.to($lineListingWrapper, 0.2, {
      autoAlpha: 1,
      display: "block",
    }, "-=0.2");
         tl.to($headerInfo, 0.2, {
      yPercent: 0,
      display: "block",
    }, "-=0.2");
});
//Done button animation
$('.back-button').on('click',
  function() {
      tl.fromTo($orderDetailsWrapper, 0.4, {
      display: "block",
      autoAlpha: 1,
      scale: 1,
      y: 0,
    }, {
      display: "none",
      autoAlpha: 0,
      scale: 0.95,
      y: -10,
    });
    tl.to($orderListingWrapper, 0.4, {
      autoAlpha: 1,
      scale: 1,
      display: "block",
    }, "-=0.3");

});