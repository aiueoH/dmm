$(document).ready(function() {
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
});