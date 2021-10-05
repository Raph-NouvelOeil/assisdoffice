/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */


$( ".ico-search" ).click(function() {
   $('#search_widget').toggleClass('active');
});





$(document).ready(function() {
	var HeightBloc = $('.text-presentation').height();
  $(".image-presentation").css('height',HeightBloc);
});