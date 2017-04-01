<head>
<title>DBSync</title>
</head>
<?php
//set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

set_time_limit(300);
	
	$tournament = 'MNT';
//	session_start();
	
	// Connect to the remote database.
	$remotePwd = file_get_contents('garbage');
//	$remotePwd = $_SESSION['password'];
//	echo "Remote Password: " . $remotePwd."<br>";
	$remoteLink = new mysqli('team102.net', 'gearheads', $remotePwd, 'Scoring2017');	// :3306
//	$remoteLink = new mysqli('208.100.19.247', 'team102_mike', $remotePwd, 'team102_2016');	// :3306
	if ($remoteLink->connect_errno) 
	{
		echo sprintf('Could not connect to remote database, Err: %s', $remoteLink->connect_error);
		exit;
	}
	$localPwd = file_get_contents('trash');
	//$localPwd = $_SESSION['password'];
	echo "Local Password: " . $localPwd."<br>";
	// Connect to local database
//	$localLink = new mysqli('team102.org', 'team102_webuser', $localPwd, 'team102_2016_Local');
	$localLink = new mysqli('localhost', 'root', $localPwd, 'Scoring2017');
	if ($localLink->connect_errno) 
	{
		echo sprintf('Could not connect to local database, Err: %s', $localLink->connect_error);
		exit;
	}

	/* Use internal libxml errors -- turn on in production, off for debugging */
	libxml_use_internal_errors(true);
	
