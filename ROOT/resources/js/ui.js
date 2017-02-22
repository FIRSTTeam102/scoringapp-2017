$(window).resize(function() {
    if(this.resizeTO) clearTimeout(this.resizeTO);
    this.resizeTO = setTimeout(function() {
        $(this).trigger('resizeEnd');
    }, 50);
});

$(window).bind('resizeEnd', function() {
    //do something, window hasn't changed size in 500ms
	/*if(nav){
		if(window.innerWidth < 800){
			toggleSidenav();
		}
	}else{
		if(window.innerWidth > 800)
	}*/
});


function toggleSidenav(){
	if(!nav){ //if nav = false, nav must be opened
		if(window.innerWidth < 800){
			$("#sidenav").css("width", "100%");
			$("#sidenav").css("padding-left", "0px");
			nav = true;
		}else{
			$("#sidenav").css("width", "16%");
			$("#sidenav").css("padding-left", "20px");
			$("#content").css("margin-left", "19%");
			nav = true;
		}
		
	}else{	
		
		$("#sidenav").css("width", "0%");
		$("#sidenav").css("padding-left", "0px");
		$("#content").css("margin-left", "10%");
		nav = false;
		
	}
}
