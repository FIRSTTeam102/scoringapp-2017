<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<script src="resources/js/autonomous.js"></script>
<h1>Autonomous</h1>
<div id="pilotSelection">
	<h2 class="teamNumber">Pilot 1</h2>
	<input type="radio" name="pilot1Select" id="rdoPilTeam1" value="<%=team1%>"/>
		<label id="lblPilTeam1" for="rdoPilTeam1" class="teamNumber"><%=team1%></label>
	<input type="radio" name="pilot1Select" id="rdoPilTeam2" value="<%=team2%>"/>
		<label id="lblPilTeam2" for="rdoPilTeam2" class="teamNumber"><%=team2%></label>
	<input type="radio" name="pilot1Select" id="rdoPilTeam3" value="<%=team3%>"/>
		<label id="lblPilTeam3" for="rdoPilTeam3" class="teamNumber"><%=team3%></label>
		
		
	<h2 class="teamNumber" >Pilot 2</h2>
	<input type="radio" name="pilot2Select" id="rdoPilTeam1" value="<%=team1%>"/>
		<label id="lblPilTeam1" for="rdoPilTeam1" class="teamNumber"><%=team1%></label>
	<input type="radio" name="pilot2Select" id="rdoPilTeam2" value="<%=team2%>"/>
		<label id="lblPilTeam2" for="rdoPilTeam2" class="teamNumber"><%=team2%></label>
	<input type="radio" name="pilot2Select" id="rdoPilTeam3" value="<%=team3%>"/>
		<label id="lblPilTeam3" for="rdoPilTeam3" class="teamNumber"><%=team3%></label>
		
		
</div>
<nav class="team" id="team1holder">
	<h2 id="team1Number" class="teamNumber"><%=team1%></h2>
	<div class="form-line" id="team1Cross">
		<input type="checkbox" name="chkTeam1Cross" id="chkTeam1Cross"
			value="Y"> <label for="chkTeam1Cross">Robot Crossed Baseline</label>
	</div>
	<div class="form-line" id="team1AttGear">
		<input type="checkbox" name="chkTeam1AttGear" id="chkTeam1AttGear"
			value="Y"> <label for="chkTeam1AttGear">Attempted Gear Load</label>
	</div>
	<div class="form-line" id="team1RobotGear">
		<input type="checkbox" class="margin1" name="chkTeam1RobotGearSucc" id="chkTeam1RobotGearSucc"
			value="Y"> <label for="chkTeam1RobotGearSucc">Robot Dep. Gear</label>
	</div>
	<div class="form-line" id="team1HumanGear">
		<input type="checkbox" class="margin1" name="chkTeam1HumanGearSucc" id="chkTeam1HumanGearSucc"
			value="Y"> <label for="chkTeam1HumanGearSucc">Human Load. Gear</label>
	</div>
	<br/>
	<div class="form-line" id="team1AttHigh">
		<input type="checkbox" name="chkTeam1AttHigh" id="chkTeam1AttHigh"
			value="Y"> <label for="chkTeam1AttHigh">Attempted High Boiler</label>
	</div>
	<div class="form-line" id="team1HighSucc">
		<input type="checkbox" class="margin1" name="chkTeam1HighSucc" id="chkTeam1HighSucc"
			value="Y"> <label for="chkTeam1HighSucc">Scored High Boiler</label>
	</div>
	<div class="form-line" id="team1AttLow">
		<input type="checkbox" name="chkTeam1AttLow" id="chkTeam1AttLow"
			value="Y"> <label for="chkTeam1AttLow">Attempted Low Boiler</label>
	</div>
	<div class="form-line" id="team1LowSucc">
		<input type="checkbox" class="margin1" name="chkTeam1LowSucc" id="chkTeam1LowSucc"
			value="Y"> <label for="chkTeam1LowSucc">Scored Low Boiler</label>
	</div>
