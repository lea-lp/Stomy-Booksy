$( document ).ready(function() {
   
   // Google Maps 
    
	var onMapMouseleaveHandler = function(event) {
		$('#map-notice').fadeIn(500);
		var elemento = $(this);
		elemento.on('click', onMapClickHandler);
		elemento.off('mouseleave', onMapMouseleaveHandler);
		$('.map-overlay').fadeIn(500);
	}
	var onMapClickHandler = function(event) {
		$('#map-notice').fadeOut(500);
		var elemento = $(this);
		elemento.off('click', onMapClickHandler);
		$('.map-overlay').fadeOut(500);
		elemento.on('mouseleave', onMapMouseleaveHandler);
	}
	$('.map.embed-container').on('click', onMapClickHandler);
	
});