<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="auth.jsp"%> 

<h1>Post-match</h1>
<div id="AlliancePostMatch">
	<div class="form-block">
		<div class="rope">
			<input type="checkbox" name="chkTeam1ClimbedRope" id="chkTeam1ClimbedRope"
							value="Y"> <label for="chkTeam1ClimbedRope"><%=team1%> climbed rope</label>
		</div>
		<div class="rope">
			<input type="checkbox" name="chkTeam2ClimbedRope" id="chkTeam2ClimbedRope"
							value="Y"> <label for="chkTeam2ClimbedRope"><%=team2%> climbed rope</label>
		</div>
		<div class="rope">
			<input type="checkbox" name="chkTeam3ClimbedRope" id="chkTeam3ClimbedRope"
							value="Y"> <label for="chkTeam3ClimbedRope"><%=team3%> climbed rope</label>
		</div>
	</div>
	<div class="form-block">
		<div class="form-line">
			<input type="radio" name="rdoRotors" id="rdoRot0" value="0">
				<label for="rdoRot0">0 rotors spinning </label>
		</div>
		<div class="form-line">
			<input type="radio" name="rdoRotors" id="rdoRot1"value="1">
				<label for="rdoRot1">1 rotor spinning </label>
		</div>
		<div class="form-line">
			<input type="radio" name="rdoRotors" id="rdoRot2" value="2">
				<label for="rdoRot2">2 rotors spinning </label>
		</div>
		<div class="form-line">
			<input type="radio" name="rdoRotors" id="rdoRot3" value="3">
				<label for="rdoRot3">3 rotors spinning </label>
		</div>
		<div class="form-line">
			<input type="radio" name="rdoRotors" id="rdoRot4" value="4">
				<label for="rdoRot4">4 rotors spinning </label>
		</div>		
	</div>
	<div class="form-block">
		<div class="form-line">
		<input type="text" id="txtNumFouls" name="txtNumFouls" placeholder="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
			Number of fouls committed
		</div>
	<div class="form-line">
		<input type="text" id="txtNumFoulPts" placeholder="0" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
			Total point cost of fouls
		</div>
	</div>
	
	<div class="form-block">
	<div class="form-line">
		<input type="text" id="txtPts" placeholder="0" maxlength="3" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
			Number of points
		</div>	
	<div class="form-line">
		<input type="text" id="txtPressure" placeholder="0" maxlength="4" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
			Final pressure
		</div>
	</div>
	
</div>

<br/><br/><br/>
<input class="form-line" type="checkbox" name="chkIgnoreMatch" id="chkIgnoreMatch"
					value="Y"> <label for="chkIgnoreMatch">Ignore match</label>

<div class="form-line">					
	<input type="submit" id="btnFinishPostmatch" name="btnFinishPostmatch" onclick="finishPostmatch()">
</div>
	
</div>