function setNavbarFixed(){
  if (/ipad/i.test(navigator.userAgent.toLowerCase()))
    $(".navbar.navbar-inverse").addClass("navbar-fixed-top");
  else if (/iphone|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()))
      $(".navbar.navbar-inverse").addClass("navbar-fixed-top");
  else
    $(".navbar.navbar-inverse").removeClass("navbar-fixed-top");
}

$(document).ready(function() {
  setNavbarFixed();
});