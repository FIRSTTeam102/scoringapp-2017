/*UNFINISHED FUNCTION THING MAKES ARRAY OF INPUT ELEMENTS AND MAKES NEW ARRAY OF THEIR IDS + WHETHER THEY ARE CHECKED OR NOT
 * 
 * var autoChkInput = $("#autonomous input");
var arrayOut = [];
for(var i = 0; i < arr.length; i++){
	arrayOut[i] = autoChkInput[i].id + " " + autoChkInput[i].checked;
}
 * 
 * 
 */
function finishAutonomous(){
	if ( $("input[name='pilot1Select']:checked").val() == null || $("input[name='pilot2Select']:checked").val() == null ) {
		alert("Team pilots have not been selected!");
		
	} else{
		
		var autoChkInput = $("#autonomous input");
		var arrayOut = [];
		
		for(var i = 0; i < autoChkInput.length; i++){
			arrayOut[i] = autoChkInput[i].id + " " + autoChkInput[i].checked;
		}
		
		var autoData = arrayOut.toString();
		console.log("autoData: " + autoData);
		
		$.post("autonomous-finish.jsp",
			{
				autoData: autoData
			}
			,function(data, status, xhr) {
				console.log("Received finishAutonomous");
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim()); 
					console.log("finishAutonomous successful");
				}else if(status == "error"){
					
					alert("An error occurred on finishAutonomous.");
					error("Error:" + xhr.status);
				}
			});	
	}
}

