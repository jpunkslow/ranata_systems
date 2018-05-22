<script type="text/javascript">
	// --------------- Testimonial Carousel -------------------
	// --------------------------------------------------------
	
	$('.carousel').carousel({
	  interval: 5000
	});

	// --------------- Testimonial Carousel -------------------
	// --------------------------------------------------------

	jQuery(document).ready(function($){
		$('.crsl-items').carousel({ visible: 5, itemMinWidth:171, itemMargin: 50 });
	});
   	// --------------------  Image Popup --------------------
	// --------------------------------------------------------
	
	$('.portfolio-items').magnificPopup({
	  delegate: 'a.zoom', // child items selector, by clicking on it popup will open
	  type: 'image'
	  // other options
	});

</script>