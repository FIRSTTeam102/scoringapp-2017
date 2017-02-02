<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>FRC 2017 Scoring App | Team 102</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- OOH! JQuery! -->
	<script src="resources/js/main.js" type="text/javascript"></script>
	<script src="resources/js/login.js" type="text/javascript"></script>
</head>
<body>
	<div class="content" id="content">
		<!-- Contains larger header image by default. Main header loaded as part of AJAX. -->
		<header id="header">
			<img class="title-large" src="resources/images/header-steamworks-1.png"/>
		</header>
		<nav id="login" class="login-pane">
				<form id="login-form" class="login-form" name="login-form" method="post">
					Your Initials: <input type="text" name="username"><br>
					&nbsp;&nbsp;&nbsp;Password: <input type="password" name="password"><br>
					<div class="btn-container">
						<input type="submit" value="Team 102 Scoring App">
					</div>
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
						<input type="submit" value="Mobile Alliance Lighter">
					</div>
				</form>
		</nav>
	</div>
</body>
</html>