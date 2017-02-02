<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>FRC 2017 Scoring App | Team 102</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- OOH! JQuery! -->
	<script src="resources/js/login.js" type="text/javascript"></script>
</head>
<body>
	<div class="content">
		<!-- Contains larger header image by default. Main header loaded as part of AJAX. -->
		<header id="header">
			<img class="title-large" src="resources/images/header-steamworks-1.png"/>
		</header>
		<nav class="login-pane">
			<div>
				<form id="login-form" class="login-form" name="login-form" method="post">
					Username: <input type="text" name="username"><br>
					Password: <input type="password" name="password"><br>
					<input type="submit" value="Submit">
				</form>
			</div>
		</nav>
	</div>
</body>
</html>