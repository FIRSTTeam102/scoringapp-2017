<?php

// Page that can parse the match schedule from the FIRST site and insert into the match teams.
// NOTE: the path to the FIRST URL keeps changing, so you have to go to the page, get info about the frame and use that address.
//
	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

	session_start();
?>
<html>
<head>
<title>Parse FRC Matches and Team Ranks</title>
</head>
<body>
<?php	
	// if we cannot get the password from session - redirect to the starting page.
	// if(!$_SESSION['password'])
	// {
		// header("Location: index.php"); 	/* Redirect browser */
		// exit();
	// }
	
	// Connect to the database.
	$link = mysql_connect('team102.net:3306', 'gearheads', 'Gearhe3ads4prezdent');
	
	if (!mysql_select_db('Scoring2017', $link)) {
    		echo sprintf('Could not select database, Err: %s', mysql_error());
    		exit;
	}
	
	function SaveMatch($match_number, $time)
	{
		global $link;
		global $tournament_id;
		echo sprintf("Saving match: %s, time=%s<br/>", $match_number, $time);
		$sql = sprintf("insert into matches (tournament_id, match_number, start_time)
						 values ('%s', %s, '%s')
							ON DUPLICATE KEY UPDATE start_time = '%s'
						 "
						, mysql_real_escape_string($tournament_id)
						, mysql_real_escape_string($match_number)
						, mysql_real_escape_string($time)
						, mysql_real_escape_string($time)
						);
		$insertReturn = mysql_query($sql, $link);
		if(!$insertReturn)
			echo sprintf("Error inserting match: %s, Err: %s\n", $match_number, mysql_error());

//		echo $sql;
		return null;
	}
	function SaveMatchTeam($match_number, $team_number, $alliance, $seq_no)
	{
		global $link;
		global $tournament_id;
//		echo sprintf("Saving match-team %s, %s, %s, %s<br/>", $match_number, $team_number, $alliance, $seq_no);
		$sql = sprintf("insert into match_teams (tournament_id, match_number, team_number, alliance, seq_no)
						 values ('%s', %s, %s, '%s', %s)
							ON DUPLICATE KEY UPDATE tournament_id = tournament_id
						 "
						, mysql_real_escape_string($tournament_id)
						, mysql_real_escape_string($match_number)
						, mysql_real_escape_string($team_number)
						, mysql_real_escape_string($alliance)
						, mysql_real_escape_string($seq_no)
						);
		$insertReturn = mysql_query($sql, $link);
		if(!$insertReturn)
			echo sprintf("Error inserting match_team: %s, %s Err: %s\n", $match_number, $team_number, mysql_error());

//		echo $sql;
		return null;
	}
	function UpdateMatch($match_number, $red_score, $blue_score)
	{
		global $link;
		global $tournament_id;
		if(($red_score == null) || ($blue_score == null))
			return null;
		echo sprintf("Updating match %s, redScore=%s, blueScore=%s<br/>", $match_number, $red_score, $blue_score);
		$sql = sprintf("update matches set red_score = %s, blue_score = %s
						where tournament_id = '%s' and match_number = %s
						"
						, mysql_real_escape_string($red_score)
						, mysql_real_escape_string($blue_score)
						, mysql_real_escape_string($tournament_id)
						, mysql_real_escape_string($match_number)
						);
		$insertReturn = mysql_query($sql, $link);
		if(!$insertReturn)
			echo sprintf("Error updating match: %s, Err: %s\n", $match_number, mysql_error());

//		echo $sql;
		return null;
	}
	/* Use internal libxml errors -- turn on in production, off for debugging */
	libxml_use_internal_errors(false);
	
	echo "<h1>Parsing Matches</h1>";

	/* Createa a new DomDocument object */
	$dom = new DomDocument;
	
	// Load the active tournament
	/* Load the HTML */
	// NOTE: need to put the correct URL for the competition here.

	// NOTE: Set OUR tournament ID here.
	$FIRSTName = 'NJBRI';	// NJSKI, NJTAB
	$tournament_id = "MBR";
	
	// NOTE: Change FIRST's event id in this URL to select a different tournament.
	$url = "http://frc-events.firstinspires.org/2017/" . $FIRSTName ."/qualifications";
	$dom->loadHTMLFile($url);				
	
	/* Create a new XPath object */
	$xpath = new DomXPath($dom);
	/* Query all <td> nodes containing specified class name */
	$nodes = $xpath->query("//table[@class='table table-striped table-hover table-bordered table-condensed text-center']//tr[@class='hidden-xs']//td");					// 2015  UMass

	/* Traverse the DOMNodeList object to output each DomNode's nodeValue */
