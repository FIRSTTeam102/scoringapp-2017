var loggedOn = false;

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
	   var redRadState = $("#rdoAllianceRed").is('checked');
	   $.post("alliance-finish.jsp",
		{
		   rdioRedChecked: redRadState 
		},
		
		function(data, status, xhr) {
			//Sets the content div's contents to whatever the jsp page has on it.
			//$("#content").html(data); 
			if(status == "success"){
				$("#content").append(data.trim());
			}else if(status == "error"){
				alert("An error occurred.");
				error("Error:" + xhr.status);
			}
		});
		
}); 
}

function requestChoosematch(){
		   event.preventDefault();//Stops refresh
		   $.post("chooseMatch.jsp",
			{
			
			},
			
			function(data, status, xhr) {
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					alert("requestChoosematch has run");
					$("#content").append(data.trim());
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
					$("#login").hide(0, function(){
						
						$("#content").append(data.trim());
					})
				}else if(status == "error"){
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
}