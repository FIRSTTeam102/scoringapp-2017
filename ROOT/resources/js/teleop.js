var selectedTeam;
var selectedTeamNumber;
$(function(){
	
	$("#teleop #team1").click(function(){
		unHighlight(selectedTeam);
		selectedTeam = this;
		selectedTeamNumber = team1;
		highlight(this);
	});
	$("#teleop #team2").click(function(){
		unHighlight(selectedTeam);
		selectedTeam = this;
		selectedTeamNumber = team2;
		highlight(this);
	});
	$("#teleop #team3").click(function(){
		unHighlight(selectedTeam);
		selectedTeam = this;
		selectedTeamNumber = team3;
		highlight(this);
	});
	
	$("#btnSubSuccCycle").click(function(){
		subTeleCycle("success");
	});
	$("#btnSubFailCycle").click(function(){
		subTeleCycle("fail");
	});
	$("#btnBrokeDown").click(function(){
		subTeleCycle("broke");
	});
	$("#btnOnline").click(function(){
		subTeleCycle("online");
	})
	$("#btnFinishTeleop").click(function(){
		finishTeleop();
	});
});

function highlight(element){
	$(element).css("background", "red");
}

function unHighlight(element){
	$(element).css("background", "none");
}

function subTeleCycle(button){
	//Hi Jordan! I went with the switch, but as you can see, it's pretty much useless...
	var val;
	switch(button){
	case "success":
		console.log(button);
		val = $("input[name='actionAttempt']:checked")[0].value;//holds value of button clicked; not necessary (and can't be used) with broke down and back online
		$.post("teleop-cycle.jsp",
				{
					clickedButton: button,
					action: val
				},
				function(data, status, xhr) {
					if(status == "success"){
					//clear all checkboxes... for now, I'll just reload teleop again?	
						requestTeleop();	
					}else if(status == "error"){
						alert("A teleop error occurred.");
						error("Error:" + xhr.status);
					}
				});
			
		break;
	case "fail":
		console.log(button);
		val = $("input[name='actionAttempt']:checked")[0].value;//holds value of button clicked; not necessary (and can't be used) with broke down and back online
		$.post("teleop-cycle.jsp",
				{
					clickedButton: button,
					action: val
				},
				function(data, status, xhr) {
					if(status == "success"){
					//clear all checkboxes... for now, I'll just reload teleop again?	
						requestTeleop();
					}else if(status == "error"){
						alert("A teleop error occurred.");
						error("Error:" + xhr.status);
					}
				});
		
		break;
	
	case "broke":
		console.log(button);
		var val = "broke"
		$.post("teleop-cycle.jsp",
				{
					clickedButton: button,
					action: val
				},
				function(data, status, xhr) {
					if(status == "success"){
					//clear all checkboxes, etc... for now, I'll just reload teleop again?	
						requestTeleop();	
					}else if(status == "error"){
						alert("A teleop error occurred.");
						error("Error:" + xhr.status);
					}
				});
		
		break;
	
	case "online":
		console.log(button);
		var val = "online"
		$.post("teleop-cycle.jsp",
				{
					clickedButton: button,
					action: val
				},
				function(data, status, xhr) {
					if(status == "success"){
					//clear all checkboxes, etc... for now, I'll just reload teleop again?	
					requestTeleop();	
					}else if(status == "error"){
						alert("A teleop error occurred.");
						error("Error:" + xhr.status);
					}
				});
		break;

	
	}
}

function post(info){//what's this for?
	//info is object
}