/*	foreach ($nodes as $i => $node) {
		echo "Node($i): ", $node->nodeValue, "\n";
	}
*/	
	/* Set HTTP response header to plain text for debugging output */
//	header("Content-type: text/plain");

	// The first node is the match number
	// Second node is the day and time.
	// 3rd-5th are the Red Alliance Team Numbers
	// 6th-8th are the Blue Alliance Team Numbers
	// 9th-10th are the red score and blue score
	$matchNumber = null;
	$numMatches = count($nodes);
	if($numMatches < 1)			// For some reason returns one node when there are no matches.
		echo sprintf("No matches found for %s at %s\n", $tournament_id, mysql_real_escape_string($url));
		
	foreach ($nodes as $i => $node) {
		if(($i % 10) == 0)
		{
			// Format: Qualification 1 (D)
			$parts = explode (' ', $node->nodeValue);
			$matchNumber = trim($parts[1]);
		}
		else if(($i % 10) == 1)
		{
			$time = trim($node->nodeValue);
			SaveMatch($matchNumber, $time);
		}
		else if(($i % 10) == 2)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'RED', 1);
		}
		else if(($i % 10) == 3)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'RED', 2);
		}
		else if(($i % 10) == 4)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'RED', 3);
		}
		else if(($i % 10) == 5)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'BLUE', 1);
		}
		else if(($i % 10) == 6)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'BLUE', 2);
		}
		else if(($i % 10) == 7)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'BLUE', 3);
		}
		else if(($i % 10) == 8)
		{
			$redScore = trim($node->nodeValue);
		}
		else if(($i % 10) == 9)
		{
			$blueScore = trim($node->nodeValue);
			UpdateMatch($matchNumber, $redScore, $blueScore);
		}
	}
	
	// parse team FIRST rank
	echo "<h1>Parsing Teams</h1>";

	$url = "http://frc-events.firstinspires.org/2017/" . $FIRSTName ."/rankings";
	$dom->loadHTMLFile($url);				
	
	/* Create a new XPath object */
	$xpath = new DomXPath($dom);
	/* Query all <td> nodes containing specified class name */
	$nodes = $xpath->query("//table[@class='table table-striped table-hover table-bordered table-condensed text-center']//tr[@class='hidden-xs']//td");					// 2015  UMass
	
	$dom->loadHTMLFile($url);
	/* Create a new XPath object */
	$xpath = new DomXPath($dom);
	/* Query all <td> nodes containing specified class name */
	$nodes = $xpath->query("//table[@class='table table-striped table-hover text-center']//tbody//td");
	
	
	$numCols = 17;	// NOTE: This changes from year to year depending on their stats.
	foreach ($nodes as $i => $node) {
//		echo $i.": ".$node->nodeValue;	// uncomment this to figure out how many columns
//		echo "<br>";				
		if(($i % $numCols) == 0)
		{
			if($rank != null)
			{
				// A team has been parsed.  Save it to the DB.
				echo sprintf("%s, %s, %s, %s<br>", $teamNumber, $rank, $rankingPoints, $autoPoints);
				echo "\n";
				$sql = sprintf("update tournament_teams set frc_rank = %s, ranking_points = %s, auto_points = %s
								 where team_number = %s and tournament_id = '%s'"
								, $rank, $rankingPoints, $autoPoints, $teamNumber, $tournamentID
								);
//				echo $sql;
//				echo "<br>";				
				$updateReturn = mysql_query($sql, $link);
				if(!$updateReturn)
					die(sprintf("Error updating tournament-team: %s-%s, Err: %s", $tournamentID, $teamNumber, mysql_error()));
			}
			$rank = null;
			// Get team number.
			$rank = trim($node->nodeValue);
		}
		else if(($i % $numCols) == 1)
		{
			$teamNumber = $node->nodeValue;
		}
		else if(($i % $numCols) == 2)
		{
			$rankingPoints = str_replace(",","",$node->nodeValue);
		}
		else if(($i % $numCols) == 4)
		{
			$autoPoints = str_replace(",","",$node->nodeValue);
		}		
	}
	// A team has been parsed.  Save it to the DB.
	if($teamNumber != null)
	{
		// A team has been parsed.  Save it to the DB.
		echo sprintf("%s, %s, %s, %s<br>", $teamNumber, $rank, $rankingPoints, $autoPoints);
		echo "\n";
		$sql = sprintf("update tournament_teams set frc_rank = %s, ranking_points = %s, auto_points = %s
						 where team_number = %s and tournament_id = '%s'"
						, $rank, $rankingPoints, $autoPoints, $teamNumber, $tournamentID
						);
//				echo $sql;
//				echo "\n";				
		$updateReturn = mysql_query($sql, $link);
		if(!$updateReturn)
			die(sprintf("Error updating tournament-team: %s-%s, Err: %s", $tournamentID, $teamNumber, mysql_error()));
	}
	
	// parse elimination matches
	echo "<h1>Parsing Elimination Matches</h1>";

	/* Createa a new DomDocument object */
	$dom = new DomDocument;
	
	// Load the active tournament
	/* Load the HTML */
	// NOTE: need to put the correct URL for the competition here.
	// PERHAPS?: $dom->loadHTMLFile("http://www2.usfirst.org/2014comp/Events/NJCLI/matchresults.html");
