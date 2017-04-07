<%-- Loads tag libraries to load database page without errors --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@include file="resources/isDev.jsp" %>
<%@include file="database.jsp" %>

<% //If request is get, check if there are any parameters
if(request.getMethod().equals("GET")){ %>
	<c:if test="${param.p == 'survey' }"> <%-- 'p' parameter is short for 'page' --%> <%-- if scouting is selected, use JS to request survey --%>
		<script>window.onload = function(){ 
			requestSurvey();
		}</script>
	</c:if>
	<c:if test="${param.p == 'preview' }"><%-- if match preview is specified, use JS to request survey --%>
		<script>window.onload = function(){ 
			requestPreview(); 
		}</script>
	</c:if>
	<c:if test="${param.p == 'standings' }"><%-- if standings is specified, use JS to request survey --%>
		<script>window.onload = function(){ 
			requestStandings(); 
		}</script>
	</c:if>
	<c:if test="${param.p == 'upcoming' }">
		<c:if test="${param.team != null }">
			<script>window.onload = function(){
				upcomingTeam = <%= request.getParameter("team") %>;
				requestUpcoming(upcomingTeam);
			}
			</script>
		</c:if>
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
	<title>Team 102 | FRC 2017 Scouting App</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
	<script src="resources/js/jquery-3.1.1.min.js"></script> <!-- OOH! JQuery! -->
	<script src="resources/js/main.js" type="text/javascript"></script>
	<script src="resources/js/login.js" type="text/javascript"></script>
	<script src="resources/js/ui.js" type="text/javascript"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	
</head>
<body>
	<div class="content" id="content">
		<input class=sidenav-button id="sidenav-buton" type="submit" onclick="toggleSidenav()" value="Navigation"/>
		<nav id="sidenav" class="sidenav">
			<input type="submit" id="navLogin" value="Home" onclick="swap('login', false)">
			<input disabled type="submit" id="nav-alliance" onclick="navSwap('alliance', true)" value="Alliance">
			<input disabled type="submit" id="nav-choosematch" onclick="navSwap('choosematch', true)" value="Choosematch">
			<input disabled type="submit" id="nav-autonomous" onclick="navSwap('autonomous', true)" value="Autonomous">
			<input disabled type="submit" id="nav-teleop" onclick="navSwap('teleop', true)" value="Teleop">
			<input disabled type="submit" id="nav-postmatch" onclick="navSwap('postmatch', true)" value="Post-Match">
			<input type="submit" id="nav-survey" onclick="navSwap('survey', true)" value="Scouting Survey">
			<input type="submit" id="nav-standings" onclick="navSwap('standings', true)" value="Standings">
			<input type="submit" id="nav-preview" onclick="navSwap('preview', true)" value="Match Preview">
			<input type="submit" id="nav-upcoming" onclick="navSwap('upcoming', true)" value="102 Upcoming">
		</nav>
		
		<header id="header">
			<img class='title-small' src='resources/images/header-steamworks-1.png' />
			<h2 class='header' id='Tournament'><c:out value='${tournament}' /></h2>
		</header>
		
		<nav id="login" class="container">
			<div class="btn-container">
				<input type="submit" value="Tournament Standings" onclick="requestStandings();">
			</div>
			<div class="btn-container">
				<input type="submit" value="Match Preview" onclick="requestPreview();">
			</div>
			<div class="btn-container">
				<input type="number" id="upcomingTeam" placeholder="Team #" style="width: 80px"><input type="submit" value="Upcoming Matches" onclick="requestUpcoming($('#upcomingTeam').val());">
			</div>	
			<!-- <div class="btn-container">
				<input disabled type="submit" value="Alliance Selection">
			</div>  -->
			<div class="btn-container">
				<input type="submit" value="Alliance Color Lighter" onclick="swap('lighter', false);">
			</div>
			<br/>
			<form id="login-form" class="login-form" name="login-form" method="post">
				<!-- Your Initials: <input type="text" name="initialsInput" maxlength="4" autocorrect="off" autocapitalize="characters" ><br>
				&nbsp;&nbsp;&nbsp; -->Password: <input type="password" name="password" id="password"><br>
				<div class="btn-container">
					<input disabled type="submit" value="Team 102 Scoring App" id="btnApp">
				</div>
			</form>
			<div class="btn-container">
				<input disabled type="submit" value="Scouting Survey" id="btnSurvey" onclick="requestSurvey();">
			</div>
			
			<div class="btn-container">
				<input disabled type="submit" value="Playoff Alliances" id="btnPlayoffs" onclick="requestPlayoffs();">
			</div>
			 
		</nav>
		<article id="alliance" class="container"></article>
		<article id="choosematch" class="container"></article>
		<article id="autonomous" class="container"></article>
		<article id="teleop" class="container"></article>
		<article id="postmatch" class="container"></article>
		<article id="survey" class="container"></article>
		<article id="standings" class="container"></article>
		<article id="preview" class="container"></article>
		<article id="upcoming" class="container"></article>
		<article id="playoffs" class="container"></article>
		<div id="lighter" style="display: none;">
			<div>&nbsp;</div>
			<div class="red"><a onclick="lighter('red');" style="color: white; text-decoration: none;">Red Lighter</a></div>
			<div>&nbsp;</div>
			<div class="blue"><a onclick="lighter('blue');" style="color: white; text-decoration: none;" class="fullWidthLink">Blue Lighter</a></div>
		</div>
	</div>
<!-- moved sidenav to top -->
	<input id="back" type="submit" value="Back" onclick="lighter();" style="display: none"><!-- for lighter -->
</body>
</html>
