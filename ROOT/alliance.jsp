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
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "choosematch.jsp");

	}
%>

<form id="CompetitionForm" action="scoringapp.jsp" method="post">
	<div id="Alliance">
		<div>Choose an Alliance</div>
		<div class="allianceList">
			<label for="rdoAllianceRed" id="lblRed"> <input
				type="radio" name="rdoAlliance" id="rdoAllianceRed" value="Red"
				tabindex="2" />Red
			</label> &nbsp;&nbsp; <label for="rdoAllianceBlue" id="lblBlue"> <input
				type="radio" name="rdoAlliance" id="rdoAllianceBlue" value="Blue"
				tabindex="3" />Blue
			</label>
		</div>
	</div>
	<div class="allianceList">
		<div>What side is the secret passage?</div>
		<div class="allianceList">
			<label for="rdoSideNear" id="lblNear"> <input type="radio"
				name="rdoSide" id="rdoSideNear" value="Near" tabindex="2" />Near
			</label> &nbsp;&nbsp; <label for="rdoSideFar" id="lblFar"> <input
				type="radio" name="rdoSide" id="rdoSideFar" value="Far"
				tabindex="3" />Far
			</label>
		</div>
	</div>
	<div style="padding-top: 10px; padding-bottom: 10px;">
		<input type="submit" name="btnChooseMatch" value="Choose Match" />
	</div>
</form>
<script id="self-destruct">
	$("#header").html("<%@include file='header.jsp'%>");
	remove();
</script>