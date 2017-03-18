<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<%
	/*boolean t1Climbed = Boolean.parseBoolean(request.getParameter("t1Climb"));
	boolean t2Climbed = Boolean.parseBoolean(request.getParameter("t2Climb"));
	boolean t3Climbed = Boolean.parseBoolean(request.getParameter("t3Climb"));*/
	
	String t1ClimbedStr,t2ClimbedStr,t3ClimbedStr;
	try{
		if(request.getParameter("t1Climb").equals("Y")){
			t1ClimbedStr = "Y";
		}
		else {
			t1ClimbedStr = "N";
		}
	}catch(NullPointerException l){
		t1ClimbedStr = "N";
	}
	
	try{
		if(request.getParameter("t2Climb").equals("Y")){
			t2ClimbedStr = "Y";
		}
		else {
			t2ClimbedStr = "N";
		}
	}catch(NullPointerException l){
		t2ClimbedStr = "N";
	}
	
	try{
		if(request.getParameter("t3Climb").equals("Y")){
			t3ClimbedStr = "Y";
		}
		else {
			t3ClimbedStr = "N";
		}
	}catch(NullPointerException l){
		t3ClimbedStr = "N";
	}
	
	int rotorCount;
	int foulCount;
	int foulPoints;
	int points;
	int pressure;
	String ignore;
	
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
	
	try {
		if(request.getParameter("ignore") != null){
			
			if(request.getParameter("ignore").equals("true")){
				ignore = "Y";
			}else{
				ignore = "N";
			}
		}else{
			
			ignore = "N";
		}
	}
	catch(NumberFormatException l){
		ignore = "N";
	}
	
	pageContext.setAttribute("score", points);
	pageContext.setAttribute("pressure", pressure);
	pageContext.setAttribute("rotors", rotorCount);
	pageContext.setAttribute("foulpts", foulPoints);
	pageContext.setAttribute("ignore", ignore);
	
	//creates alliance color in allcaps
	String allianceCaps = alliance.toUpperCase();
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
				SET red_score = ?
			        , red_pressure = ?
			        , red_rotors = ?
			        , red_foulpts = ?
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
<%--
<sql:update dataSource="${database }">
	UPDATE match_teams
		SET ignore_match = ?
		WHERE tournament_id = ?
			AND match_number = ?
	<sql:param value="${ignore }"/>
	<sql:param value="${tournamentID }"/>
	<sql:param value="${matchNum }"/>
</sql:update>
 
<sql:update dataSource ="${database }">
		UPDATE match_teams
		SET completed = 'Y'
        WHERE tournament_id = ?
	    	AND match_number = ?
	    	AND alliance = ?
	<sql:param value="${tournamentID }"/>
	<sql:param value="${matchNum }"/>
	<sql:param value="<%=allianceCaps %>"/>
</sql:update>
--%>
<sql:update dataSource ="${database }">
		UPDATE match_teams
		SET climbed_rope = ?
        WHERE tournament_id = ?
	    	AND match_number = ?
	    	AND alliance = ?
	    	AND seq_no = 1
	<sql:param value="<%=t1ClimbedStr%>"/>
	<sql:param value="${tournamentID }"/>
	<sql:param value="${matchNum }"/>
	<sql:param value="<%=allianceCaps %>"/>
</sql:update>

<sql:update dataSource ="${database }">
		UPDATE match_teams
		SET climbed_rope = ?
        WHERE tournament_id = ?
	    	AND match_number = ?
	    	AND alliance = ?
	    	AND seq_no = 2
	<sql:param value="<%=t2ClimbedStr%>"/>
	<sql:param value="${tournamentID }"/>
	<sql:param value="${matchNum }"/>
	<sql:param value="<%=allianceCaps %>"/>
</sql:update>

<sql:update dataSource ="${database }">
		UPDATE match_teams
		SET climbed_rope = ?
        WHERE tournament_id = ?
	    	AND match_number = ?
	    	AND alliance = ?
	    	AND seq_no = 3
	<sql:param value="<%=t3ClimbedStr%>"/>
	<sql:param value="${tournamentID }"/>
	<sql:param value="${matchNum }"/>
	<sql:param value="<%=allianceCaps %>"/>
</sql:update>

<script id="self-destruct">
location.reload();
remove();
</script>
	<!--  	ADD COMPLETED FOR THE MATCH!!!!!!!! -->