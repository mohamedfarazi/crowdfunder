jQuery(document).ready(function($) {

$('#pledge_bp').parent().css({'background-color': '#FFFFFF'});

$('.pledge_button').click(function() {

	$('.pledge_button').notify("Pledged", 'success');
  $('.pledge_button').hide();
  // $(this).closest("div").addClass("pledge_bp");
});




});