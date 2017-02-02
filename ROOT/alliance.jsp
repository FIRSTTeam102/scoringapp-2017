<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<sql:query dataSource="${database}" var="tournamentQuery">
	<%="SELECT * FROM tournaments WHERE active = 'Y'"%>
</sql:query>
<c:set var="tournament" scope="session" value="${tournamentQuery}" />

<%
	String allianceInput = (String) request.getParameter("rdoAlliance"),
			sideInput = (String) request.getParameter("rdoSide");
	if (allianceInput != null && sideInput != null) {
		session.setAttribute(allianceKey, allianceInput);
		session.setAttribute(sideKey, sideInput);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "choosematch.jsp");

	}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8" http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1" />
<title>FRC 2016 Scoring App</title>
<meta name="viewport"
	content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
<link rel="stylesheet" href="stylesheet.css" />
</head>
<body class="no-js">
	<div id="page">
		<div class="main">
			<form id="CompetitionForm" action="scoringapp.jsp" method="post">
				<div id="Alliance">
					<div>Choose an Alliance</div>
					<div id="allianceList">
						<label for="rdoAllianceRed" id="lblRed"> <input
							type="radio" name="rdoAlliance" id="rdoAllianceRed" value="Red"
							tabindex="2" />Red
						</label> &nbsp;&nbsp; <label for="rdoAllianceBlue" id="lblBlue"> <input
							type="radio" name="rdoAlliance" id="rdoAllianceBlue" value="Blue"
							tabindex="3" />Blue
						</label>
					</div>
				</div>
				<div id="allianceList">
					<div>What side is the secret passage?</div>
					<div id="allianceList">
						<label for="rdoSideNear" id="lblNear"> <input type="radio"
							name="rdoSide" id="rdoSideNear" value="Near" tabindex="2" />Near
						</label> &nbsp;&nbsp; <label for="rdoSideFar" id="lblFar"> <input
							type="radio" name="rdoSide" id="rdoSideFar" value="Far"
							tabindex="3" />Far
						</label>
					</div>
				</div>
				<div id="nav">
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnChooseMatch" value="Choose Match" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/modernizr.js"></script>
</body>