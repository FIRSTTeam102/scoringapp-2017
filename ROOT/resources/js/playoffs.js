function updateUnchosen() {
	var inputTeams = [];  //will hold all input teams
	var unchosenTeams = [];
	
	//add in the radio value getter and push it to input teams
	
	curTeam = $("input[name='radTeam']:checked").val();
	curAlliance = $("input[name='radAlliance']:checked").val()
	
	inputTeams.push(curTeam);
	/* used to have number inputs
	$(".AllianceTeam").each(function() {
	    inputTeams.push($(this).val());
	}); //inputs team numbers into the array
	*/
	
	$.ajax({

	    url: 'http://team102.net/public_html/2017/standings.php',
	    //data: myData,
	    type: 'GET',
	    crossDomain: true,
	    dataType: 'html',
	    success: function(data) { 
	    	
	    	console.log("success");
	    	
	    	
	    	
	    	
	    	$(data).find(".teamNum").each(function() {    	
	    		if ($.inArray($(this).html(), inputTeams) == -1) {
	    			unchosenTeams.push($(this).html());
	    			
	    		}
	    	}); 
	    	
	    	$("#update-unchosen").empty();
	    	
	    	//console.log(unchosenTeams);
	    	
	    	for (i = 0; i < unchosenTeams.length; i++) {
	    		//$("#update-unchosen").append('<div class="form-line"><p>' + unchosenTeams[i]  + '</p></div>'); 
	    		
	    		$("#update-unchosen").append('<div class="form-line"><input type="radio" name="radTeam" id="rad' + unchosenTeams[i] + '" val="' + unchosenTeams[i] + '"> <label for="rad' + unchosenTeams[i] + '">'+ unchosenTeams[i] + '</label></div>'); 
	    		
	    		console.log(unchosenTeams[i]);
	    	}
	    	
	    	alert("inputTeams: " + inputTeams + "  unchosenTeams: " + unchosenTeams);
	    },
	    error: function() { alert('Failed!'); },
	    
	});
}