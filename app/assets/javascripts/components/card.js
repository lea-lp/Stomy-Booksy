$( document ).ready(function() {

'use strict';

var CardActions = (function() {

	var $card = $(".card"),
		actions = '.card-product-actions';

	function show($this) {
		var $el = $this.find(actions),
        	animation = $el.data('animation-in');

        if ($el.length) {
            $el.addClass('in animated ' + animation);
            $el.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
                $el.removeClass('animated ' + animation);
            });
		}
	}

	function hide($this) {
		var $el = $this.find(actions),
			animation = $el.data('animation-out');

		if ($el.length) {
			$el.addClass('animated ' + animation);
			$el.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$el.removeClass('in animated ' + animation);
			});
		}
	}

	if ($card.length && $(actions).length) {
		$card.on({
    		'mouseenter': function() {
    			show($(this));
    		}
    	})

		$card.on({
    		'mouseleave': function() {
    			hide($(this));
    		}
    	})
	}

})();

});