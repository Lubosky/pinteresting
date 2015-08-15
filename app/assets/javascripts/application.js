// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require masonry/jquery.infinitescroll
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(function(){

	var $container = $('#pins');

	$container.imagesLoaded(function(){
		$container.masonry({
			itemSelector: '.box',
		});
	});

	$container.infinitescroll({
		navSelector  : 'nav.pagination',    // selector for the paged navigation
		nextSelector : 'nav.pagination a[rel=next]',  // selector for the NEXT link (to page 2)
		itemSelector : '#pins .box',     // selector for all items you'll retrieve
		loading: {
				msgText: '',
				finishedMsg: '<em>No more Pins to load.</em>',
				img: '/images/default-spinner.gif'
			}
		},
		// trigger Masonry as a callback
		function( newElements ) {
			// hide new items while they are loading
			var $newElems = $( newElements ).css({ opacity: 0 });
			// ensure that images load before adding to masonry layout
			$newElems.imagesLoaded(function(){
				// show elems now they're ready
				$newElems.animate({ opacity: 1 });
				$container.masonry( 'appended', $newElems, true );
			});
		}
	);
	});