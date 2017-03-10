<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="auth.jsp"%>
    
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://198.100.45.55/Scoring2017?useOldAliasMetadataBehavior=true" user="gearheads"
	password="Gearhe3ads4prezdent"/>

    
<c:if test="${param.autoData == null }">
	<script id="self-destruct">
		console.error("Data not successfully passed to alliance-finish");
		remove();
	</script>
</c:if>

<c:if test="${param.autoData != null }">
	
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
	
	<c:out value="${sessionScope.matchNumber }" />
	<c:out value="${sessionScope.team1 }${sessionScope.team2 }${sessionScope.team3 }"/>
	
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
		<sql:param value="${sessionScope.matchNumber }" />
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
		<sql:param value="${sessionScope.matchNumber }" />
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
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team3 }" />
</sql:update>

<script id="self-destruct">
	console.log("Autonomous successful");
	
	setTimeout( function() {swap("teleop",true);}, 0);
	remove();
</script>
</c:if>