</nav>
<nav class="team" id="team2holder">
	<h2 id="team2Number" class="teamNumber"><%=team2%></h2>
	<div class="form-line" id="team2Cross">
		<input type="checkbox" name="chkTeam2Cross" id="chkTeam2Cross"
			value="Y"> <label for="chkTeam2Cross">Robot Crossed Baseline</label>
	</div>
	<div class="form-line" id="team2AttGear">
		<input type="checkbox" name="chkTeam2AttGear" id="chkTeam2AttGear"
			value="Y"> <label for="chkTeam2AttGear">Attempted Gear Load</label>
	</div>
	<div class="form-line" id="team2RobotGear">
		<input type="checkbox" class="margin2" name="chkTeam2RobotGearSucc" id="chkTeam2RobotGearSucc"
			value="Y"> <label for="chkTeam2RobotGearSucc">Robot Dep. Gear</label>
	</div>
	<div class="form-line" id="team2HumanGear">
		<input type="checkbox" class="margin2" name="chkTeam2HumanGearSucc" id="chkTeam2HumanGearSucc"
			value="Y"> <label for="chkTeam2HumanGearSucc">Human Load. Gear</label>
	</div>
	<br/>
	<div class="form-line" id="team2AttHigh">
		<input type="checkbox" name="chkTeam2AttHigh" id="chkTeam2AttHigh"
			value="Y"> <label for="chkTeam2AttHigh">Attempted High Boiler</label>
	</div>
	<div class="form-line" id="team2HighSucc">
		<input type="checkbox" class="margin2" name="chkTeam2HighSucc" id="chkTeam2HighSucc"
			value="Y"> <label for="chkTeam2HighSucc">Scored High Boiler</label>
	</div>
	<div class="form-line" id="team2AttLow">
		<input type="checkbox" name="chkTeam2AttLow" id="chkTeam2AttLow"
			value="Y"> <label for="chkTeam2AttLow">Attempted Low Boiler</label>
	</div>
	<div class="form-line" id="team2LowSucc">
		<input type="checkbox" class="margin2" name="chkTeam2LowSucc" id="chkTeam2LowSucc"
			value="Y"> <label for="chkTeam2LowSucc">Scored Low Boiler</label>
	</div>
</nav>
<nav class="team" id="team3holder">
	<h3 id="team3Number" class="teamNumber"><%=team3%></h3>
	<div class="form-line" id="team3Cross">
		<input type="checkbox" name="chkTeam3Cross" id="chkTeam3Cross"
			value="Y"> <label for="chkTeam3Cross">Robot Crossed Baseline</label>
	</div>
	<div class="form-line" id="team3AttGear">
		<input type="checkbox" name="chkTeam3AttGear" id="chkTeam3AttGear"
			value="Y"> <label for="chkTeam3AttGear">Attempted Gear Load</label>
	</div>
	<div class="form-line" id="team3RobotGear">
		<input type="checkbox" class="margin3" name="chkTeam3RobotGearSucc" id="chkTeam3RobotGearSucc"
			value="Y"> <label for="chkTeam3RobotGearSucc">Robot Dep. Gear</label>
	</div>
	<div class="form-line" id="team3HumanGear">
		<input type="checkbox" class="margin3" name="chkTeam3HumanGearSucc" id="chkTeam3HumanGearSucc"
			value="Y"> <label for="chkTeam3HumanGearSucc">Human Load. Gear</label>
	</div>
	<br/>
	<div class="form-line" id="team3AttHigh">
		<input type="checkbox" name="chkTeam3AttHigh" id="chkTeam3AttHigh"
			value="Y"> <label for="chkTeam3AttHigh">Attempted High Boiler</label>
	</div>
	<div class="form-line" id="team3HighSucc">
		<input type="checkbox" class="margin3" name="chkTeam3HighSucc" id="chkTeam3HighSucc"
			value="Y"> <label for="chkTeam3HighSucc">Scored High Boiler</label>
	</div>
	<div class="form-line" id="team3AttLow">
		<input type="checkbox" name="chkTeam3AttLow" id="chkTeam3AttLow"
			value="Y"> <label for="chkTeam3AttLow">Attempted Low Boiler</label>
	</div>
	<div class="form-line" id="team3LowSucc">
		<input type="checkbox" class="margin3" name="chkTeam3LowSucc" id="chkTeam3LowSucc"
			value="Y"> <label for="chkTeam3LowSucc">Scored Low Boiler</label>
	</div>
</nav>
<input type="submit" onclick="finishAutonomous()" id="subAuto"> 
