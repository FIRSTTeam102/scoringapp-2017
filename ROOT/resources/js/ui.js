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
			$("#sidenav").css("height", "initial");
			//$("#sidenav").css("padding-left", "0px");
			nav = true;
		}else{
			$("#sidenav").css("width", "185px");
			$("#sidenav").css("padding-left", "20px");
			$("#content").css("margin-left", "19%");
			nav = true;
		}
		
	}else{	
		if(window.innerWidth < 800){
			$("#sidenav").css("height", "0px");
			nav = false;
		}else{
			$("#sidenav").css("width", "0%");
			$("#sidenav").css("padding-left", "0px");
			$("#content").css("margin-left", "10%");
			nav = false;
		}
		
	}
}
