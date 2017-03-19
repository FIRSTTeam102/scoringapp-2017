<?php
	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

	session_start();
	
	// Connect to the database.
	$link = mysql_connect('Team102.org:3306', 'team102_webuser', 'Gearheads');
	
	if (!mysql_select_db('team102_2014', $link)) {
    		echo sprintf('Could not select database, Err: %s', mysql_error());
    		exit;
	}

	// If one of the selected controls has been set, save that team to the alliance.
	foreach($_POST as $key=>$value)
	{
		if(strpos($key, 'team') === 0)
		{
			$alli = substr($key, 4, 1);
			$seqNo = substr($key, 6, 1);
			$teamNum = $value;
			$sql = sprintf("update elim_alliance set team_number = %s where alliance_number = %s and seq_no = %s
					and tournament_id in (select id from tournaments where active = 'Y')", $teamNum, $alli, $seqNo);
			$updateReturn = mysql_query($sql, $link);
			if(!$updateReturn)
				die(sprintf("Error updating elim_alliance: alli: %s, seqNo: %s, Err: %s", $alli, $seqNo, mysql_error()));	
		}
		if(strpos($key, 'btn') === 0)
		{
			$alli = substr($key, 3, 1);
			$seqNo = substr($key, 5, 1);
			$sql = sprintf("update elim_alliance set team_number = null where alliance_number = %s and seq_no = %s
					and tournament_id in (select id from tournaments where active = 'Y')", $alli, $seqNo);
			$updateReturn = mysql_query($sql, $link);
			if(!$updateReturn)
				die(sprintf("Error updating elim_alliance: alli: %s, seqNo: %s, Err: %s", $alli, $seqNo, mysql_error()));				
		}
	}
	$sql = "select a.alliance_number, a.seq_no, tt.*
			from elim_alliance a 
			  left join team_avg_pts_v tt on a.team_number = tt.team_number
			  left join tournaments t on a.tournament_id = t.ID
			  where t.active = 'Y'
			order by a.alliance_number, a.seq_no;";
	$allianceQ = mysql_query($sql, $link);
	if (!$allianceQ) {
		echo "DB Error, could not query elimination alliances\n";
		echo 'MySQL Error: ' . mysql_error();
		exit;
	}
	$data = array();
	while($row = mysql_fetch_assoc($allianceQ))
	{
		$data[] = $row;
	}
	if($data != null)
		$colNames = array_keys(reset($data));
	else 
		$colNames = null;

	// Query to get the teams that are not assigned yet.
	$sql = " select tt.*
			from team_avg_pts_v tt 
			  left join elim_alliance a on (a.team_number = tt.team_number)
        and a.tournament_id in (select id from tournaments where active = 'Y')
			  where a.team_number is null
			order by tt.rank;";
	$teamsQ = mysql_query($sql, $link);
	if (!$teamsQ) {
		echo "DB Error, could not query elimination teams\n";
		echo 'MySQL Error: ' . mysql_error();
		exit;
	}
	
	?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><? echo $_SESSION['tournament']->Title; ?> Standings</title>
    <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
	<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
    <link rel="stylesheet" href="stylesheet.css" />
    <!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	<script type='text/javascript'>//<![CDATA[ 
		$(window).load(function(){
			// Event handler to recalculate the score whenever an input control changes.
			$( "select" ).change(function() 
			{ 
				this.form.submit();
			})

		});
	//]]>
	</script>
</head>
<body>
	<div id="button_holder">
		<a href="scoringapp.php" style="color:white; text-style:none;">Scoring App</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="survey.php" style="color:white; text-style:none;">Survey</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="preview.php" style="color:white; text-style:none;">Preview</a>
	</div>
	<div>&nbsp;</div>
	<div>Alliance Selection</div>
	<form id="AllianceForm" action="alliance.php" method="POST">
	<!-- <table><tr><td><?php echo var_dump($_POST); ?> </td></tr></table> -->
<?php
	$thisAlliance = 0;
	$numColsToSkip = 3;
	foreach($data as $row) {
		if($row['alliance_number'] != $thisAlliance)
		{
			if($thisAlliance != 0)
				echo '</table>';
			$thisAlliance = $row['alliance_number'];
			?>
			<table border="1" style="text-align:center; vertical-align:middle; font-size: 0.65em;">
			<tr><th colspan="<?php echo count($colNames) - $numColsToSkip + 1 ?>" style="background-color: #FFF; color: #000;">Alliance <?php echo $row['alliance_number'] ?></th></tr>
			<tr><th></th>
			<?php
			foreach($colNames as $colName)
			{
				if(($colName != 'alliance_number') && ($colName != 'seq_no')  && ($colName != 'num_matches'))
				{
				?>
					<th><?php echo str_replace('_', ' ', $colName); ?></th>
				<?php
				}
			}
			?>
			</tr>
		<?php
		}
		if (is_null($row['team_number'])){
		?>
			<tr>
				<td colspan="<?php echo count($colNames) - $numColsToSkip + 1?>">
					<select name="team<?php echo $row['alliance_number'] ?>-<?php echo $row['seq_no'] ?>" id="selectTeam<?php echo $row['alliance_number'] ?>-<?php echo $row['seq_no'] ?>" style="width: 20em;">
						<option value="" disabled="disabled" selected>Please select a Team</option>
						<?php
						mysql_data_seek($teamsQ, 0);
						while($teamRow = mysql_fetch_assoc($teamsQ)) {
							?>
							<option value="<?php echo $teamRow['team_number'] ?>"><?php echo $teamRow['rank'] ?> Team: <?php echo $teamRow['team_number'] ?>
								| <?php echo $teamRow['avg_net_pts'] ?></option>
							<?php
						}
						?>
					</select>
				</td>
			</tr>
		<?php
		}
		else
		{
		?>
			<tr>
			<td><input type="submit" name="btn<?php echo $row['alliance_number'] ?>-<?php echo $row['seq_no'] ?>" value="X" 
					style="margin: 2px;  padding: 3.75px;"/></td>
			<?php
			foreach($colNames as $colName)
			{
				if(($colName != 'alliance_number') && ($colName != 'seq_no') && ($colName != 'num_matches'))
				{
				?>
					<td><?php echo $row[$colName] ?></td>
				<?php
				}
			}
			?>
			</tr>
		<?php
		}
	}
?>
	</form>
</body>
</html>
