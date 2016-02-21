function setNavbarFixed(){
  if (/ipad/i.test(navigator.userAgent.toLowerCase()))
    $(".navbar.navbar-inverse").addClass("navbar-fixed-top");
  else if (/iphone|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()))
      $(".navbar.navbar-inverse").addClass("navbar-fixed-top");
  else
    $(".navbar.navbar-inverse").removeClass("navbar-fixed-top");
}

function ezRtable(){
  if($('.table-ezr').length){
    var headertext = [],
    headers = document.querySelectorAll(".table-ezr .th-erz"),
    tablebody = document.querySelector(".table-ezr tbody");
    
    for(var i = 0; i < headers.length; i++) {
      var current = headers[i];
      headertext.push(current.textContent.replace(/\r?\n|\r/,""));
    } 
    for (var i = 0, row; row = tablebody.rows[i]; i++) {
      var ht = 0;
      for (var j = 0, col; col = row.cells[j]; j++) {
        if ( col.className == "td-erz" )
          col.setAttribute("data-th", headertext[ht++]);
      } 
    }
  }
}

$(document).ready(function() {
  setNavbarFixed();
  
  ezRtable();
});