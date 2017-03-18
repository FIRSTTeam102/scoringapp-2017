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

var bestTeam = document.getElementsByClassName("best_team");
var highlightColor = "#FFA812";
var unlightColor = "#573B1F";
function highlight() {
	for (var i = 0; i < bestTeam.length; i++) {
		bestTeam[i].style.borderColor = highlightColor;
		bestTeam[i].style.boxShadow = "0px 0px 5px #FFA812";
	}
	setTimeout(function() {
		unlight();
	}, 500);
}
function unlight() {
	for (var i = 0; i < bestTeam.length; i++) {
		bestTeam[i].style.borderColor = unlightColor;
		bestTeam[i].style.boxShadow = "0px 0px 0px #FFA812";
	}
	setTimeout(function() {
		highlight();
	}, 500);
}
highlight();

function swap(page, refreshInput){

	/*
	//if(pages[page] == true){
		if(refreshInput == true){//If command is asked to refresh radio/checkboxes on the page, jQuery unchecks all checkboxes in the specified page.
			$('#' + page + " input").prop('checked', false);
		}
		$(currentPage).hide();
		currentPage = "#" + page; //Hides current page, sets new page, shows new page
		$(currentPage).show();
	//} //if the page has not been loeaded yet for some god forsaken reason :UUUas
	if(page == "autonomous" || page == "teleop" || page == "postmatch"){
		updateMatch();
		updateAlliance();
	}else if(page == "choosematch"){
		updateAlliance();
	}
			
		
	if(pages[page] == false){*/
		switch(page){
		case "login":
			$("#login input").prop('checked', false);
			$(currentPage).hide();
			currentPage = "#login"; //Hides current page, sets new page, shows new page
			$(currentPage).show();
			console.log("Switched to login page, probably from nav");
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
		case "survey":
			requestSurvey();
			break;
		case "standings":
			requestStandings();
			break;
		case "preview":
			requestPreview();
			break;
		case "upcoming":
			requestUpcoming();
			break;
		case "lighter":$(currentPage).hide();
			currentPage = "#lighter"; //Hides current page, sets new page, shows new page
			$(currentPage).show();
			console.log("Switched to lighter page, probably from nav");
			break;
		default:
			console.error("Unknown page requested to load");
		}
	//}
}

function navSwap(page, refreshInput){ //Used to check whether the nav buttons are disabled or not, then passes the same request to swap() if it is not disabled
	if($("#nav-"+page).prop("disabled") == false){
		swap(page, refreshInput);
	}
}

function updateMatch(){
	//Complete shit, never use this again
	console.warn("updateMatch called from somewhere");
}

