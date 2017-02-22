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
	switch(button){
	case "success":
		var val = $("input[name='actionAttempt']:checked")[0].value;
		break;
		//finish this
	
	}
}

function post(info){
	//info is object
}