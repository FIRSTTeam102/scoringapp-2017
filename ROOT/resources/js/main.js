var loggedOn = false;
var currentPage = "#login"; //currentPage makes it easier to switch pages

$(function(){
	initLogin();
});

function remove(){
	//Any script returned from server has id 'self-destruct' and at the end of its code calling this function.
	//removes any script with id of 'self-destruct'
	$('#self-destruct').remove();
}

function finishAlliance() {
	$("#CompetitionForm").on("submit", function(event) {
	   event.preventDefault();//Stops refresh
	   var rdoAlliance = $("input[name='rdoAlliance']:checked").val();
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
			$(currentPage).hide(0, function(){
				
				$("#choosematch").html(data.trim());
				currentPage = "#choosematch";
			});
			
		}else if(status == "error"){
			alert("An error occurred.");
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
					$(currentPage).hide(0, function(){
						
						$("#alliance").html(data.trim());
						currentPage = "#alliance";
					});
						
			}else if(status == "error"){
					error("Error:" + xhr.status);
					alert("An error occurred.");
				}
			});
}
