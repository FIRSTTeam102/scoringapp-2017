
<?php

// Page that can parse the team names and numbers from the first site and insert into the teams and tournament_teams tables.
// NOTE: the path to the FIRST URL keeps changing, so you have to go to the page, get info about the frame and use that address.
//
	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

?>
<html>
<head>
<title>Parse FRC Ranks</title>
</head>
<body>
<?php
	// Connect to the database.
	$link = mysql_connect('team102.net:3306', 'gearheads', 'Gearhe3ads4prezdent');
	
	if (!mysql_select_db('Scoring2017', $link)) {
    		echo sprintf('Could not select database, Err: %s', mysql_error());
    		exit;
	}
		
	/* Use internal libxml errors -- turn on in production, off for debugging */
	libxml_use_internal_errors(true);
	/* Createa a new DomDocument object */
	$dom = new DomDocument;
	/* Load the HTML */
//	$dom->loadHTMLFile("https://my.usfirst.org/myarea/index.lasso?page=teamlist&event_type=FRC&sort_teams=number&year=2015&event=mrcmp");

	$FIRSTName = 'NJBRI';	// NJSKI, NJTAB
	$tournamentID = 'MBR';	// MNT	- Montgomery, SEN - Seneca
	$dom->loadHTMLFile("http://frc-events.firstinspires.org/2017/" . $FIRSTName ."/rankings");
	/* Create a new XPath object */
	$xpath = new DomXPath($dom);
	/* Query all <td> nodes containing specified class name */
//	$nodes = $xpath->query("//tr[@bgcolor='#FFFFFF']//td");
	$nodes = $xpath->query("//table[@class='table table-striped table-hover text-center']//tbody//td");
//	$nodes = $xpath->query("//td");
	/* Set HTTP response header to plain text for debugging output */
	//header("Content-type: text/plain");
	/* Traverse the DOMNodeList object to output each DomNode's nodeValue */
/*	foreach ($nodes as $i => $node) {
		echo "Node($i): ", $node->nodeValue, "\n";
	}
*/	
	// The first node is the city, stateCountry
	// Second node is the list of sponsors and the school name
	// Third node is the team number.
	$numCols = 17;
	foreach ($nodes as $i => $node) {
//		echo $i.": ".$node->nodeValue;
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
	echo "Finished on ";
	echo date(DATE_RFC2822);
	echo "<script>setTimeout(function(){location.reload();},420000); console.log('Timeout set.');</script>";
?>
</body>