//	$dom->loadHTMLFile("http://www2.usfirst.org/2014comp/Events/NJFLA/matchresults.html");		// 2014

	// NOTE: Change FIRST's event id in this URL to select a different tournament.
	$url = "http://frc-events.firstinspires.org/2017/" . $FIRSTName ."/playoffs";
	$dom->loadHTMLFile($url);				
	
	/* Create a new XPath object */
	$xpath = new DomXPath($dom);
	/* Query all <td> nodes containing specified class name */
	$nodes = $xpath->query("//tbody[@id='match-results']//tr[@class='hidden-xs']//td");				

	/* Traverse the DOMNodeList object to output each DomNode's nodeValue */
//	foreach ($nodes as $i => $node) {
//		echo "Node($i): ", $node->nodeValue, "\n";
//	}
	
// <td>
// Quarterfinal 1 (B) </td>
// -----------------------
// <td class="text-left">
// Sun 4/10 - 1:45 PM </td>
// -----------------------
// <td class="danger">
// 3314 </td>
// -----------------------
// <td class="danger">
// 303 </td>
// -----------------------
// <td class="danger">
// 5666 </td>
// -----------------------
// <td class="info">
// 433 </td>
// -----------------------
// <td class="info">
// 5684 </td>
// -----------------------
// <td class="info">
// 103 </td>
// -----------------------
// <td style="color:red;"/>
// -----------------------
// <td style="color:blue;"/>
// -----------------------
	
	$matchNumber = 199;
	$numMatches = count($nodes);
	$title = "";
	if($numMatches < 1)
		echo sprintf("No Elimination matches found for %s at %s\n", $tournament_id, mysql_real_escape_string($url));
		
	foreach ($nodes as $i => $node) {
//		echo $i . ': ' . $node->nodeValue . '<br>';
		if(($i % 10) == 0)
		{
			// Format: Quarterfinal 1 (B) </td>
//			$parts = explode (' ', $node->nodeValue);
			$title = $node->nodeValue;
			$matchNumber = $matchNumber + 1;
		}
		else if(($i % 10) == 1)
		{
			$time = trim($node->nodeValue);
			//echo 'Match Time: ' . $time;
			SaveMatch($matchNumber, $title);
		}
		else if(($i % 10) == 2)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'RED', 1);
		}
		else if(($i % 10) == 3)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'RED', 2);
		}
		else if(($i % 10) == 4)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'RED', 3);
		}
		else if(($i % 10) == 5)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'BLUE', 1);
		}
		else if(($i % 10) == 6)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'BLUE', 2);
		}
		else if(($i % 10) == 7)
		{
			$teamNumber = trim($node->nodeValue);
			SaveMatchTeam($matchNumber, $teamNumber, 'BLUE', 3);
		}
		else if(($i % 10) == 8)
		{
			$redScore = trim($node->nodeValue);
		}
		else if(($i % 10) == 9)
		{
			$blueScore = trim($node->nodeValue);
			UpdateMatch($matchNumber, $redScore, $blueScore);
		}
	}
	
	echo "Finished on ";
	date_default_timezone_set("America/New_York");
	echo date(DATE_RFC2822);
	echo "<script>setTimeout(function(){location.reload();},420000); console.log('Timeout set.');</script>";
?>
</body>