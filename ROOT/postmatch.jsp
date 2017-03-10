<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="auth.jsp"%> 
    
<h1>Post-match</h1>
<div id="blueAlliancePostMatch">
	<div id="blueRope">
	<input type="checkbox" name="chkTeam1ClimbedRope" id="chkTeam1ClimbedRope"
					value="Y"> <label for="chkTeam1ClimbedRope"><%=team1%> climbed rope</label>
	<input type="checkbox" name="chkTeam2ClimbedRope" id="chkTeam2ClimbedRope"
					value="Y"> <label for="chkTeam2ClimbedRope"><%=team2%> climbed rope</label>
	<input type="checkbox" name="chkTeam3ClimbedRope" id="chkTeam3ClimbedRope"
					value="Y"> <label for="chkTeam3ClimbedRope"><%=team3%> climbed rope</label>
	</div>
	<div id="blueRotors">
		<input type="radio" name="rdoBlueRotors" id="rdoBlueRot0" value="0">
				<label for="rdoBlueRot0">0 rotors spinning </label>
		<input type="radio" name="rdoBlueRotors" id="rdoBlueRot1"value="1">
				<label for="rdoBlueRot1">1 rotor spinning </label>
		<input type="radio" name="rdoBlueRotors" id="rdoBlueRot2" value="2">
				<label for="rdoBlueRot2">2 rotors spinning </label>
		<input type="radio" name="rdoBlueRotors" id="rdoBlueRot3" value="3">
				<label for="rdoBlueRot3">3 rotors spinning </label>
		<input type="radio" name="rdoBlueRotors" id="rdoBlueRot4" value="4">
				<label for="rdoBlueRot4">4 rotors spinning </label>
	</div>
	<div id="blueFouls">
		<div>
		<input type="text" id="txtNumBlueFouls" name="txtNumBlueFouls">
			<label for="txtNumBlueFouls">Number of fouls committed</label>
		</div>
		<div>
		<input type="text" id="txtBlueFoulPts">
			<label for="txtNumBlueFoulPts">Total point cost of fouls</label>
		</div>
	</div>
	
	<div id="blueScores">
	<div>
		<input type="text" id="txtBluePts">
			<label for="txtBluePts">Number of points</label>
		</div>	
		<div>
		<input type="text" id="txtBluePressure">
			<label for="txtNumBluePressure">Final pressure</label>
		</div>
	</div>
	
</div>


<input type="checkbox" name="chkIgnoreMatch" id="chkIgnoreMatch"
					value="Y"> <label for="chkIgnoreMatch">Ignore match</label>

<div id="doneWithPostmatch">					
<input type="submit" id="btnFinishPostmatch" name="btnFinishPostmatch" onclick="finishPostmatch()">
	</div>