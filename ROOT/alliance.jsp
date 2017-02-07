<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<sql:query dataSource="${database}" var="tournamentQuery">
	<%="SELECT * FROM tournaments WHERE active = 'Y'"%>
</sql:query>
<c:set var="tournament" scope="session" value="${tournamentQuery}" />



<form id="CompetitionForm" method="post" >
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
	<div style="padding-top: 10px; padding-bottom: 10px;">
		<input type="submit" name="btnChooseMatch" value="Choose Match" />
	</div>
</form>
<script id="self-destruct">
	$("#header").html("<%@include file='header.jsp'%>");
	remove();
</script>