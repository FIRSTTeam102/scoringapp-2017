<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%> 

<%//THERE ARE <BR>s RIGHT NOW!!!!!!!!!!!(And other gross styling things)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%>
<h1>TeleOp Scoring!</h1>
<nav id="teleNav">
		<input type="radio" name="teamSelect" id="rdoSelTeam1" value="<%=team1%>"/>
		<label id="lblSelTeam1" for="rdoSelTeam1" class="teamNumber"><%=team1%></label>

		<br/>
		
		<input type="radio" name="teamSelect" id="rdoSelTeam2" value="<%=team2%>"/>
		<label id="lblSelTeam2" for="rdoSelTeam2" class="teamNumber"><%=team2%></label>
		
		<br/>
		
		<input type="radio" name="teamSelect" id="rdoSelTeam3" value="<%=team3%>"/>
		<label id="lblSelTeam3" for="rdoSelTeam3" class="teamNumber"><%=team3%></label>
		
		<br/>
		
		<input type="radio" name="actionAttempt" id="AttLowGoal" value="lowGoalAtt"/>
		<label for="AttLowGoal">Attempted Low Goal</label>
		
		<br/>
		
		<input type="radio" name="actionAttempt" id="AttHighGoal" value="HighGoalAtt"/>
		<label for="AttHighGoal">Attempted High Goal</label>
		
		<br/>
		
		<input type="radio" name="actionAttempt" id="AttGear" value="GearAtt"/>
		<label for="AttGear">Attempted Gear</label>
		
		<!-- WIP -->
		
		<br/>
		
		<input type="submit" id="subSuccCycle" value="Success" onclick="subTeleCycle()"> <input type="submit" id="subFailCycle" value="Failure" onclick="subTeleCycle()">
		
		<br/>
		
		<input type="submit" name="actionAttempt" id="btnBrokeDown" value="Broke Down"/> 
		
		<br/>
		
		<input type="submit" name="actionAttempt" id="BackOnline" value="Back Online"/>
		
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<input type="submit" id="btnFinishTeleop" onclick="finishTeleop()" value="Teleop is Finished">
		<br/>
		<br/>
		<br/>
</nav>

