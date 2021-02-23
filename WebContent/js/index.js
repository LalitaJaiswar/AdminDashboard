/* function used for navigation bar in mobile view */
function calltomenu(){
	 $('.sidebar').toggleClass('active');
	 $('.main').toggleClass('dark');
	 
}

/* function for dark view on sidebar */
$(window).on('resize', function(){
    var win = $(this); //this = window
    if (win.width()>= 768) { 
    	$('.main').removeClass('dark');
        $('.sidebar').removeClass('active');
    }         
    });