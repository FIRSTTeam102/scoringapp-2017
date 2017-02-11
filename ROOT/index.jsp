<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>FRC 2017 Scoring App | Team 102</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- OOH! JQuery! -->
	<script src="resources/js/main.js" type="text/javascript"></script>
	<script src="resources/js/login.js" type="text/javascript"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	
</head>
<body>
	<div class="content" id="content">
		<!-- Contains larger header image by default. Main header loaded as part of AJAX. -->
		<header id="header">
			<img class="title-large" src="resources/images/header-steamworks-1.png"/>
		</header>
		<nav id="login" class="login-container">
				<form id="login-form" class="login-form" name="login-form" method="post">
					Your Initials: <input type="text" name="username" autocorrect=off autocapitalize=characters ><br>
					&nbsp;&nbsp;&nbsp;Password: <input type="password" name="password"><br>
					<div class="btn-container">
						<input type="submit" value="Team 102 Scoring App">
					</div>
				</form>
					<div class="btn-container">
						<input type="submit" value="Scouting Survey">
					</div>
					<div class="btn-container">
						<input type="submit" value="Match Preview">
					</div>		
					<div class="btn-container">
						<input type="submit" value="Upcoming Matches">
					</div>	
					<div class="btn-container">
						<input type="submit" value="Alliance Selection">
					</div>
					<div class="btn-container">
						<input type="submit" value="Mobile Alliance Lighter" onclick="swap('lighter', false);">
					</div>
		</nav>
		<nav id="alliance" class="alliance-container"></nav>
		<nav id="choosematch" class="choosematch-container"></nav>
		<div id="autonomous" class="autonomous-container"></div>
		<div id="teleop" class="teleop-container"></div>
		<nav id="postmatch" class="postmatch-container"></nav>
		<div id="lighter" style="display: none;">
			<div>&nbsp;</div>
			<div class="red"><a onclick="lighter('red');" style="color: white; text-decoration: none;">Red Lighter</a></div>
			<div>&nbsp;</div>
			<div class="blue"><a onclick="lighter('blue');" style="color: white; text-decoration: none;" class="fullWidthLink">Blue Lighter</a></div>
		</div>
	</div>
	<input id="back" type="submit" value="Back" onclick="lighter();" style="display: none"><!-- for lighter -->
</body>
</html>