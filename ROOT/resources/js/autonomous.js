function finishAutonomous(){
	console.log("starting finishAutonomous()");
	

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
			//  t1Baseline: t1Xbaseln
			//	t2Baseline: t2Xbaseln
	    	//  t3Baseline: t3Xbaseln
			 
			//  t1AttemptedGear: t1AttGear
			//	t2AttemptedGear: t2AttGear
			//	t3AttemptedGear: t3AttGear
			 
			//	t1RoboGearSucc: t1RGS
			//	t2RoboGearSucc: t2RGS
		    //  t3RoboGearSucc: t3RGS
			
			//  t1HuGearSucc: t1HGS
			//	t2HuGearSucc: t2HGS
			//  t3HuGearSucc: t3HGS
		
			//  t1AttemptedShot: t1AttShot
			//  t2AttemptedShot: t2AttShot
			//  t3AttemptedShot: t3AttShot
			
			//  t1ShotSucc: t1SS
			//  t2ShotSucc: t2SS
			//  t3ShotSucc: t3SS
		
			//  t1Showed: t1NoShow
			//  t2Showed: t2NoShow
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