/*	// MOVE NEW TOURNAMENTS TO LOCAL
	$selectReturn = $remoteLink->query("select * from tournaments");
	if(!$selectReturn)
		die(sprintf("Error selecting tournaments, Err: %s", $remoteLink->error));
	
	// if any tournaments are not found in the local DB, create them.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("insert into tournaments (ID, Title, active, FIRST_Abbrev)
						 values ('%s', '%s','%s', '%s') ON DUPLICATE KEY UPDATE active = active"
						 , $remoteLink->real_escape_string($row["ID"])
						 , $remoteLink->real_escape_string($row["Title"])
						 , $remoteLink->real_escape_string($row["active"])
						 , $remoteLink->real_escape_string($row["FIRST_Abbrev"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = $localLink->query($sql);
		if(!$insertReturn)
			die(sprintf("Error inserting tournaments: %s, Err: %s", $teamNumber, $localLink->error));
		if($localLink->affected_rows == 1)
		{
			echo "inserted tournament: " . $row["Title"] . "<br>";
		}
	}
*/
	// MOVE NEW TEAMS TO LOCAL
	$selectReturn = $remoteLink->query("select * from teams");
	if(!$selectReturn)
		die(sprintf("Error selecting teams, Err: %s", $remoteLink->error));
	
	// if any teams are not found in the local DB, create them.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("INSERT IGNORE INTO teams
				(number, name, nickname, city, state) 
				VALUES (%s, '%s', '%s', '%s', '%s')"
						 , $row["number"]
						 , $remoteLink->real_escape_string($row["name"])
						 , $remoteLink->real_escape_string($row["nickname"])
						 , $remoteLink->real_escape_string($row["city"])
						 , $remoteLink->real_escape_string($row["state"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = $localLink->query($sql);
		if(!$insertReturn)
			die(sprintf("Error inserting teams: %s, Err: %s", $row["number"], $localLink->error));
		if($localLink->affected_rows == 1)
		{
			echo "inserted team: " . $row["number"] . "<br>";
		}
	}

	// MOVE NEW TOURNAMENT-TEAMS TO LOCAL
	$selectReturn = $remoteLink->query("select * from tournament_teams");
	if(!$selectReturn)
		die(sprintf("Error selecting tournament_teams, Err: %s", $remoteLink->error));
	
	// if any teams are not found in the local DB, create them.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("INSERT IGNORE INTO tournament_teams
				(tournament_id, team_number) 
				VALUES ('%s', %s);"
						 , $remoteLink->real_escape_string($row["tournament_id"])
						 , $row["team_number"]
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = $localLink->query($sql);
		if(!$insertReturn)
			die(sprintf("Error inserting tournament_team: %s-%s, Err: %s", $row["tournament_id"], $row["team_number"], $localLink->error));
		if($localLink->affected_rows == 1)
		{
			echo "inserted tournament_team: " . $row["tournament_id"] . '-' . $row["team_number"] . "<br>";
		}
	}

	// MOVE NEW MATCHES TO LOCAL
	$selectReturn = $remoteLink->query(sprintf("select * from matches where tournament_id = '%s'", $tournament));
	if(!$selectReturn)
		die(sprintf("Error selecting matches, Err: %s", $remoteLink->error));
	
	// if any are not found in the local DB, create them.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("INSERT INTO matches
				(tournament_id, match_number, start_time, red_score, blue_score
				, red_pressure, blue_pressure, red_rotors, blue_rotors, red_foulpts
				, blue_foulpts, blue_pilot_1, blue_pilot_2, red_pilot_1, red_pilot_2
				) 
				VALUES ('%s', %s, '%s', %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
				 ON DUPLICATE KEY UPDATE red_score = %s, blue_score = %s;"
						 , $remoteLink->real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $remoteLink->real_escape_string($row["start_time"])
						 , ($row["red_score"] == "") ? 0 : $row["red_score"]
						 , ($row["blue_score"] == "") ? 0 : $row["blue_score"]
						 , ($row["red_pressure"] == "") ? 0 : $row["red_pressure"]
						 , ($row["blue_pressure"] == "") ? 0 : $row["blue_pressure"]
						 , ($row["red_rotors"] == "") ? 0 : $row["red_rotors"]
						 , ($row["blue_rotors"] == "") ? 0 : $row["blue_rotors"]
						 , ($row["red_foulpts"] == "") ? 0 : $row["red_foulpts"]
						 , ($row["blue_foulpts"] == "") ? 0 : $row["blue_foulpts"]
						 , ($row["blue_pilot_1"] == "") ? 0 : $row["blue_pilot_1"]
						 , ($row["blue_pilot_2"] == "") ? 0 : $row["blue_pilot_2"]
						 , ($row["red_pilot_1"] == "") ? 0 : $row["red_pilot_1"]
						 , ($row["red_pilot_2"] == "") ? 0 : $row["red_pilot_2"]
						 , ($row["red_score"] == "") ? 0 : $row["red_score"]
						 , ($row["blue_score"] == "") ? 0 : $row["blue_score"]
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = $localLink->query($sql);
		if(!$insertReturn)
			die(sprintf("Error inserting match: %s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $localLink->error));
		if($localLink->affected_rows == 1)
		{
			echo "inserted match: " . $row["tournament_id"] . '-' . $row["match_number"] . "<br>";
		}
	}
	// MOVE NEW MATCHES-TEAMS TO LOCAL
	$selectReturn = $remoteLink->query("select * from match_teams");
	if(!$selectReturn)
		die(sprintf("Error selecting match_teams, Err: %s", $remoteLink->error));
	
	// if any are not found in the local DB, create them.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("INSERT IGNORE INTO match_teams
				(tournament_id, match_number, team_number, alliance, seq_no) 
				VALUES ('%s', %s, %s, '%s', %s);"
						 , $remoteLink->real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $row["team_number"]
						 , $remoteLink->real_escape_string($row["alliance"])
						 , $row["seq_no"]
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = $localLink->query($sql);
		if(!$insertReturn)
			die(sprintf("Error inserting match_team: %s-%s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $row["team_number"], $localLink->error));
		if($localLink->affected_rows == 1)
		{
			echo "inserted match_team: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . "<br>";
		}
	}
	
	// UPDATE EXISTING MATCHES FROM LOCAL TO REMOTE
	$selectReturn = $localLink->query(sprintf("select * from matches where tournament_id = '%s'", $tournament));
	if(!$selectReturn)
		die(sprintf("Error selecting local matches, Err: %s", $localLink->error));
	
	// update everything.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("UPDATE matches 
				SET 
					start_time = '%s'
					, red_pressure = %s
					, blue_pressure = %s
					, red_rotors = %s
					, blue_rotors = %s
					, red_foulpts = %s
					, blue_foulpts = %s
					, blue_pilot_1 = %s
					, blue_pilot_2 = %s
					, red_pilot_1 = %s
					, red_pilot_2 = %s
				WHERE tournament_id = '%s' AND  match_number = %s;"
						 , $remoteLink->real_escape_string($row["start_time"])
						 , ($row["red_pressure"] == "") ? 'NULL' : $row["red_pressure"]
						 , ($row["blue_pressure"] == "") ? 'NULL' : $row["blue_pressure"]
						 , ($row["red_rotors"] == "") ? 'NULL' : $row["red_rotors"]
						 , ($row["blue_rotors"] == "") ? 'NULL' : $row["blue_rotors"]
						 , ($row["red_foulpts"] == "") ? 'NULL' : $row["red_foulpts"]
						 , ($row["blue_foulpts"] == "") ? 'NULL' : $row["blue_foulpts"]
						 , ($row["blue_pilot_1"] == "") ? 'NULL' : $row["blue_pilot_1"]
						 , ($row["blue_pilot_2"] == "") ? 'NULL' : $row["blue_pilot_2"]
						 , ($row["red_pilot_1"] == "") ? 'NULL' : $row["red_pilot_1"]
						 , ($row["red_pilot_2"] == "") ? 'NULL' : $row["red_pilot_2"]
						 , $remoteLink->real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						);
//		echo $sql;
//		echo "<br>";				
		$updateReturn = $remoteLink->query($sql);
		if(!$updateReturn)
			die(sprintf("Error updating match: %s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $remoteLink->error));
		if($remoteLink->affected_rows == 1)
		{
			echo "updated match: " . $row["tournament_id"] . '-' . $row["match_number"] . "<br>";
		}
//		else
//		{
//			echo "could not update match: " . $row["tournament_id"] . '-' . $row["match_number"] . "<br>";
//		}		
	}

	// UPDATE EXISTING MATCH-TEAMS FROM LOCAL TO REMOTE
	$selectReturn = $localLink->query(sprintf("select * from match_teams where tournament_id = '%s'", $tournament));
	if(!$selectReturn)
		die(sprintf("Error selecting local match_teams, Err: %s", $LocalLink->error));
	
	// update everything.
	while($row = $selectReturn->fetch_assoc()) 
	{
		// NOTE: We do not update alliance and seq_no
		$sql = sprintf("UPDATE match_teams 
				SET 
					completed = '%s'
					,ignore_match = '%s'
					,comments = '%s'
					,initials = '%s'
					,foul_pts = %s
					,did_show_up = '%s'
					,did_break_down = '%s'
					,auto_crossed_baseline = '%s'
					,auto_gear_attempt = '%s'
					,auto_gear_outcome = '%s'
					,auto_goal_attempt = '%s'
					,auto_high_fuel = %s
					,climbed_rope = '%s'
					WHERE tournament_id = '%s' AND  match_number = %s and team_number = %s;"
						 , $remoteLink->real_escape_string($row["completed"])
						 , $remoteLink->real_escape_string($row["ignore_match"])
						 , $remoteLink->real_escape_string($row["comments"])
						 , $remoteLink->real_escape_string($row["initials"])
						 , $row["foul_pts"]
						 , ($row["did_show_up"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["did_show_up"])
						 , ($row["did_break_down"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["did_break_down"])
						 , ($row["auto_crossed_baseline"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["auto_crossed_baseline"])
						 , ($row["auto_gear_attempt"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["auto_gear_attempt"])
						 , ($row["auto_gear_outcome"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["auto_gear_outcome"])
						 , ($row["auto_goal_attempt"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["auto_goal_attempt"])
						 , ($row["auto_high_fuel"] == "") ? 'NULL' : $row["auto_high_fuel"]
						 , ($row["climbed_rope"] == "") ? 'NULL' : $remoteLink->real_escape_string($row["climbed_rope"])
						 , $remoteLink->real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $row["team_number"]
						);
//		echo $sql;
//		echo "<br>";				
		$updateReturn = $remoteLink->query($sql);
		if(!$updateReturn)
			die(sprintf("Error updating remote match_team: %s-%s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $row["team_number"], $remoteLink->error));
		if($remoteLink->affected_rows == 1)
		{
			echo "updated match_team: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . "<br>";
		}
//		else
//		{
//			echo "could not update match_team: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . "<br>";
//		}		
	}

	// BIG NOTE: MATCH-TEAM-CYCLES are only ever created locally and copied to the remote.
	// MOVE NEW MATCHES-TEAM-CYCLES TO REMOTE
	$selectReturn = $localLink->query(sprintf("select * from match_team_cycles where tournament_id = '%s'", $tournament));
	if(!$selectReturn)
		die(sprintf("Error selecting match_team_cycles, Err: %s", $localLink->error));
	
	// if any are not found in the remote DB, create them.
	while($row = $selectReturn->fetch_assoc()) 
	{
		$sql = sprintf("INSERT IGNORE INTO match_team_cycles
				(tournament_id, match_number, team_number, cycle_number, operation_attempted, success) 
				VALUES ('%s', %s, %s, %s, '%s', '%s');"
						 , $remoteLink->real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $row["team_number"]
						 , $row["cycle_number"]
						 , $remoteLink->real_escape_string($row["operation_attempted"])
						 , $remoteLink->real_escape_string($row["success"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = $remoteLink->query($sql);
		if(!$insertReturn)
			die(sprintf("Error REMOTE inserting match_team_cycle: %s-%s-%s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $row["team_number"], $row["cycle_number"], $remoteLink->error));
		if($remoteLink->affected_rows == 1)
		{
			echo "inserted match_team_cycle: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . '-' . $row["cycle_number"] . "<br>";
		}
	}

	// NO NEED TO UPDATE MATCH-TEAM-CYCLES

	echo "done.";
	echo "<script>setTimeout(function(){location.reload();},300000);</script>";
?>