var loggedOn = false;
var currentPage = "#login"; //currentPage makes it easier to switch pages
var login = false,
alliance = false,
choosematch = false,
autonomous = false,
teleop = false;


$(function(){
	initLogin();
	finishAlCallChoosematch();
});

function remove(){
	//Any script returned from server has id 'self-destruct' and at the end of its code calling this function.
	//removes any script with id of 'self-destruct'
	$('#self-destruct').remove();
}

function finishAlCallChoosematch() {
	$("CompetitionForm").on("submit", function(e) {
		   //to finish alliance
		   event.preventDefault();//Stops refresh
		   console.log("beginning finishAlliance part of finishAlCallChoosematch");
		   var rdoAlliance = $("input[name='rdoAlliance']:checked").val();//A String either "Red" or "Blue"
		   $.post("alliance-finish.jsp",
			{
			   selAlliance: rdoAlliance 
			},
			
			function(data, status, xhr) {
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim()); //alliance-finish will return scripts
					
				}else if(status == "error"){
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});

		//Start move to choosematch
		console.log("Requesting Choosematch from within finishAlCallChoosematch...");
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
	});
}
function finishAlliance() {
	$("#CompetitionForm").on("submit", function(event) {
		
		event.preventDefault();//Stops refresh
		console.log("beginning finishAlliance()");
	   var rdoAlliance = $("input[name='rdoAlliance']:checked").val();//should be a string either "Red" or "Blue"
	   $.post("alliance-finish.jsp",
		{
		   selAlliance: rdoAlliance 
		},
		
		function(data, status, xhr) {
			//Sets the content div's contents to whatever the jsp page has on it.
			//$("#content").html(data); 
			if(status == "success"){
				$("#content").append(data.trim()); //alliance-finish will return scripts
				
			}else if(status == "error"){
				alert("An error occurred.");
				error("Error:" + xhr.status);
			}
		});
		
}); 
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

function requestAllianceSelection(){
	console.log("Requesting alliance...");
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
