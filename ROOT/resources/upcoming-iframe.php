<?php
	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

	session_start();
	
	// Connect to the database.
	$link = mysql_connect('team102.net:3306', 'gearheads', 'Gearhe3ads4prezdent');
	
	if (!mysql_select_db('Scoring2017', $link)) {
    		echo sprintf('Could not select database, Err: %s', mysql_error());
    		exit;
	}
	
	if(isset($_GET['team'])){
		$team = $_GET['team'];
	}else{
		$team = 303;
	}
	

	$sql = sprintf("select mt.match_number,  m.start_time, mt.alliance, mt.team_number as `_team_number`, tap.tournament_id, 102_rank,FRC_rank, luck
					, num_matches, avg_pts, rank_pts, avg_auto_pts, auto_gear_pct, auto_goal, Avg_Gears, Rope_Pct, Broke_Down
				from match_teams mt left outer join team_avg_pts_v tap on tap.team_number = mt.team_number, matches m
				where mt.completed = 'N' and mt.match_number = m.match_number and mt.tournament_id = m.tournament_id
				and mt.tournament_id in (select id from tournaments where active = 'Y')
				and mt.match_number in (select distinct match_number from match_teams 
					where tournament_id in (select id from tournaments where active = 'Y')
					and team_number = %s
					and completed = 'N')
				order by mt.match_number, mt.alliance", $team);
//				order by mt.match_number, mt.alliance, tap.rank";
	
	$standingsQ = mysql_query($sql, $link);
	if (!$standingsQ) {
		echo "DB Error, could not query match teams\n";
		echo 'MySQL Error: ' . mysql_error();
		exit;
	}

  $data = array();
  while($row = mysql_fetch_assoc($standingsQ))
  {
     $data[] = $row;
  }
  if($data != null)
	$colNames = array_keys(reset($data));
  else 
	$colNames = null;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><? echo $_SESSION['tournament']->Title; ?> Upcoming Matches</title>
    <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
	<script type='text/javascript' src='http://app.team102.net/resources/js/jquery-3.1.1.min.js'></script>
    <!--<link rel="stylesheet" href="http://app.team102.net/resources/css/style.css" /> -->
	<link rel="stylesheet" type="text/css" href="stylesheet-new.css"/>

    <style>
		body{
			background: none !important;
			font-size: 0.9em;
		}
		option{
				
			font-size: 1.2em;
			background-color: #7b7ca7;
			padding: 0.5em;
			margin: 0.2em;
			color: white;
			font-weight: bold;
			text-shadow: 1px 1px 7px black;
			background-size: cover;
	
		}
		a{
			color:white;
		}
		td{
			padding: 2px 20px;
		}
	</style>
    <!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

<div>&nbsp;</div>
    <?php
 		if($colNames == null)
		{
			echo "<div>There are no upcoming matches to report.</div>";
		}
		else
		{
 		   //print the rows
		   $previousMatch = 0;
		   $bluePoints = 0;
		   $redPoints = 0;
		   
		   echo sprintf("<h1>Match Preview for Team # %s </h1>", $team); //Print team number at le top
		    
		   foreach($data as $row)
		   {
				if($row["match_number"] != $previousMatch)
				{
				   if($previousMatch != 0)
				   {
					echo '<tr class="white" style="text-align: left;">';
					echo '<td colspan=24 style="padding: 2px 20px;font-size: 1.1em;">Prediction - Blue: ' . $bluePoints . ", Red: " . $redPoints . "</td></tr>";
					echo "</table>&nbsp;";
				   }
				   $bluePoints = 0;
				   $redPoints = 0;
				   
				   echo '<table class="upcoming">';
				   echo '<tr class="white" style="text-align: left;">';
				   echo '<td colspan=24 style="padding: 2px 20px;font-size: 1.3em;">Match ' . $row["match_number"] . ' ~ ' . $row["start_time"] . '</td></tr>';
  				   $previousMatch = $row["match_number"];
				   //print the header
				   foreach($colNames as $colName)
				   {
					if(($colName != "match_number") && ($colName != "alliance") && ($colName != "start_time") && ($colName != "team_number") && ($colName != "tournament_id"))
					{
						?>
						<th><?php echo str_replace('_', ' ', $colName); ?></th>
					<?php
					}
				   }
				}
				if(strtolower($row["alliance"]) == "red")
					$redPoints += $row["avg_pts"];
				else
					$bluePoints += $row["avg_pts"];

				echo "<tr class='" . strtolower($row["alliance"]) . "'>";
				foreach($colNames as $colName)
				{
					if(($colName != "match_number") && ($colName != "alliance") && ($colName != "start_time") && ($colName != "team_number") && ($colName != "tournament_id"))
					{
						if($colName == "_team_number")
						{
							echo '<td><a href="survey.php?team=' . $row[$colName] . '">' . $row[$colName] . "</a></td>";
						}
						else
						{
							echo "<td>".$row[$colName]."</td>";
						}
					}
				}
			  echo "</tr>";
		   }
		}
		echo '<tr class="white" style="text-align: left;">';
		echo '<td colspan=24 style="padding: 2px 20px;font-size: 1.1em;">Prediction - Blue: ' . $bluePoints . ", Red: " . $redPoints . "</td></tr>";
		echo "</table>";
    ?>
 </table>
 </body>
</html>