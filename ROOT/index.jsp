<!DOCTYPE html>
<html>
<head>
	<title>The Scoring App Login</title>
	<link rel="stylesheet" type="text/css" href="login-style.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- OOH! JQuery! -->
	<script src="login.js" type="text/javascript"></script>
</head>
<body>
	<div id="login-pane">
		<div class="transparent-box">
			<div>
				<form id="login-form" name="login-form" method="post">
					Username: <input type="text" name="username"><br>
					Password: <input type="password" name="password"><br>
					<input type="submit" value="Submit">
				</form>
			</div>
		</div>
	</div>
	<p id="isLoggedIn"></p>
</body>
</html>