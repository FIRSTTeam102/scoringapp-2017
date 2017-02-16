<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%> 

<%
%>
<h1>TeleOp Scoring!</h1>
<nav class="team" id="teleNav">
		<input type="radio" name="teamSelect" id="rdoSelTeam1" value="<%=team1%>"/>
		<label id="lblSelTeam1" for="rdoSelTeam1" class="teamNumber"><%=team1%></label>
		
		<input type="radio" name="teamSelect" id="rdoSelTeam2" value="<%=team2%>"/>
		<label id="lblSelTeam2" for="rdoSelTeam2" class="teamNumber"><%=team2%></label>
		
		<input type="radio" name="teamSelect" id="rdoSelTeam3" value="<%=team3%>"/>
		<label id="lblSelTeam3" for="rdoSelTeam3" class="teamNumber"><%=team3%></label>
		
		
		
		<input type="radio" name="actionAttempt" id="AttLowGoal" value="lowGoalAtt"/>
		<label for="AttLowGoal">Attempted Low Goal</label>
		
		<input type="radio" name="actionAttempt" id="AttHighGoal" value="HighGoalAtt"/>
		<label for="AttHighGoal">Attempted High Goal</label>
		
		
		<input type="radio" name="actionAttempt" id="AttGear" value="GearAtt"/>
		<label for="AttGear">Attempted Gear</label>
		
		<%//Definitely needs work, as does the backOnline %>
		<input type="submit" name="BrokeDown" id="btnBrokeDown" value="BrokeDown"/> 
		<label for="BrokeDown">Broke Down!</label>
		
		<input type="submit" name="actionAttempt" id="BackOnline" value="BackOnline"/>
		<label for="BackOnline">Back Online!</label>
		
</nav>

