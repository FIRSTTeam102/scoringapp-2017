var loggedOn = false;

$(function(){
	initLogin();
});

function remove(){
	//Any script returned from server has id 'self-destruct' and at the end of its code calling this function.
	//removes any script with id of 'self-destruct'
	$('#self-destruct').remove();
}

function requestChoosematch(){
	console.log("Requesting choosematch...");
	$.post("choosematch.jsp",
	{
		
	},
	function(data, status, xhr) {
		//Sets the content div's contents to whatever the jsp page has on it.
		//$("#content").html(data); 
		if(status == "success"){
			$("#alliance").hide(0, function(){
				
				$("#choosematch").append(data.trim());
			})
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
						
						$("#alliance").html(data.trim());
					})
				}else if(status == "error"){
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
}