function updateAlliance(){
	//Complete shit, never use this again -joe
	console.warn("updateAlliance called from somewhere");
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
							$("#alliance").show();
						});
					}else{
						$("#alliance").html(data.trim());
					}
					pages["alliance"] = true; //Sets it that alliance-sel is loaded
					
					$("#nav-alliance").prop("disabled", false);
					$("#alliance").show();
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
			
			if(currentPage != "#choosematch"){
				$(currentPage).hide(0, function(){
					
					$("#choosematch").html(data.trim());
					currentPage = "#choosematch";
					$("#choosematch").show();
					
					//easter egg lel
					bestTeam = [];
					for(var i = 0; i < $(".team_holder").length; i++){
						if($(".team_holder")[i].innerHTML.trim() == "102"){
							bestTeam.push($(".team_holder")[i]);
							//$(".team_holder")[i].className += " best_team";
						}
					}
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
			
			if(currentPage != "#autonomous"){
				$(currentPage).hide(0, function(){
					
					$("#autonomous").html(data.trim());
					currentPage = "#autonomous";
					$("#autonomous").show();
				});
			}else{
				$("#autonomous").html(data.trim());
			}
			pages["autonomous"] = true;
			
			$("#nav-autonomous").prop("disabled", false);
			$("#autonomous").show();
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
					$("#teleop").show();
				});
			}else{
				$("#teleop").html(data.trim());
			}
			
			pages["teleop"] = true;
			$("#nav-teleop").prop("disabled", false);
			$("#teleop").show()
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
			
			if(currentPage != "#postmatch"){
				$(currentPage).hide(0, function(){
					
					$("#postmatch").html(data.trim());
					currentPage = "#postmatch";
					$("#postmatch").show();
				});
			}else{
				$("#postmatch").html(data.trim());
			}
			
			pages["postmatch"] = true;
			$("#nav-postmatch").prop("disabled", false);
			$("#postmatch").show();
		}else if(status == "error"){
			alert("A postmatch error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function finishPostmatch(){
	// stuff
	var t1Climb = $("input[name='chkTeam1ClimbedRope']:checked").val();
	var t2Climb = $("input[name='chkTeam2ClimbedRope']:checked").val();
	var t3Climb = $("input[name='chkTeam3ClimbedRope']:checked").val();
	
	var RotNum = $("input[name='rdoRotors']:checked").val();
	
	var NumFouls = $("input[id='txtNumFouls']").val();
	var NumFoulPts = $("input[id='txtNumFoulPts']").val();
	
	var Pts = $("input[id='txtPts']").val();
	var Pressure = $("input[id='txtPressure']").val();
	
	var ignore = $("#chkIgnoreMatch").prop("checked");
	
	$.post("postmatch-finish.jsp",
			{
			   //throw in all the things 
				// remember to filter inputs on other end
				
				t1Climb: t1Climb,
				t2Climb: t2Climb,
				t3Climb: t3Climb,
				rotNum: RotNum,
				numFouls: NumFouls,
				numFoulPoints: NumFoulPts,
				pts: Pts,
				pressure: Pressure,
			   
				ignore: ignore
				
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

function requestSurvey(){
	/*
	$.post("http://team102.net/public_html/2017/survey.php",{
		//No input necessary
	}, function(data, status, xhr){
		console.log("Received survey");
		
		if(status == "success"){
			
			if(currentPage != "#survey"){
				$(currentPage).hide(0, function(){
					
					//data.trim returns whole tree, parseHTML returns array of html stuff inside it, 15 is what we need
					$("#survey").html($.parseHTML(data.trim())[15]);
					currentPage = "#survey";
					$("#survey").show();
				});
			}else{
				
				$("#survey").html($.parseHTML(data.trim())[15]);
			}
		}else if(status == "error"){
			
			alert("An error occurred.");
			error("Error:" + xhr.status);
		}
	});*/
	if(currentPage != "#survey"){
		$(currentPage).hide(0, function(){
			
			$("#survey").html("<iframe src='http://team102.net/public_html/2017/survey-iframe.php'/>");
			currentPage = "#survey";
			$("#survey").show();
		});
	}else{
		
		$("#survey").html("<iframe src='http://team102.net/public_html/2017/survey-iframe.php'/>");
	}
}

function requestPreview(){

	if(currentPage != "#preview"){
		$(currentPage).hide(0, function(){
			
			$("#preview").html("<iframe src='http://team102.net/public_html/2017/preview-iframe.php'/>");
			currentPage = "#preview";
			$("#preview").show();
		});
	}else{
		
		$("#standings").html("<iframe src='http://team102.net/public_html/2017/standings-iframe.php'/>");
	}
}

function requestStandings(){

	if(currentPage != "#standings"){
		$(currentPage).hide(0, function(){
			
			$("#standings").html("<iframe src='http://team102.net/public_html/2017/standings-iframe.php'/>");
			currentPage = "#standings";
			$("#standings").show();
		});
	}else{
		
		$("#standings").html("<iframe src='http://team102.net/public_html/2017/standings-iframe.php'/>");
	}
}

function requestUpcoming(team){
	
	if(!team){
		team = 102;
	}
	
	if(currentPage != "#upcoming"){
		$(currentPage).hide(0, function(){
			
			$("#upcoming").html("<iframe src='http://team102.net/public_html/2017/upcoming-iframe.php?team=" + team + "'/>");
			currentPage = "#upcoming";
			$("#upcoming").show();
		});
	}else{
		
		$("#upcoming").html("<iframe src='http://team102.net/public_html/2017/upcoming-iframe.php'/>");
	}
}