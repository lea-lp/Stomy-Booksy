$(document).ready(function () {

	$('#jquery').hide()
	$('#hidden').click(function () {
		$('#jquery').toggle(500);
	});

	/// Wavify
	'use strict';
	var Wavify = (function () {
		// Variables
		var $wavify = $('[data-toggle="wavify"]');
		// Methods
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

		// Events
		if ($wavify.length) {
			// Init selects
			$wavify.each(function () {
				init($(this));
			});
		}

	})();

	/// Negative margin
	'use strict';

	var NegativeMargin = (function () {
		// Variables
		var $item = $('[data-negative-margin]');
		// Methods
		function init($this) {
			var $target = $this.find($($this.data('negative-margin'))),
				height = $target.height();

			console.log(height)
			if ($(window).width() > 991) {
				$this.css({ 'margin-top': '-' + height + 'px' });
			}
			else {
				$this.css({ 'margin-top': '0' });
			}
		}
		// Events
		$(window).on({
			'load resize': function () {
				if ($item.length) {
					$item.each(function () {
						init($(this));
					});
				}
			}
		})

	})();

	/// Sticky
	'use strict';

	var Sticky = (function () {
		// Variables
		var $sticky = $('[data-toggle="sticky"]');
		// Methods
		function init($this) {

			var offset = $this.data('sticky-offset') ? $this.data('sticky-offset') : 0;
			var options = {
				'offset_top': offset
			};

			$this.stick_in_parent(options);
		}
		// Events
		if ($sticky.length) {
			// Init selects
			$sticky.each(function () {
				init($(this));
			});
		}

	})();

	/// Wavify
	'use strict';

	var Wavify = (function () {
		// Variables
		var $wavify = $('[data-toggle="wavify"]');
		// Methods
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
		// Events
		if ($wavify.length) {
			// Init selects
			$wavify.each(function () {
				init($(this));
			});
		}

	})();


	// Typed
	'use strict';

	var Typed = (function () {
		// Variables
		var typed = '.typed',
			$typed = $(typed);
		// Methods
		function init($this) {
			var el = '#' + $this.attr('id'),
				strings = $this.data('type-this'),
				strings = strings.split(',');

			var options = {
				strings: strings,
				typeSpeed: 100,
				backSpeed: 70,
				loop: true
			};

			var animation = new Typed(el, options);

			inView(el).on('enter', function () {
				animation.start();
			}).on('exit', function () {
				animation.stop();
			});
		}
		// Events
		if ($typed.length) {
			$typed.each(function () {
				init($(this));
			});
		}

	})();

});