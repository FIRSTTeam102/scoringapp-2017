<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<!--<c:catch var="teleCycleException"> -->
	<%
		String btn = request.getParameter("clickedButton");
		String action = request.getParameter("action");
		int cycleTeam = Integer.parseInt(request.getParameter("cycleTeam")); 
			
		
		//MySQL thingz
	%>
	
<c:choose>
		<%-- Handles new matches and match cycle number. --%>
		<c:when test="${param.newMatch=='true' }">
			<c:set var="cycleNum" scope="session" value="${0}"/>
		</c:when>
		<c:otherwise>
			<c:set var="cycleNum" scope="session" value="${cycleNum + 1 }"/>
		</c:otherwise>
	</c:choose>
	
	<script id="self-destruct">
		console.log(<c:out value="${cycleNum }"/>);
	</script>
	
	<c:if test="${true != true }"><%//will get removed after app goes live %>
		<sql:update dataSource="${database}">
			INSERT INTO match_team_cycles VALUES (?, ?, ?, ?, ?, ?);
			<sql:param value="${tournaments.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value='<%=request.getParameterValues("teamNumber")[0]%>' />
			<sql:param value='${cycleNumber}' />
			<sql:param value='<%=request.getParameterValues("operationAttempted")[0]%>' />
			<sql:param value='<%=request.getParameterValues("succeeded")[0]%>' />
		</sql:update>
	</c:if>
<!--</c:catch>-->
<c:if test="${teleCycleException != null }">
	<script id="self-destruct">
		console.error("Teleop-cycle error! Error:" + '<c:out value="${teleCycleException}"/>');
	</script>
</c:if>