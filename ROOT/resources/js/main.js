var loggedOn = false;
var currentPage = "#login"; //currentPage makes it easier to switch pages
var pages = {
		login: true,
		alliance: false,
		choosematch: false,
		autonomous: false,
		postmatch: false,
		//vvv extra pages
		lighter: true //element is already embedded into html and is hidden
};

$(function(){
	initLogin();
	
});

function swap(page, refreshInput){
	if(pages[page] == true){
		if(refreshInput == true){//If command is asked to refresh radio/checkboxes on the page, jQuery unchecks all checkboxes in the specified page.
			$('#' + page + " input").prop('checked', false);
		}
		$(currentPage).hide();
		currentPage = "#" + page; //Hides current page, sets new page, loads new page
		$(currentPage).show();
	}else{
		switch(page){
		case "login":
			console.error("Login page was marked as false???");
		case "alliance":
			requestAllianceSelection();
		case "choosematch":
			requestChoosematch();
		case "autonomous":
			requestAutonomous();//doesn't exist yet
		case "teleop":
			requestTeleop();//doesn't exist yet
		case "postmatch":
			requestPostMatch();//doesn't exist yet
		case "lighter":
			requestLighterPage();
		default:
			console.error("Unknown page requested to load");
		}
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
					console.log("Successfully loaded AllianceSelection");
					if(currentPage != "#alliance"){
						$(currentPage).hide(0, function(){
							
							$("#alliance").html(data.trim());
							currentPage = "#alliance";
						});
					}else{
						$("#alliance").html(data.trim());
					}
						
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
		console.log("Received post thing");
		//Sets the content div's contents to whatever the jsp page has on it.
		//$("#content").html(data); 
		if(status == "success"){
			$("#content").append(data.trim()); //alliance-finish will return scripts
			console.log("Post success");
		}else if(status == "error"){
			
			alert("An error occurred.");
			error("Error:" + xhr.status);
		}
	});
	console.log("Submitted post");

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
			console.log("Successfully loaded Choosematch");
			if(currentPage != "#choosematch"){
				$(currentPage).hide(0, function(){
					
					$("#choosematch").html(data.trim());
					currentPage = "#choosematch";
				});
			}else{
				$("#choosematch").html(data.trim());
			}
			
		}else if(status == "error"){
			alert("A choosematch error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function finishChoosematch() {
	console.log("starting finishChoosematch()");
	var theMatch = $("input[name='rdoMatch']:checked").val();
	$.post("choosematch-finish.jsp",
			{
			   rdoMatch: theMatch 
			}, function(data, status, xhr) {
				console.log("Received post thing");
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim()); //alliance-finish will return scripts
					console.log("Post success");
				}else if(status == "error"){
					
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
			console.log("Submitted post");
	
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