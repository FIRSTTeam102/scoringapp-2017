<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<script src="resources/js/autonomous.js"></script>
<h1>Autonomous | Match <span id="match"><c:out value="${matchNum }"/></span> | <span id="alliance"><c:out value="${alliance }"/></span> Alliance</h1>
<c:catch var="autoException">
	<nav class="team" id="team1holder"><%// int x = 5/0; %>
		<h2 id="team1" class="teamNumber form-block"><%=team1%></h2>
		<div class="form-block">
			<div class="form-line pilot1" id="pilot1team1">
				<input type="radio" name="pilot1Select" id="rdoPil1Team1" class="-pilot -team1" val="<c:out value='${team1}'/>">
				<label for="rdoPil1Team1" class="pilot">Pilot 1</label>
			</div>
			<div class="form-line" id="pilot2team2">
				<input type="radio" name="pilot2Select" id="rdoPil2Team1" class="-pilot -team1" val="<c:out value='${team1}'/>">
				<label for="rdoPil2Team1" class="pilot">Pilot 2</label>
			</div>
		</div>
		<div class="form-block">
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
					value="Y"> <label for="chkTeam1RobotGearSucc">Robot Deposit Gear</label>
			</div>
			<div class="form-line" id="team1HumanGear">
				<input type="checkbox" class="margin1" name="chkTeam1HumanGearSucc" id="chkTeam1HumanGearSucc"
					value="Y"> <label for="chkTeam1HumanGearSucc">Human Load Gear</label>
			</div>
		</div>
		<div class="form-block">
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
		</div>
	</nav>
	<nav class="team" id="team2holder">
		<h2 id="team2" class="teamNumber form-block"><%=team2%></h2>
		<div class="form-block">
			<div class="form-line pilot1" id="pilot1team1">
				<input type="radio" name="pilot1Select" id="rdoPil1Team2" class="-pilot -team2" val="<c:out value='${team2}'/>">
				<label for="rdoPil1Team2" class="pilot">Pilot 1</label>
			</div>
			<div class="form-line" id="pilot2team2">
				<input type="radio" name="pilot2Select" id="rdoPil2Team2" class="-pilot -team2" val="<c:out value='${team2}'/>">
				<label for="rdoPil2Team2" class="pilot">Pilot 2</label>
			</div>
		</div>
		<div class="form-block">
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
					value="Y"> <label for="chkTeam2RobotGearSucc">Robot Deposit Gear</label>
			</div>
			<div class="form-line" id="team2HumanGear">
				<input type="checkbox" class="margin2" name="chkTeam2HumanGearSucc" id="chkTeam2HumanGearSucc"
					value="Y"> <label for="chkTeam2HumanGearSucc">Human Load Gear</label>
			</div>
		</div>
		<div class="form-block">
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
		</div>
	</nav>
	<nav class="team" id="team3holder">
		<h3 id="team3" class="teamNumber form-block"><%=team3%></h3>
		<div class="form-block">
			<div class="form-line pilot1" id="pilot1team1">
				<input type="radio" name="pilot1Select" id="rdoPil1Team3" class="-pilot -team3" val="<c:out value='${team3}'/>">
				<label for="rdoPil1Team3" class="pilot">Pilot 1</label>
			</div>
			<div class="form-line" id="pilot2team2">
				<input type="radio" name="pilot2Select" id="rdoPil2Team3" class="-pilot -team3" val="<c:out value='${team3}'/>">
				<label for="rdoPil2Team3" class="pilot">Pilot 2</label>
			</div>
		</div>
		<div class="form-block">
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
		</div>
		<div class="form-block">
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
		</div>
	</nav>
	<input type="submit" onclick="finishAutonomous()" id="subAuto"> 
</c:catch>
<c:if test="${autoException != null }">
	<script id="self-destruct">
		console.error("Autonomous error! Error:" + '<c:out value="${autoException}"/>');
	</script>
</c:if>