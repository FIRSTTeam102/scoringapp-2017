<%-- Loads tag libraries to load database page without errors --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@include file="database.jsp" %>

<% //If request is get, check if there are any parameters
if(request.getMethod().equals("GET")){ %>
	<c:if test="${param.p == 'survey' }"> <%-- 'p' parameter is short for 'page' --%> <%-- if scouting is selected, use JS to request survey --%>
		<script>window.onload = function(){ 
			requestSurvey();
		}</script>
	</c:if>
	<c:if test="${param.p == 'matchPrev' }"><%-- if match preview is specified, use JS to request survey --%>
		<script>window.onload = function(){ 
			requestMatchPrev(); //not yet implemented (probably)
		}</script>
	</c:if>
	<c:if test="${param.p == 'standings' }"><%-- if standings is specified, use JS to request survey --%>
		<script>window.onload = function(){ 
			requestStandings(); //not yet implemented (probably)
		}</script>
	</c:if>
	<c:if test="${param.p == 'lighter' }"><%-- if lighter is specified, use JS to request survey --%>
		<script>window.onload = function(){ 
			swap('lighter');
		}</script>
	</c:if>
<% } %>

<sql:query dataSource="${database}" var="tournamentQuery">
	SELECT * FROM tournaments WHERE active = 'Y'
</sql:query>
<c:set var="tournament" scope="session" value="${tournamentQuery.rows[0].title}" />
<c:set var="tournamentID" scope="session" value="${tournamentQuery.rows[0].ID}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>FRC 2017 Scoring App | Team 102</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
	<script src="resources/js/jquery-3.1.1.min.js"></script> <!-- OOH! JQuery! -->
	<script src="resources/js/main.js" type="text/javascript"></script>
	<script src="resources/js/login.js" type="text/javascript"></script>
	<script src="resources/js/ui.js" type="text/javascript"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	
</head>
<body>
	<div class="content" id="content">
		<!-- Contains larger header image by default. Main header loaded as part of AJAX. -->
		<header id="header">
			<img class='title-small' src='resources/images/header-steamworks-1.png' />
			<h2 class='header' id='Tournament'><c:out value='${tournament}' /></h2>
		</header>
		<nav id="login" class="login-container">
			<form id="login-form" class="login-form" name="login-form" method="post">
				Your Initials: <input type="text" name="initialsInput" maxlength="4" autocorrect="off" autocapitalize="characters" ><br>
				&nbsp;&nbsp;&nbsp;Password: <input type="password" name="password"><br>
				<div class="btn-container">
					<input type="submit" value="Team 102 Scoring App">
				</div>
			</form>
			<div class="btn-container">
				<input type="submit" value="Scouting Survey" onclick="requestSurvey();">
			</div>
			<br/>
			<div class="btn-container">
				<input type="submit" value="Tournament Standings" onclick="requestStandings();">
			</div>
			<div class="btn-container">
				<input disabled type="submit" value="Match Preview">
			</div>		
			<div class="btn-container">
				<input disabled type="submit" value="Upcoming Matches">
			</div>	
			<div class="btn-container">
				<input disabled type="submit" value="Alliance Selection">
			</div>
			<div class="btn-container">
				<input type="submit" value="Mobile Alliance Lighter" onclick="swap('lighter', false);">
			</div>
		</nav>
		<article id="alliance" class="alliance-container"></article>
		<article id="choosematch" class="choosematch-container"></article>
		<article id="autonomous" class="autonomous-container"></article>
		<article id="teleop" class="teleop-container"></article>
		<article id="postmatch" class="postmatch-container"></article>
		<article id="survey" class="survey-container"></article>
		<article id="standings" class="standings-container"></article>
		<div id="lighter" style="display: none;">
			<div>&nbsp;</div>
			<div class="red"><a onclick="lighter('red');" style="color: white; text-decoration: none;">Red Lighter</a></div>
			<div>&nbsp;</div>
			<div class="blue"><a onclick="lighter('blue');" style="color: white; text-decoration: none;" class="fullWidthLink">Blue Lighter</a></div>
		</div>
	</div>
	<input class=sidenav-button id="sidenav-buton" type="submit" onclick="toggleSidenav()" value="Navigation"/>
	<nav id="sidenav" class="sidenav">
		<input type="submit" id="navLogin" value="Login" onclick="swap('login', false)">
		<input disabled type="submit" id="nav-alliance" onclick="navSwap('alliance', true)" value="Alliance">
		<input disabled type="submit" id="nav-choosematch" onclick="navSwap('choosematch', true)" value="Choosematch">
		<input disabled type="submit" id="nav-autonomous" onclick="navSwap('autonomous', true)" value="Autonomous">
		<input disabled type="submit" id="nav-teleop" onclick="navSwap('teleop', true)" value="Teleop">
		<input disabled type="submit" id="nav-postmatch" onclick="navSwap('postmatch', true)" value="Post-Match">
		<input type="submit" id="nav-survey" onclick="navSwap('survey', true)" value="Scouting Survey">
		<input type="submit" id="nav-standings" onclick="navSwap('standings', true)" value="Standings">
		
	</nav>
	<input id="back" type="submit" value="Back" onclick="lighter();" style="display: none"><!-- for lighter -->
</body>
</html>
