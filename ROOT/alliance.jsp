<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<form id="AllianceForm" method="post" >
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

</form>
	<div style="padding-top: 10px; padding-bottom: 10px;">
		<input type="submit" class="submit" name="btnChooseMatch" onclick="finishAlliance()" value="Choose Match"/>
	</div>