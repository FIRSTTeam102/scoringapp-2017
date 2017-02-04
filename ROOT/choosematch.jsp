<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>


<sql:query dataSource="${database}" var="result">
select mt1.match_number, m.start_time, mt1.team_number as team1, mt2.team_number as team2, mt3.team_number as team3, mt1.initials
  from matches m, match_teams mt1, match_teams mt2, match_teams mt3, tournaments t
    where t.active = 'Y'  and m.tournament_id = t.ID
      and mt1.tournament_id = m.tournament_id  and mt1.match_number = m.match_number
        and mt1.completed = 'N'  and mt1.alliance = ?
        and mt1.seq_no = 1  and mt2.team_number != mt1.team_number
      and mt2.tournament_id = mt1.tournament_id
        and mt2.match_number = mt1.match_number  and mt2.completed = mt1.completed
        and mt2.alliance = mt1.alliance  and mt2.seq_no = 2
      and mt3.team_number != mt1.team_number  and mt3.team_number != mt2.team_number
        and mt3.tournament_id = mt1.tournament_id
        and mt3.match_number = mt1.match_number  and mt3.completed = mt1.completed
        and mt3.alliance = mt1.alliance  and mt3.seq_no = 3   order by m.match_number;
	<sql:param value="Blue"/>
</sql:query>
<c:set var="matches" scope="page" value="${result}" />

<c:out value="${matches }"/>


<div id="title" style="visibility: hidden">
	Match Selection: <c:forEach var="t" items="${tournament.rows}">
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
		<form id="MatchForm" action="choosematch.jsp" method="POST">
			<div id="nav">
				<input type="submit" name="btnNext" value="Next" />
			</div>
			<div id="Match">
					<c:forEach var="row" items="${matches.rows}"> <c:out value="${row}"/><c:out value="${row.team1}"/><c:out value="${row.team2}"/><c:out value="${row.team3}"/>
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
							<div class="team_holder">
								<c:out value="${row.team1}" />
							</div>
							<div class="team_holder">
								<c:out value="${row.team2}" />
							</div>
							<div class="team_holder">
								<c:out value="${row.team3}" />
							</div>
							<div class="team_holder">
								<c:out value="${row.initials}" />
							</div>
							<div style="clear: both;"></div>
						</label>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>