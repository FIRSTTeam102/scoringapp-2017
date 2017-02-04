<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%-- HTML --%>

<div id="title" style="visibility: hidden"><c:forEach var="t" items="${tournament.rows}">
		<c:out value="${t.title}" />
	</c:forEach> Selection</div>
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
				<div style="font-size: 0.8em">
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