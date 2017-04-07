<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<% //Sets whether we care about ignorematch, depending on if this is dev or not
//out.println(isDev);
if(isDev == true){
	out.println("DEV");
	//pageContext.setAttribute("checkIgnore", "Y | N"); //if dev, then don't check for ignore
}else{
	//pageContext.setAttribute("checkIgnore", "Y"); //if not dev, check for ignore
	isDev = false;
}
%>
<c:if test="${bestTeam == null }"> <%-- best-team easter egg --%>
	<c:set var="bestTeam" value="102"/>
</c:if>

<sql:query dataSource="${database}" var="result">
select mt1.match_number, m.start_time, mt1.team_number as team1, mt2.team_number as team2, mt3.team_number as team3, mt1.initials
  from matches m, match_teams mt1, match_teams mt2, match_teams mt3, tournaments t
    where t.active = 'Y'  and m.tournament_id = t.ID
      and mt1.tournament_id = m.tournament_id  and mt1.match_number = m.match_number
        and mt1.completed = 'N'  and mt1.alliance = ?
        and mt1.ignore_match = <% if(isDev == true){out.print("'Y' | 'N'");}else{out.print("'N'");} %> <%--If not dev, then check if ignorematch = Y --%>
        and mt1.seq_no = 1  and mt2.team_number != mt1.team_number
      and mt2.tournament_id = mt1.tournament_id
        and mt2.match_number = mt1.match_number  and mt2.completed = mt1.completed
        and mt2.ignore_match = mt1.ignore_match
        and mt2.alliance = mt1.alliance  and mt2.seq_no = 2
      and mt3.team_number != mt1.team_number  and mt3.team_number != mt2.team_number
        and mt3.tournament_id = mt1.tournament_id
        and mt3.match_number = mt1.match_number  and mt3.completed = mt1.completed
        and mt3.ignore_match = mt1.ignore_match
        and mt3.alliance = mt1.alliance  and mt3.seq_no = 3   order by m.match_number;
	<sql:param value="${alliance }"/>
</sql:query>
<c:set var="matches" scope="page" value="${result}" />

<div id="title" style="visibility: hidden">
	Match Selection: <c:forEach var="t" items="${tournaments.rows}">
		<c:out value="${t.title}" />
	</c:forEach></div>
<script id="self-destruct">
	document.title = $("#title").html();
	$("#title").remove();
	remove();
</script>
<header class="header">
	<h1>Choose a Match</h1>
	<h1 id="allianceColor" class="<%=alliance%>"><%=alliance%>
		Alliance
	</h1>
</header>
<body>
<%
pageContext.setAttribute(initialsKey, initials);
%>


<input type="submit" class="submit" name="btnTopNext" value="Next" onclick="finishChoosematch()"/>
<form id="MatchForm" method="post">
		<c:forEach var="row" items="${matches.rows}">
			<label for="rdoMatch<c:out value="${row.match_number}" />"> 
				<div class="match_number">
					<input type="radio" name="rdoMatch"
						id="<c:out value="rdoMatch${row.match_number}" />"
						value="m:<c:out value="${row.match_number}" />a:<c:out value="${row.team1}"/>b:<c:out value="${row.team2}"/>c:<c:out value="${row.team3}"/>" />
					<%="#"%><c:out value="${row.match_number}" />
					@ 
					<c:out value="${row.start_time}" />
				</div> <input type="hidden" value="<c:out value="${row.team1}"/>"
				name="team1"></input> <input type="hidden"
				value="<c:out value="${row.team2}"/>" name="team2"></input> <input
				type="hidden" value="<c:out value="${row.team3}"/>" name="team3"></input>
				<div class="team_holder<c:if test="${row.team1 == bestTeam }"> best_team</c:if>"> <%-- bestTeam stuff --%>
					<c:out value="${row.team1}" />
				</div>
				<div class="team_holder<c:if test="${row.team2 == bestTeam }"> best_team</c:if>">
					<c:out value="${row.team2}" />
				</div>
				<div class="team_holder<c:if test="${row.team3 == bestTeam }"> best_team</c:if>">
					<c:out value="${row.team3}" />
				</div>
				<div class="team_holder">
					<c:out value="${row.initials }" />
				</div>
				<div style="clear: both;"></div>
			</label>
		</c:forEach>
</form>

<input type="submit" class="submit" name="btnNext" value="Next" onclick="finishChoosematch()"/>
<input type="submit" class="submit" name="btnRefresh" value="Refresh Page" onclick="requestChoosematch()"/>
</body>

<script id="self-destruct"> <%-- Sets title --%>
	document.title = "Match Selection | Match <c:out value="${matchNum }"/> | <c:out value="${alliance }"/> Alliance"
</script>