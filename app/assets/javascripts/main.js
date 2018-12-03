$( document ).ready(function() {

//
// Sticky Navbar
//

var NavbarSticky = (function() {

	// Variables

	var $nav = $('.navbar-sticky');


	// Methods

	function init($this) {

		var scrollTop = $(window).scrollTop(); // our current vertical position from the top

		// if we've scrolled more than the navigation, change its position to fixed to stick to top,
		// otherwise change it back to relative
		if (scrollTop > (navOffsetTop + 200)) {
			$this.addClass('sticky');
			$("#logo-nav").hide();
			$("#logo-nav-row").show();
			$("#button-sign-up").hide();
			$("#button-log-in").hide();
			$("#button-profile").hide();
			$("#button-sign-up-slim").show();
			$("#button-profile-slim").show();
			$("#button-log-in-slim").show();
		} else {
			$this.removeClass('sticky');
			$("#logo-nav").show();
			$("#logo-nav-row").hide();
			$("#button-sign-up").show();
			$("#button-log-in").show();
			$("#button-profile").show();
			$("#button-sign-up-slim").hide();
			$("#button-log-in-slim").hide();
			$("#button-profile-slim").hide();
		}
	}


	// Events

	if ($nav.length) {

        var navOffsetTop = $nav.offset().top;

		// Init sticky navbar
		init($nav);

		// re-calculate stickyness on scroll
		$(window).on({
			'scroll': function() {
				init($nav);
			}
		})
	}
})();


//
// Wavify
//

'use strict';

var Wavify = (function() {

	//
	// Variables
	//

	var $wavify = $('[data-toggle="wavify"]');


	//
	// Methods
	//

	function init($this) {
		var $path = $this.find('path');

		var options = {
			height: 50,
            bones: 5,
            amplitude: 40,
            speed: .15
		};

		$path.wavify(options);
	}


	//
	// Events
	//

	if ($wavify.length) {

		// Init selects
		$wavify.each(function() {
			init($(this));
		});
	}

})();

});