function finishAutonomousOld(){
	if (($("input[name='pilot1Select']:checked").val() != null)&&($("input[name='pilot2Select']:checked").val() != null)) {
	console.log("starting finishAutonomous()");
	
	
	var alPilot1 = $("input[name='pilot1Select']:checked").val();
	var alPilot2 = $("input[name='pilot1Select']:checked").val();
	
	//t1NoShow not implemented yet
	//t2NoShow t3NoShow
	
	//t1XbaseLn t2XbaseLn t3XbaseLn
	var t1XbaseLn = $("input[name='chkTeam1Cross']:checked").val();
	
	//t1AttGear t2AttGear t3AttGear
	var t1AttGear = $("input[name='chkTeam1AttGear']:checked").val();
	//t1RGS t2RGS t3RGS //R(obot)G(ear)S(uccess)
	var t1RGS = $("input[name='chkTeam1RobotGearSucc']:checked").val();
	//t1HGS t2HGS t3HGS //Human gear success
	var t1HGS = $("input[name='chkTeam1HumanGearSucc']:checked").val();
	//t1AttShot t2AttShot t3AttShot //attempted shot (which goal)
	//var t1AttShot = $("input[name='']:checked").val();
	//t1SS t2SS t3SS //Shot success/fail
	//var t1SS = $("input[name='']:checked").val(); 
	$.post("autonomous-finish.jsp",
			{
			pilot1: alPilot1,
			pilot2: alPilot2,
			//
			//  t1Baseline: t1Xbaseln,
			//	t2Baseline: t2Xbaseln,
	    	//  t3Baseline: t3Xbaseln,
			 
			//  t1AttemptedGear: t1AttGear,
			//	t2AttemptedGear: t2AttGear,
			//	t3AttemptedGear: t3AttGear,
			 
			//	t1RoboGearSucc: t1RGS,
			//	t2RoboGearSucc: t2RGS,
		    //  t3RoboGearSucc: t3RGS,
			
			//  t1HuGearSucc: t1HGS,
			//	t2HuGearSucc: t2HGS,
			//  t3HuGearSucc: t3HGS,
		
			//  t1AttemptedShot: t1AttShot,
			//  t2AttemptedShot: t2AttShot,
			//  t3AttemptedShot: t3AttShot,
			
			//  t1ShotSucc: t1SS,
			//  t2ShotSucc: t2SS,
			//  t3ShotSucc: t3SS,
		
			//  t1Showed: t1NoShow,
			//  t2Showed: t2NoShow,
			//  t3Showed: t3NoShow
			}, function(data, status, xhr) {
				console.log("Received finishAutonomous");
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim()); 
					console.log("finishAutonomous successful");
				}else if(status == "error"){
					
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});	
			console.log("Requested finishAutonomous");
	}
	else {
		alert("You gotta select those pilots my dude");
		console.error("Pilots unselected");
	}
}
t1c = "#chkTeam1Cross"
$(function(){
	$("#chkTeam1Cross").click(function(){
		if(!this.checked){
			$("#chkTeam1AttGear").prop("checked", false);
			$("#chkTeam1RobotGearSucc").prop("checked", false);
			$("#chkTeam1HumanGearSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam1AttGear").click(function(){
		
		if(!this.checked){
			$("#chkTeam1RobotGearSucc").prop("checked", false);
			$("#chkTeam1HumanGearSucc").prop("checked", false);
		}
		else{
			$("#chkTeam1Cross").prop("checked", true);
		}
	});
	
	$("#chkTeam1RobotGearSucc").click(function(){
		
		if(!this.checked){
			$("#chkTeam1HumanGearSucc").prop("checked", false);
		}
		else{
			$("#chkTeam1Cross").prop("checked", true);
			$("#chkTeam1AttGear").prop("checked", true);
		}
	});	
	
	$("#chkTeam1HumanGearSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam1Cross").prop("checked", true);
			$("#chkTeam1AttGear").prop("checked", true);
			$("#chkTeam1RobotGearSucc").prop("checked", true);
		}
	});
	
	$("#chkTeam1AttHigh").click(function(){
		
		if(!this.checked){
			$("#chkTeam1HighSucc").prop("checked", false);
		}
		else{
			$("#chkTeam1AttLow").prop("checked", false);
			$("#chkTeam1LowSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam1HighSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam1AttHigh").prop("checked", true)
			$("#chkTeam1AttLow").prop("checked", false);
			$("#chkTeam1LowSucc").prop("checked", false);
			
		}
	});
	
	$("#chkTeam1AttLow").click(function(){
		
		if(!this.checked){
			$("#chkTeam1LowSucc").prop("checked", false);
		}
		else{
			$("#chkTeam1AttHigh").prop("checked", false);
			$("#chkTeam1HighSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam1LowSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam1AttLow").prop("checked", true)
			$("#chkTeam1AttHigh").prop("checked", false);
			$("#chkTeam1HighSucc").prop("checked", false);
			
		}
	});
	$("#chkTeam2Cross").click(function(){
		if(!this.checked){
			$("#chkTeam2AttGear").prop("checked", false);
			$("#chkTeam2RobotGearSucc").prop("checked", false);
			$("#chkTeam2HumanGearSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam2AttGear").click(function(){
		
		if(!this.checked){
			$("#chkTeam2RobotGearSucc").prop("checked", false);
			$("#chkTeam2HumanGearSucc").prop("checked", false);
		}
		else{
			$("#chkTeam2Cross").prop("checked", true);
		}
	});
	
	$("#chkTeam2RobotGearSucc").click(function(){
		
		if(!this.checked){
			$("#chkTeam2HumanGearSucc").prop("checked", false);
		}
		else{
			$("#chkTeam2Cross").prop("checked", true);
			$("#chkTeam2AttGear").prop("checked", true);
		}
	});	
	
	$("#chkTeam2HumanGearSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam2Cross").prop("checked", true);
			$("#chkTeam2AttGear").prop("checked", true);
			$("#chkTeam2RobotGearSucc").prop("checked", true);
		}
	});
	
	$("#chkTeam2AttHigh").click(function(){
		
		if(!this.checked){
			$("#chkTeam2HighSucc").prop("checked", false);
		}
		else{
			$("#chkTeam2AttLow").prop("checked", false);
			$("#chkTeam2LowSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam2HighSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam2AttHigh").prop("checked", true)
			$("#chkTeam2AttLow").prop("checked", false);
			$("#chkTeam2LowSucc").prop("checked", false);
			
		}
	});
	
	$("#chkTeam2AttLow").click(function(){
		
		if(!this.checked){
			$("#chkTeam2LowSucc").prop("checked", false);
		}
		else{
			$("#chkTeam2AttHigh").prop("checked", false);
			$("#chkTeam2HighSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam2LowSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam2AttLow").prop("checked", true)
			$("#chkTeam2AttHigh").prop("checked", false);
			$("#chkTeam2HighSucc").prop("checked", false);
			
		}
	});
	$("#chkTeam3Cross").click(function(){
		if(!this.checked){
			$("#chkTeam3AttGear").prop("checked", false);
			$("#chkTeam3RobotGearSucc").prop("checked", false);
			$("#chkTeam3HumanGearSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam3AttGear").click(function(){
		
		if(!this.checked){
			$("#chkTeam3RobotGearSucc").prop("checked", false);
			$("#chkTeam3HumanGearSucc").prop("checked", false);
		}
		else{
			$("#chkTeam3Cross").prop("checked", true);
		}
	});
	
	$("#chkTeam3RobotGearSucc").click(function(){
		
		if(!this.checked){
			$("#chkTeam3HumanGearSucc").prop("checked", false);
		}
		else{
			$("#chkTeam3Cross").prop("checked", true);
			$("#chkTeam3AttGear").prop("checked", true);
		}
	});	
	
	$("#chkTeam3HumanGearSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam3Cross").prop("checked", true);
			$("#chkTeam3AttGear").prop("checked", true);
			$("#chkTeam3RobotGearSucc").prop("checked", true);
		}
	});
	
	$("#chkTeam3AttHigh").click(function(){
		
		if(!this.checked){
			$("#chkTeam3HighSucc").prop("checked", false);
		}
		else{
			$("#chkTeam3AttLow").prop("checked", false);
			$("#chkTeam3LowSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam3HighSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam3AttHigh").prop("checked", true)
			$("#chkTeam3AttLow").prop("checked", false);
			$("#chkTeam3LowSucc").prop("checked", false);
			
		}
	});
	
	$("#chkTeam3AttLow").click(function(){
		
		if(!this.checked){
			$("#chkTeam3LowSucc").prop("checked", false);
		}
		else{
			$("#chkTeam3AttHigh").prop("checked", false);
			$("#chkTeam3HighSucc").prop("checked", false);
		}
	});
	
	$("#chkTeam3LowSucc").click(function(){
		
		if(this.checked){
			$("#chkTeam3AttLow").prop("checked", true)
			$("#chkTeam3AttHigh").prop("checked", false);
			$("#chkTeam3HighSucc").prop("checked", false);
			
		}
	});
})