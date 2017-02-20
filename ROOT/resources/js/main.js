var loggedOn = false;
var currentPage = "#login"; //currentPage makes it easier to switch pages
var pages = {
		login: true,
		alliance: false,
		choosematch: false, //Choosematch should stay false
		autonomous: false,
		postmatch: false,
		//vvv extra pages
		lighter: true //element is already embedded into html and is hidden
};
var nav = false;

$(function(){
	initLogin();
	
});

function swap(page, refreshInput){
	if(pages[page] == true){
		if(refreshInput == true){//If command is asked to refresh radio/checkboxes on the page, jQuery unchecks all checkboxes in the specified page.
			$('#' + page + " input").prop('checked', false);
		}
		$(currentPage).hide();
		currentPage = "#" + page; //Hides current page, sets new page, shows new page
		$(currentPage).show();
	}else{
		switch(page){
		case "login":
			console.error("Login page was marked as false???");
			break;
		case "alliance":
			requestAllianceSelection();
			break;
		case "choosematch":
			requestChoosematch();
			break;
		case "autonomous":
			requestAutonomous();
			break;
		case "teleop":
			requestTeleop();//doesn't exist yet
			break;
		case "postmatch":
			requestPostMatch();//doesn't exist yet
			break;
		default:
			console.error("Unknown page requested to load");
		}
	}
}

function navSwap(page, refreshInput){ //Used to check whether the nav buttons are disabled or not, then passes the same request to swap() if it is not disabled
	if($("#nav-"+page).prop("disabled") == false){
		swap(page, refreshInput);
	}
}

function toggleSidenav(){
	if(!nav){ //if nav = false, nav must be opened
		
		$("#sidenav").css("width", "16%");
		$("#sidenav").css("padding-left", "20px");
		$("#content").css("margin-left", "19%");
		nav = true;
		
	}else{	
		
		$("#sidenav").css("width", "0%");
		$("#sidenav").css("padding-left", "0px");
		$("#content").css("margin-left", "10%");
		nav = false;
		
	}
}

function remove(){
	//Any script returned from server has id 'self-destruct' and at the end of its code calling this function.
	//removes any script with id of 'self-destruct'
	$('#self-destruct').remove();
}

function requestAllianceSelection(){
	console.log("Requesting allianceselection...");
	$.post("alliance.jsp",
			{
				
			},
			function(data, status, xhr) {
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					
					if(currentPage != "#alliance"){
						$(currentPage).hide(0, function(){
							
							$("#alliance").html(data.trim());
							currentPage = "#alliance";
						});
					}else{
						$("#alliance").html(data.trim());
					}
					pages["alliance"] = true; //Sets it that alliance-sel is loaded
					
					$("#nav-alliance").prop("disabled", false);
						
			}else if(status == "error"){
					error("Error:" + xhr.status);
					alert("An allianceSelection error occurred.");
				}
			});
}

function finishAlliance() {
	console.log("beginning finishAlliance");
   var rdoAlliance = $("input[name='rdoAlliance']:checked").val();//should be a string either "Red" or "Blue"
   console.log("rdoAlliance = " + rdoAlliance);
   $.post("alliance-finish.jsp",
	{
	   selAlliance: rdoAlliance 
	}, function(data, status, xhr) {
		console.log("Received finishAlliance");
		//Sets the content div's contents to whatever the jsp page has on it.
		//$("#content").html(data); 
		if(status == "success"){
			$("#content").append(data.trim()); //alliance-finish will return scripts
			
		}else if(status == "error"){
			
			alert("An error occurred.");
			error("Error:" + xhr.status);
		}
	});
	console.log("Requested finishAlliance");

}

function requestChoosematch(){
	console.log("Requesting Choosematch...");
	   $.post("choosematch.jsp",
	{
	
	},
	
	function(data, status, xhr) {
		//Sets the content div's contents to whatever the jsp page has on it.
		//$("#content").html(data); 
		if(status == "success"){
			
			if(currentPage != "#choosematch"){
				$(currentPage).hide(0, function(){
					
					$("#choosematch").html(data.trim());
					currentPage = "#choosematch";
				});
			}else{
				$("#choosematch").html(data.trim());
			}
			pages["choosematch"] = true;
			
			$("#nav-choosematch").prop("disabled", false);
			
		}else if(status == "error"){
			alert("A choosematch error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function finishChoosematch() {
	console.log("starting finishChoosematch()");
	var theMatch = $("input[name='rdoMatch']:checked").val();
	if (theMatch== null) {
		alert("Please select a match!");
	}else {
	console.log(theMatch);

	$.post("choosematch-finish.jsp",
			{
			   rdoMatch: theMatch 
			   
			}, function(data, status, xhr) {
				console.log("Received finishChoosmatch");
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim()); //alliance-finish will return scripts
					
				}else if(status == "error"){
					
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
			console.log("Requested finishChoosematch");
	}
}

function requestAutonomous(){
	console.log("Requesting autonomous...");
	   $.post("autonomous.jsp",
	{
	
	},
	
	function(data, status, xhr) {
		//Sets the content div's contents to whatever the jsp page has on it.
		//$("#content").html(data); 
		if(status == "success"){
			
			if(currentPage != "#autonomous"){
				$(currentPage).hide(0, function(){
					
					$("#autonomous").html(data.trim());
					currentPage = "#autonomous";
				});
			}else{
				$("#autonomous").html(data.trim());
			}
			pages["autonomous"] = true;
			
			$("#nav-autonomous").prop("disabled", false);
			
		}else if(status == "error"){
			alert("An autonomous error occurred.");
			error("Error:" + xhr.status);
		}
	});
}



function requestTeleop(){
	console.log("Requesting teleop...");
	   $.post("teleop.jsp",
	{
	
	},
	
	function(data, status, xhr) {
		//Sets the content div's contents to whatever the jsp page has on it.
		if(status == "success"){
			
			if(currentPage != "#teleop"){
				$(currentPage).hide(0, function(){
					
					$("#teleop").html(data.trim());
					currentPage = "#teleop";
				});
			}else{
				$("#teleop").html(data.trim());
			}
			
			pages["teleop"] = true;
			$("#nav-teleop").prop("disabled", false);
			
		}else if(status == "error"){
			alert("A teleop error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function finishTeleop(){
	console.error("finishteleop not made yet");
}

function requestPostMatch(){
	console.error("requestpostmatch not made yet");
}

function finishPostMatch(){
	console.error("finishpostmatch not made yet");
}

function lighter(color){
	if(color == "blue"){
		$("#content").hide();
		$("#back").show();
		document.body.className = "blueLighter";
	}else if(color == "red"){
		document.body.className = "redLighter";
		$("#content").hide();
		$("#back").show();
	}else{
		$("#back").hide();
		$("#content").show();
		document.body.className = "";
		swap('login', false);
	}
}

function subTeleCycle() {
	console.error("Not implemented yet!");
	
}

