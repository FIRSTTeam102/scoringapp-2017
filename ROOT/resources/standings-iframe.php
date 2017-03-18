<?php
	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

	session_start();
	
	// Connect to the database.
	$publicPwd = file_get_contents('junk');
	$link = mysql_connect('team102.net:3306', 'gearheads', 'Gearhe3ads4prezdent');
	
	if (!mysql_select_db('Scoring2017', $link)) {
    		echo sprintf('Could not select database, Err: %s', mysql_error());
    		exit;
	}
	$sort = "`Avg_Pts` desc";
	if($_GET['sort'] != null)
		$sort = $_GET['sort'];

//	echo "sort: " . $sort;
	
	$more = false;
	if($_GET['more'] != null)
		$more = ($_GET['more'] == "true") ? true : false;
		
	$selectList = "tournament_id,102_rank,FRC_rank, luck, team_number, num_matches, avg_pts, rank_pts, avg_auto_pts, auto_gear_tries, auto_gear_success, auto_gear_PCT, auto_goal, Avg_Gears, Rope_Pct, Broke_Down";
	if($more)
		$selectList = "tournament_id,102_rank,FRC_rank, luck, team_number, num_matches, avg_pts, rank_pts, avg_auto_pts, auto_gear_tries, auto_gear_success, auto_gear_PCT, auto_goal, Avg_Gears, Rope_Pct, climbed_rope, Gear_Tries, Gear_Success, Gear_PCT, Gear_pts, avg_Gear_pts, avg_hi_pts, avg_lo_pts, Broke_Down, Recovered";
		
	$sql = "select ". $selectList . " from team_avg_pts_v order by ";		// Temporary.
	
	if($_GET['AllTournaments'] != null)
		$sql = "select " . $selectList .
				" from t_team_avg_pts_v  apv
				where team_number in (select team_number from tournament_teams tt, tournaments t where tt.tournament_id = t.id and t.active = 'Y')
				order by ";	// Over all tournaments that are not Active = 'O'
	
	$sql .= mysql_real_escape_string($sort);
	
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
    <title><? echo $_SESSION['tournament']->Title; ?> Standings</title>
    <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
	<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
    <link rel="stylesheet" href="http://app.team102.net/resources/css/style.css" />
    <style>
		body{
			background: none !important;
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
	</style>
</head>
<body>
<div id="button_holder">
<!--
<div id="button_holder">
	<a href="standingsrecent.php" style="color:white; text-style:none;">Recent</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="preview.php" style="color:white; text-style:none;">Preview</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="upcoming.php" style="color:white; text-style:none;">Upcoming</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="survey.php" style="color:white; text-style:none;">Survey</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="standings.php?more=<?php echo ($more ? 'false' : 'true') ?>&sort=<?php echo ($sort);?>" style="color:white; text-style:none;">
							<?php if($more) echo('Less'); else echo ('More');?></a>
</div>--></div>
<div>&nbsp;</div>
 <table border="1" id="standings">
    <?php
 		if($colNames == null)
		{
			echo "<tr><th>There are no standings to report.</th></tr>";
		}
		else
		{
 		   //print the rows
		   $i = 1;
		   foreach($data as $row)
		   {
				if(($i - 1) % 10 == 0)
				{
					echo "<th>row</th>";
				   //print the header
				   foreach($colNames as $colName)
				   {
				   	if($colName != 'tournament_id')
				   	{
						if(($colName == 'team_number') || ($colName == 'luck') || ($colName == 'num_matches') || ($colName == '102_rank')
							|| ($colName == 'FRC_rank'))
						{
							$default_sort = ' asc';
							$second_sort = ' desc';
						}
						else
						{
							$default_sort = ' desc';
							$second_sort = ' asc';
						}
				   ?>
					 <th><a href="standings.php?more=<?php echo ($more ? 'true' : 'false')?>&sort=<?php echo ($sort == $colName . $default_sort) ? urlencode('`'.$colName.'`') . $second_sort: urlencode('`'.$colName.'`') . $default_sort;?>" 
									<?php echo (($sort == $colName . $default_sort) || ($sort == $colName . $second_sort)) ? ' class="currentSort"' : '';?> >
							<?php echo str_replace('_', ' ', $colName); ?></a></th>
					<?php
					}
				   }
				}
			  if($i % 2 == 0){
				  echo "<tr class='unlight'><td>" . $i++ . "</td>";
			  }else{
				  echo "<tr class='highlight'><td>" . $i++ . "</td>";
			  }
			  foreach($colNames as $colName)
			  {
				if($colName == "team_number")
				{
					echo '<td><a href="survey.php?team=' . $row[$colName] . '">' . $row[$colName] . "</a></td>";
				}
				else if($colName != 'tournament_id')
				{
					echo "<td>".$row[$colName]."</td>";
				}
			  }
			  echo "</tr>";
		   }
		}
    ?>
 </table>
 </body>
</html>