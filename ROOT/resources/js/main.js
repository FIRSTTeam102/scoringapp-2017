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
var team1, team2, team3, matchNum; //team and match numbers; updated in choosematch-finish
var alliance;

$(function(){
	initLogin();
	
});

function swap(page, refreshInput){
	//if(pages[page] == true){
		if(refreshInput == true){//If command is asked to refresh radio/checkboxes on the page, jQuery unchecks all checkboxes in the specified page.
			$('#' + page + " input").prop('checked', false);
		}
		$(currentPage).hide();
		currentPage = "#" + page; //Hides current page, sets new page, shows new page
		$(currentPage).show();
	//} //if the page has not been loeaded yet for some god forsaken reason :UUUas
		
	if(pages[page] == false){
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

function updateMatch(){
	
	$("#autonomous #team1").html(team1);
	$("#autonomous #team2").html(team2);
	$("#autonomous #team3").html(team3);
	
	$("#teleop #team1").html(team1);
	$("#teleop #team2").html(team2);
	$("#teleop #team3").html(team3);
	
	$("#postmatch #team1").html(team1);
	$("#postmatch #team2").html(team2);
	$("#postmatch #team3").html(team3);

	$("#autonomous #match").html(match);
	$("#teleop #match").html(match);
	$("##match").html(match);
}

function updateAlliance(){
	//all elements with alliance id are inside h1 tags. Blue class will highlight blue, Red class will highlight red
	$("#autonomous #alliance")[0].parentElement.className = alliance;

	$("#teleop #alliance")[0].parentElement.className = alliance;

	$("#postmatch #alliance")[0].parentElement.className = alliance;
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
					
					/*if(currentPage != "#alliance"){
						$(currentPage).hide(0, function(){
							
							$("#alliance").html(data.trim());
							currentPage = "#alliance";
						});
					}else{*/
						$("#alliance").html(data.trim());
					//}
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
			 //alert("asedlfj");
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
			
			/*if(currentPage != "#choosematch"){
				$(currentPage).hide(0, function(){
					
					$("#choosematch").html(data.trim());
					currentPage = "#choosematch";
				});
			}else{*/
				$("#choosematch").html(data.trim());
			//}
			pages["choosematch"] = true;
			
			$("#nav-choosematch").prop("disabled", false);
			
		}else if(status == "error"){
			alert("A choosematch error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function spontaneouslyDie(){ //blame Callahan.
	$(document.body).html("");
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
			
			/*if(currentPage != "#autonomous"){
				$(currentPage).hide(0, function(){
					
					$("#autonomous").html(data.trim());
					currentPage = "#autonomous";
				});
			}else{*/
				$("#autonomous").html(data.trim());
			//}
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
			
			/*if(currentPage != "#teleop"){
				$(currentPage).hide(0, function(){
					
					$("#teleop").html(data.trim());
					currentPage = "#teleop";
				});
			}else{*/
				$("#teleop").html(data.trim());
			//}
			
			pages["teleop"] = true;
			$("#nav-teleop").prop("disabled", false);
			
		}else if(status == "error"){
			alert("A teleop error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function requestPostMatch(){
	console.log("Requesting postmatch...");
	   $.post("postmatch.jsp",
	{
	
	},
	
	function(data, status, xhr) {
		//Sets the content div's contents to whatever the jsp page has on it.
		if(status == "success"){
			
			/*if(currentPage != "#postmatch"){
				$(currentPage).hide(0, function(){
					
					$("#postmatch").html(data.trim());
					currentPage = "#postmatch";
				});
			}else{*/
				$("#postmatch").html(data.trim());
			//}
			
			pages["postmatch"] = true;
			$("#nav-postmatch").prop("disabled", false);
			
		}else if(status == "error"){
			alert("A postmatch error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function finishPostmatch(){
	// stuff
	var T1Climb = $("input[name='chkTeam1ClimbedRope']:checked").val();
	var T2Climb = $("input[name='chkTeam2ClimbedRope']:checked").val();
	var T3Climb = $("input[name='chkTeam3ClimbedRope']:checked").val();
	
	var RotNum = $("input[name='rdoRotors']:checked").val();
	
	var NumFouls = $("input[id='txtNumFouls']").val();
	var NumFoulPts = $("input[id='txtNumFoulPts']").val();
	
	var Pts = $("input[id='txtPts']").val();
	var Pressure = $("input[id='txtPressure']").val();
	
	
	
	$.post("postmatch-finish.jsp",
			{
			   //throw in all the things 
				// remember to filter inputs on other end
				
				t1Climb: T1Climb,
				t2Climb: T2Climb,
				t3Climb: T3Climb,
				rotNum: RotNum,
				numFouls: NumFouls,
				numFoulPoints: NumFoulPts,
				pts: Pts,
				pressure: Pressure
			   
			}, function(data, status, xhr) {
				console.log("Received finishPostmatch");
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim()); 
					
				}else if(status == "error"){
					
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
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