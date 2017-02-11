<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%//
	match = request.getParameter("rdoMatch");

	//for(int i = 0; strings.hasMoreElements(); i++){
	//	String str = strings.nextElement();
	//	out.println(str);
	//}
	if(alliance == null){//is this actually necessary?? It's a holdover from last year...
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "index.jsp");
	}
	if (match != null) {
		String[] matchInfo = match.split("\\s+"); //split on whitespace. First string is "#" and the match number, second is "@", third is start time, 4th is team1, 5th team2, 6th team3 
		String matchNum = matchInfo[0].substring(1);
		
		team1 = Integer.parseInt(matchInfo[3]);
		team2 = Integer.parseInt(matchInfo[4]);
		team3 = Integer.parseInt(matchInfo[5]);
		
		session.setAttribute("team1", team1);
		session.setAttribute("team2", team2);
		session.setAttribute("team3", team3);

		session.setAttribute(matchKey, matchNum);
		session.setAttribute("arenaData", null);
		
%>

<% 
	//pageContext.setAttribute(initialsKey, initials);
%>

<c:if test="${initials != null }">
	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET initials = ?
				WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${initials }"/>
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber}" />
		<sql:param value="${sessionScope.team3}" />
	</sql:update>
</c:if>

<%
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "pre-match.jsp");
	}
%>

<sql:query dataSource="${database}" var="result">
	<%="select mt1.match_number, m.start_time, mt1.team_number as team1, mt2.team_number as team2, mt3.team_number as team3, mt1.initials"
								+ " from matches m, match_teams mt1, match_teams mt2, match_teams mt3, tournaments t"
								+ " where t.active = 'Y'  and m.tournament_id = t.id"
								+ " and mt1.tournament_id = m.tournament_id  and mt1.match_number = m.match_number"
								+ " and mt1.completed = 'N'  and mt1.alliance = '" + alliance + "'"
								+ " and mt1.seq_no = 1  and mt2.team_number != mt1.team_number"
								+ " and mt2.tournament_id = mt1.tournament_id"
								+ " and mt2.match_number = mt1.match_number  and mt2.completed = mt1.completed"
								+ " and mt2.alliance = mt1.alliance  and mt2.seq_no = 2"
								+ " and mt3.team_number != mt1.team_number  and mt3.team_number != mt2.team_number"
								+ " and mt3.tournament_id = mt1.tournament_id"
								+ " and mt3.match_number = mt1.match_number  and mt3.completed = mt1.completed"
								+ " and mt3.alliance = mt1.alliance  and mt3.seq_no = 3" + " order by m.match_number;"%>
</sql:query>
<c:set var="matches" scope="page" value="${result}"/>
<script id="self-destruct">
			setTimeout( function(){requestAutonomous();}, 1); 
			//remove();
</script>
