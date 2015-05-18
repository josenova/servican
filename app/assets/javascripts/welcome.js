

$(document).ready(function(){

/******************************************** WINDOW SCROLL ****************************************/

	$(window).scroll(function () {

		if ($(this).scrollTop() > 100) {

			$("#header").addClass("solid");
			$("#slogan h2").fadeOut(200);

		} 
		
		else {

			$("#header").removeClass("solid");
			$("#slogan h2").fadeIn(200);

		}

   });
   
   
   $('a[href^="#"]').on('click', function(event) {
    
    alert("ya");
});
   
/******************************************** PANEL RESIZE *****************************************/   
   
   //divResize();	
   
}); // END DOCUMENT READY









/****************************************** RESIZE FUNCTION *******************************************/



	function divResize() {
	  $('#slogan').css('min-height', $(window).height());
	}
	
	$(window).bind('resize', function () { 
    	setTimeout(function(){
      		divResize();
		},150);	
	});
                

