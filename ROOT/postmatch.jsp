<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="auth.jsp"%> 
    
<h1>Post-match</h1>
<div id="blueAlliancePostMatch">
	<h1>Blue Alliance</h1>
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
		<input type="text" id="txtNumBlueFouls">
			<label for="txtNumBlueFouls">Number of blue fouls committed</label>
		</div>
		<div>
		<input type="text" id="txtBlueFoulPts">
			<label for="txtNumBlueFoulPts">Point deduction total of blue fouls committed</label>
		</div>
	</div>
	
	<div id="blueScores">
	<div>
		<input type="text" id="txtBluePts">
			<label for="txtBluePts">Number of blue points</label>
		</div>	
		<div>
		<input type="text" id="txtBluePressure">
			<label for="txtNumBluePressure">Final blue pressure</label>
		</div>
	</div>
	
</div>
<div id="redAlliancePostMatch">
	<h1>Red Alliance</h1>
	<div id="redRope">
	<input type="checkbox" name="chkTeam1ClimbedRope" id="chkTeam1ClimbedRope"
					value="Y"> <label for="chkTeam1ClimbedRope"><%=team1%> climbed rope</label>
	<input type="checkbox" name="chkTeam2ClimbedRope" id="chkTeam2ClimbedRope"
					value="Y"> <label for="chkTeam2ClimbedRope"><%=team2%> climbed rope</label>
	<input type="checkbox" name="chkTeam3ClimbedRope" id="chkTeam3ClimbedRope"
					value="Y"> <label for="chkTeam3ClimbedRope"><%=team3%> climbed rope</label>
	</div>
	<div id="redRotors">
		<input type="radio" name="rdoRedRotors" id="rdoRedRot0" value="0">
				<label for="rdoRedRot0">0 rotors spinning </label>
		<input type="radio" name="rdoRedRotors" id="rdoRedRot1" value="1">
				<label for="rdoRedRot1">1 rotor spinning </label>
		<input type="radio" name="rdoRedRotors" id="rdoRedRot2" value="2">
				<label for="rdoRedRot2">2 rotors spinning </label>
		<input type="radio" name="rdoRedRotors" id="rdoRedRot3" value="3">
				<label for="rdoRedRot3">3 rotors spinning </label>
		<input type="radio" name="rdoRedRotors" id="rdoRedRot4" value="4">
				<label for="rdoRedRot4">4 rotors spinning </label>
	</div>
	<div id="redFouls">
		<div>
		<input type="text" id="txtNumRedFouls">
			<label for="txtNumRedFouls">Number of red fouls committed</label>
		</div>
		<div>
		<input type="text" id="txtRedFoulPts">
			<label for="txtNumRedFoulPts">Point deduction total of red fouls committed</label>
		</div>
	</div>
	
	<div id="redScores">
	<div>
		<input type="text" id="txtRedPts">
			<label for="txtRedPts">Number of red points</label>
		</div>	
		<div>
		<input type="text" id="txtRedPressure">
			<label for="txtNumRedPressure">Final red pressure</label>
		</div>
	</div>
</div>

<input type="checkbox" name="chkIgnoreMatch" id="chkIgnoreMatch"
					value="Y"> <label for="chkIgnoreMatch">Ignore match</label>

<div id="doneWithPostmatch">					
<input type="submit" id="btnFinishPostmatch" name="btnFinishPostmatch" onclick="finishPostmatch()">
	</div>