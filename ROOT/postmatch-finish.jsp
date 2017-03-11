<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<%
	boolean t1Climbed = Boolean.parseBoolean(request.getParameter("t1Climb"));
	boolean t2Climbed = Boolean.parseBoolean(request.getParameter("t2Climb"));
	boolean t3Climbed = Boolean.parseBoolean(request.getParameter("t3Climb"));
	
	int rotorCount;
	int foulCount;
	int foulPoints;
	int points;
	int pressure;
	
	try{
		rotorCount = Integer.parseInt(request.getParameter("rotNum"));
	}catch(NumberFormatException l){
		rotorCount = 0;
	}

	try{
		foulPoints = Integer.parseInt(request.getParameter("numFoulPoints"));
	}catch(NumberFormatException l){
		foulPoints = 0;
	}
	/*if(request.getParameter("pts") == null){
		points = 0;
	}else{
		points = Integer.parseInt(request.getParameter("points"));
	}	*/
	
	try {
		points = Integer.parseInt(request.getParameter("pts"));
	}
	catch (NumberFormatException l) {
		points = 0;
	}
	
	try {
		pressure = Integer.parseInt(request.getParameter("pressure"));
	}
	catch (NumberFormatException l) {
		pressure = 0;
	}
	
	pageContext.setAttribute("score", points);
	pageContext.setAttribute("pressure", pressure);
	pageContext.setAttribute("rotors", rotorCount);
	pageContext.setAttribute("foulpts", foulPoints);
	
%>
<%-- 	debugging
			<c:out value="${score}"/>
			<c:out value="${pressure}"/>
			<c:out value="${rotors}"/>
			<c:out value="${foulpts}"/>
			<c:out value="${tournamentID}"/>
			<c:out value="${matchNum}"/>
--%>
<c:choose>
	<c:when test="${alliance == 'Blue' }">
		<sql:update dataSource="${database }">
			UPDATE matches
				SET blue_score = ?
			        , blue_pressure = ?
			        , blue_rotors = ?
			        , blue_foulpts = ?
				WHERE tournament_id = ?
					AND match_number = ?
			<sql:param value="${score}"/>
			<sql:param value="${pressure}"/>
			<sql:param value="${rotors}"/>
			<sql:param value="${foulpts}"/>
			<sql:param value="${tournamentID}"/>
			<sql:param value="${matchNum}"/>
		</sql:update>
	</c:when>
	<c:when test="${alliance == 'Red' }">
		<sql:update dataSource="${database }">
			UPDATE matches
				SET 
			        red_score = ?
			        red_pressure = ?
			        red_rotors = ?
			        red_foulpts = ?
				WHERE tournament_id = ?
					AND match_number = ?
			<sql:param value="${score}"/>
			<sql:param value="${pressure}"/>
			<sql:param value="${rotors}"/>
			<sql:param value="${foulpts}"/>
			<sql:param value="${tournamentID}"/>
			<sql:param value="${matchNum}"/>
		</sql:update>
	</c:when>
	<c:otherwise>
	<script id="self-destruct">
	console.error('alliance thing problem thing in postmatch-finish');
	</script>
	</c:otherwise>
</c:choose>
<script id="self-destruct">
swap("choosematch",true);
remove();
</script>
	<!--  	ADD COMPLETED FOR THE MATCH!!!!!!!! -->
