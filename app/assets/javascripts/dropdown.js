"use strict";
// Not working when you come back from a different page or click the "Blog App" link
$(document).ready(function(){
  $("button").click(function(){
    $(".navbar-collapse").toggleClass("collapse");
  })
});
