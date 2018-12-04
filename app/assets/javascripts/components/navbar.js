$( document ).ready(function() {


// Sticky Navbar
var NavbarSticky = (function() {
    // Variables
    var $nav = $('.navbar-sticky');
    // Methods
    function init($this) {
        var scrollTop = $(window).scrollTop(); // our current vertical position from the top
        // if we've scrolled more than the navigation, change its position to fixed to stick to top,
        // otherwise change it back to relative
        if (scrollTop > (navOffsetTop)) {

            $this.addClass('sticky');

            $("#logo-nav").hide();
            $("#logo-nav-row").show();

            $("#button-sign-up").hide();
            $("#button-sign-up-slim").show();

            $("#button-log-in").hide();
            $("#button-log-in-slim").show();

            $("#button-profile").hide();
            $("#button-profile-slim").show();

        } else {
            $this.removeClass('sticky');

            $("#logo-nav").show();
            $("#logo-nav-row").hide();

            $("#button-sign-up").show();
            $("#button-sign-up-slim").hide();

            $("#button-log-in").show();
            $("#button-log-in-slim").hide();
            
            $("#button-profile").show();
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

});