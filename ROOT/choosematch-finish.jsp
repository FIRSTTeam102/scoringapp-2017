<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%//
	match = request.getParameter("rdoMatch");

	//for(int i = 0; strings.hasMoreElements(); i++){
	//	String str = strings.nextElement();
	//	out.println(str);
	//}
	if(alliance == null){
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "index.jsp");
	}
	if (match != null) {

		int matchIndex = match.indexOf('m');
		int team1Index = match.indexOf("a");
		int team2Index = match.indexOf("b");
		int team3Index = match.indexOf("c");

		String matchNum = match.substring(matchIndex + 2, team1Index);

		team1 = Integer.parseInt(match.substring(team1Index + 2, team2Index));
		team2 = Integer.parseInt(match.substring(team2Index + 2, team3Index));
		team3 = Integer.parseInt(match.substring(team3Index + 2));

		//out.println(team1);
		//out.println(team2);
		//out.println(team3);

		session.setAttribute("team1", team1);
		session.setAttribute("team2", team2);
		session.setAttribute("team3", team3);

		session.setAttribute(matchKey, matchNum);
		session.setAttribute("arenaData", null);
		
%>



<sql:update dataSource="${database}">
	UPDATE match_teams
		SET initials = ?
			WHERE
			tournament_id = ?
			AND match_number = ?
			AND team_number = ?
	<sql:param value="${sessionScope.initials }"/>
	<sql:param value="${tournament.rows[0].id}" />
	<sql:param value="${sessionScope.matchNumber }" />
	<sql:param value="${sessionScope.team3 }" />
</sql:update>


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
<c:set var="matches" scope="page" value="${result}" />

<script id="self-destruct">
			setTimeout( function(){swap("autonomous",false);}, 1); 
			//remove();
</script>


<script id="self-destruct">
	team1 = <%=team1%>;
	team2 = <%=team2%>;
	team3 = <%=team3%>;
	matchNum = "<%=matchNum%>"
	remove();
</script>

<%
	}else{
%>
	<script id="self-destruct">
		alert("No match selected, or an error has occurred");
		remove();
	</script>
<%
	}
%>