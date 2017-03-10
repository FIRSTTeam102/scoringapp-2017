<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%> 

<%-- for teleop-cycle --%>
<c:set var="cycleNum" scope="session" value="${0}"/>

<script src="resources/js/teleop.js"></script>
<h1>Teleop | Match <span id="match"><c:out value="${matchNum }"/></span> | <span id="alliance"><c:out value="${alliance }"/></span> Alliance</h1>
<table class="form-block teams" id="teleopTeamHolder">
	<tr>
		<td class="teleTeam" id="team1"><%=team1 %></td>
		<td class="teleTeam" id="team2"><%=team2 %></td>
		<td class="teleTeam" id="team3"><%=team3 %></td>
	</tr>
</table>
<div class="form-block">
	<div class="form-line">
		<input type="radio" name="actionAttempt" id="attLowGoal" value="low"/>
		<label for="AttLowGoal">Attempted Low Goal</label>
	</div>
	<div class="form-line">
		<input type="radio" name="actionAttempt" id="attHighGoal" value="high"/>
		<label for="AttHighGoal">Attempted High Goal</label>
	</div>
	<div class="form-line">
		<input type="radio" name="actionAttempt" id="attGear" value="gear"/>
		<label for="AttGear">Attempted Gear</label>
	</div>
</div>
<br/>
<div class="form-block noborder">
	<div class="form-line noborder">
		<input style="width: 100px;" type="submit" id="btnSubSuccCycle" value="Success">
		<input style="width: 100px;" type="submit" id="btnSubFailCycle" value="Failure">
	</div>
	<div class="form-line noborder">
		<input style="width: 130px;" type="submit" id="btnBrokeDown" value="Broke Down"/> 
		<input style="width: 130px;" type="submit" id="btnOnline" value="Back Online"/>	
	</div>
</div>
<br/><br/>
<div class="form-block noborder">
	<input type="submit" id="btnFinishTeleop" onclick="finishTeleop()" value="Teleop is Finished">
</div>