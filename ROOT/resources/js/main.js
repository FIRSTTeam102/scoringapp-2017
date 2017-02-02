var loggedOn = false;

$(function(){
	initLogin();
});

function remove(){
	$('#self-destruct').remove();
}

function requestChoosematch(){
	$.post("choosematch.jsp",
	{
		
	},
	function(data, status, xhr) {
		//Sets the content div's contents to whatever the jsp page has on it.
		//$("#content").html(data); 
		if(status == "success"){
			$("#alliance").hide(0, function(){
				
				$("#content").append(data.trim());
			})
		}else if(status == "error"){
			alert("An error occurred.");
			error("Error:" + xhr.status);
		}
	});
}

function requestAllianceSelection(){
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