<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="auth.jsp"%>
    
<c:if test="${param.autoData == null }">
	<script id="self-destruct">
		console.error("Data not successfully passed to alliance-finish");
		remove();
	</script>
</c:if>

<c:if test="${param.autoData != null && param.pilot1 != null && param.pilot2 != null}">
	
	<%-- Gathers data and creates array --%>
	<c:set var="autoData" value="${param.autoData }"/>
	<c:set var="dataArray" value="${fn:split(autoData, ',')}"/>
	<%-- autoDataRW is a rewrite of auto data (explained below) --%>
	<c:set var="autoDataRW" value=""/>
	
	<%-- Rewrites true-false into Y-N. This way is safer than doing it in JS, because dangerous SQL could be injected otherwise. --%>
	<c:forEach var="str" items="${dataArray }">
		<c:if test="${fn:substringAfter(str, ' ').equals('true') }">
			<c:set var="autoDataRW" value="${autoDataRW},${fn:substringBefore(str, ' ')}Y"/>
		</c:if>
		<c:if test="${fn:substringAfter(str, ' ').equals('false') }">
			<c:set var="autoDataRW" value="${autoDataRW},${fn:substringBefore(str, ' ')}F"/>
		</c:if>
	</c:forEach>
	
	<%-- pilot1 --%>
	<%-- First tests if pilot1 is equal to any of the three teams (to avoid sql injection) then sets page variable 'pilot1' --%>
	
	<fmt:parseNumber var="pilot1" type="number" value="${param.pilot1 }"/>
	<fmt:parseNumber var="pilot2" type="number" value="${param.pilot2 }"/>
	<c:choose>
		<c:when test="${pilot1 eq team1 || pilot1 eq team2 || pilot1 eq team3 }">
			<c:set var="pilot1" value="${param.pilot1 }"/>
		</c:when>
		<c:otherwise>
			<script id="self-destruct">
				console.error("dont hak us pl0x");
				remove();	
			</script>	
			<% System.exit(1); //eh just in case there's a haxor or something %>
		</c:otherwise>
	</c:choose>
	<%-- pilot2 --%>
	<c:choose>
		<c:when test="${pilot2 == team1 || pilot2 == team2 || pilot2 == team3 }">
			<c:set var="pilot2" value="${param.pilot2 }"/>
		</c:when>
		<c:otherwise>
			<script id="self-destruct">
				console.error("dont hak us pl0x");
				remove();
			</script>	
			<% System.exit(1); //eh just in case there's a haxor or something %>
		</c:otherwise>
	</c:choose>
<!--  	
<c:out value="${ autoDataRW}"/>
<c:out value="      ${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam1HumanGearSucc'), ',' )=='Y'?'S':'f' }"/>

	<c:out value="${tournamentID }" /> -->

<%-- Team 1 --%>
<sql:update dataSource="${database}">
		UPDATE match_teams
			SET auto_crossed_baseline = ?
				, auto_gear_attempt = ?
				, auto_gear_outcome = ?
				, auto_goal_attempt = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam1Cross'), ',' )}" /><%-- Searches through string and finds the one character 
																			between specified search key and the comma (indicating next variable)--%>
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam1AttGear'), ',' )}" />
		<sql:param value="${
			fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam1HumanGearSucc'), ',' ) == 'Y' ? 'S' : 
				fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam1RobotGearSucc'), ',' ) == 'Y' ?
					'H' : 'R'
		}" /> <%-- Determines the gear outcome by whether robot or human was successful: S=success, H=human failure, R=robot failure --%>
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam1Cross'), ',' )}" />
		<sql:param value="${tournamentID }" />
		<sql:param value="${matchNum }" />
		<sql:param value="${sessionScope.team1 }" />
</sql:update>

<%-- Team 2 --%>
<sql:update dataSource="${database}">
		UPDATE match_teams
			SET auto_crossed_baseline = ?
				, auto_gear_attempt = ?
				, auto_gear_outcome = ?
				, auto_goal_attempt = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam2Cross'), ',' )}" />
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam2AttGear'), ',' )}" />
		<sql:param value="${
			fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam2HumanGearSucc'), ',' ) == 'Y' ? 'S' : 
				fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam2RobotGearSucc'), ',' ) == 'Y' ? 'H' : 
					'R'
		}" />
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam2Cross'), ',' )}" />
		<sql:param value="${tournamentID }" />
		<sql:param value="${matchNum }" />
		<sql:param value="${sessionScope.team2 }" />
</sql:update>

<%-- Team 3 --%>
<sql:update dataSource="${database}">
		UPDATE match_teams
			SET auto_crossed_baseline = ?
				, auto_gear_attempt = ?
				, auto_gear_outcome = ?
				, auto_goal_attempt = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam3Cross'), ',' )}" /><%-- Substring between variable name and , is the data we want --%>
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam3AttGear'), ',' )}" />
		<sql:param value="${
			fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam3HumanGearSucc'), ',' ) == 'Y' ? 'S' : 
				fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam3RobotGearSucc'), ',' ) == 'Y' ? 'H' :
					 'R'
		}" />
		<sql:param value="${fn:substringBefore(fn:substringAfter(autoDataRW, 'chkTeam3Cross'), ',' )}" />
		<sql:param value="${tournamentID }" />
		<sql:param value="${matchNum }" />
		<sql:param value="${sessionScope.team3 }" />
</sql:update>


<%-- this jawn is for pilots --%>
<c:choose>
	<c:when test="${alliance == 'Blue' }">
		<sql:update dataSource="${database }">
			UPDATE matches
				SET blue_pilot_1 = ?
			        , blue_pilot_2 = ?
				WHERE
					tournament_id = ?
					AND match_number = ?
			<sql:param value="${pilot1 }"/>
			<sql:param value="${pilot2 }"/>
			<sql:param value="${tournamentID }"/>
			<sql:param value="${matchNum }"/>
		</sql:update>
	</c:when>
	<c:when test="${alliance == 'Red' }">
		<sql:update dataSource="${database }">
			UPDATE matches
				SET red_pilot_1 = ?
					, red_pilot_2 = ?
				WHERE
					tournament_id = ?
					AND match_number = ?
			<sql:param value="${pilot1 }"/>
			<sql:param value="${pilot2 }"/>
			<sql:param value="${tournamentID }"/>
			<sql:param value="${matchNum }"/>
		</sql:update>
	</c:when>
	<c:otherwise>
	<script id="self-destruct">
	console.error('alliance thing problem thing in autonomous-finish');
	</script>
	</c:otherwise>
</c:choose>

<script id="self-destruct">
	console.log("Autonomous successful");
	
	setTimeout( function() {swap("teleop",true);}, 0);
	remove();
</script>
</c:if>

