<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%--<%@include file="database.jsp" %> --%>

<!-- Yes, I am aware that this is very bad. Still, it's "password protected!" -->
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://198.100.45.55/Scoring2017?useOldAliasMetadataBehavior=true" user="gearheads"
	password="Gearhe3ads4prezdent"/>



<script src="resources/js/playoffs.js"></script>


<!-- TODO: Add a SUBMIT button + finisher and maybe a new table (playoff-matches) to the db for match predictions?-->

<h1>Playoff Alliance Selection</h1>
	<div class="playoff-form-row">	
		<div class="playoff-form-block" id="al1">
			<input type="radio" name="radAlliance" id="radAlliance1"><label for="radAlliance1"><h3>Alliance 1</h3></label>
			
			<div class="allianceTeam1" id="alliance1Team1"></div>
			<div class="allianceTeam2" id="alliance1Team2"></div>
			<div class="allianceTeam3" id="alliance1Team3"></div>
			
			
			<!-- <div class="form-line">
				<input type="number" id="Team1Alliance1" class="AllianceTeam"></input>
				<label for="Team1Alliance1">Alliance Captain</label>
			</div>
			<div class="form-line">
				<input type="number" id="Team2Alliance1"class="AllianceTeam"></input>
				<label for="Team2Alliance1">&emsp; Team Two &emsp;</label>
			</div>
			<div class="form-line">
				<input type="number" id="Team3Alliance1"class="AllianceTeam"></input>
				<label for="Team3Alliance1">&emsp; Team Three &emsp;</label>
			</div> -->
		</div>
		<div class="playoff-form-block" id="al2">
			<input type="radio" name="radAlliance" id="radAlliance2"><label for="radAlliance2"><h3>Alliance 2</h3></label>
				
			<div class="allianceTeam1" id="alliance2Team1"></div>
			<div class="allianceTeam2" id="alliance2Team2"></div>
			<div class="allianceTeam3" id="alliance2Team3"></div>
				
				
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance2" class="AllianceTeam"></input>
					<label for="Team1Alliance2">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance2" class="AllianceTeam"></input>
					<label for="Team2Alliance2">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance2" class="AllianceTeam"></input>
					<label for="Team3Alliance2">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
		<div class="playoff-form-block" id="al3">
			<input type="radio" name="radAlliance" id="radAlliance3"><label for="radAlliance3"><h3>Alliance 3</h3></label>
			
			<div class="allianceTeam1" id="alliance3Team1"></div>
			<div class="allianceTeam2" id="alliance3Team2"></div>
			<div class="allianceTeam3" id="alliance3Team3"></div>
				
			
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance3" class="AllianceTeam"></input>
					<label for="Team1Alliance3">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance3" class="AllianceTeam"></input>
					<label for="Team2Alliance3">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance3" class="AllianceTeam"></input>
					<label for="Team3Alliance3">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
		<div class="playoff-form-block" id="al4">
			<input type="radio" name="radAlliance" id="radAlliance4"><label for="radAlliance4"><h3>Alliance 4</h3></label>
				
			<div class="allianceTeam1" id="alliance4Team1"></div>
			<div class="allianceTeam2" id="alliance4Team2"></div>
			<div class="allianceTeam3" id="alliance4Team3"></div>
			
			
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance4" class="AllianceTeam"></input>
					<label for="Team1Alliance4">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance4" class="AllianceTeam"></input>
					<label for="Team2Alliance4">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance4" class="AllianceTeam"></input>
					<label for="Team3Alliance4">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
	</div>
	<div class="playoff-form-row">	
		<div class="playoff-form-block" id="al5">
			<input type="radio" name="radAlliance" id="radAlliance5"><label for="radAlliance5"><h3>Alliance 5</h3></label>
			
			<div class="allianceTeam1" id="alliance5Team1"></div>
			<div class="allianceTeam2" id="alliance5Team2"></div>
			<div class="allianceTeam3" id="alliance5Team3"></div>
			
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance5" class="AllianceTeam"></input>
					<label for="Team1Alliance5">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance5" class="AllianceTeam"></input>
					<label for="Team2Alliance5">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance5" class="AllianceTeam"></input>
					<label for="Team3Alliance5">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
		<div class="playoff-form-block" id="al6">
			<input type="radio" name="radAlliance" id="radAlliance6"><label for="radAlliance6"><h3>Alliance 6</h3></label>
			
			<div class="allianceTeam1" id="alliance6Team1"></div>
			<div class="allianceTeam2" id="alliance6Team2"></div>
			<div class="allianceTeam3" id="alliance6Team3"></div>
			
			
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance6" class="AllianceTeam"></input>
					<label for="Team1Alliance6">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance6" class="AllianceTeam"></input>
					<label for="Team2Alliance6">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance6" class="AllianceTeam"></input>
					<label for="Team3Alliance6">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
		<div class="playoff-form-block" id="al7">
			<input type="radio" name="radAlliance" id="radAlliance7"><label for="radAlliance7"><h3>Alliance 7</h3></label>
			
			<div class="allianceTeam1" id="alliance7Team1"></div>
			<div class="allianceTeam2" id="alliance7Team2"></div>
			<div class="allianceTeam3" id="alliance7Team3"></div>
			
			
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance7" class="AllianceTeam"></input>
					<label for="Team1Alliance7">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance7" class="AllianceTeam"></input>
					<label for="Team2Alliance7">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance7" class="AllianceTeam"></input>
					<label for="Team3Alliance7">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
		<div class="playoff-form-block" id="al8">
			<input type="radio" name="radAlliance" id="radAlliance8"><label for="radAlliance8"><h3>Alliance 8</h3></label>
			
			<div class="allianceTeam1" id="alliance8Team1"></div>
			<div class="allianceTeam2" id="alliance8Team2"></div>
			<div class="allianceTeam3" id="alliance8Team3"></div>
			
			
				<!-- <div class="form-line">
					<input type="number" id="Team1Alliance8" class="AllianceTeam"></input>
					<label for="Team1Alliance8">Alliance Captain</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team2Alliance8" class="AllianceTeam"></input>
					<label for="Team2Alliance8">&emsp; Team Two &emsp;</label>
				</div>
				<div class="form-line">
					<input type="number" id="Team3Alliance8" class="AllianceTeam"></input>
					<label for="Team3Alliance8">&emsp; Team Three &emsp;</label>
				</div> -->
		</div>
	</div>
	
<input type="submit" class="submit" id="btnUpdateUnchosen" value="Update Unchosen" onclick="updateUnchosen();">
	<div id="update-unchosen">
		
		
	</div>
	
	
	
	

		
		
			
		
		