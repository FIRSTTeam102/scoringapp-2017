<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<%--<c:catch var="teleCycleException"> --%>
	<%
		String btn = request.getParameter("clickedButton");
		String action = request.getParameter("action");
		int cycleTeam;
		try {
			cycleTeam = Integer.parseInt(request.getParameter("cycleTeam")); //safe b/c Integer.parseInt
		}
		catch (NumberFormatException l){
			return;//Done b/c means cycleTeam wasn't passed, so nothing else will work
		}
		
		//Need to create new variables to handle which SQL calls to make
		
		String sqlOp = null;  //will be sent into the operation_attempted column
		String sqlSucc = null; //Success or failure for success column. Only set if sqlOp is H,L, or G
		//^^ set to null to allow for passage into mysql as null...I'll explain in person
		
		if (action.equals("high")) {
			sqlOp = "H";
		}
		else if (action.equals("low")) {
			sqlOp = "L";
		}
		else if (action.equals("gear")) {
			sqlOp = "G";
		}
		else {//There's a hacker! (Or real bad packet loss...)
			return; 
				
		}
			
			
			
		//additional check for startup/breakdowns below
		if (btn.equals("broke")) {
				sqlOp = "B";
			}
		else if (btn.equals("online")){
				sqlOp = "O";
			}
		
		if (!(sqlOp.equals("B")||sqlOp.equals("O")) && sqlOp != null) {
			if (btn.equals("success")) {
				sqlSucc = "S";
			}
			else {
				sqlSucc = "F";
			}
		}
		//can directly pass in cycleTeam b/c sent thru Integer.parseInt and is an int
		
		//Creates EL variables of sqlOp and sqlSucc for use in sql stuff
		pageContext.setAttribute("cycleTeam", cycleTeam);
		pageContext.setAttribute("sqlOp", sqlOp);
		pageContext.setAttribute("sqlSucc", sqlSucc);
		
		//Below works on success, but not on anything else, apparently
		
		try {
			/*//Long cycNum = (Long) session.getAttribute("cycleNum"); 
			//Integer cycNum = Integer.parseInt((String) session.getAttribute("cycleNum"));*/
			Integer cycNum = (Integer) session.getAttribute("cycleNum");
			if (cycNum == null) {
				session.setAttribute("cycleNum", (Integer) 0);	
			}
			else { 
				int x = cycNum.intValue();
				session.setAttribute("cycleNum", (Integer) x + 1);
			}
		}
		catch (NumberFormatException l) { 
			session.setAttribute("cycleNum", 0);
		}
		catch (ClassCastException l) {
			session.setAttribute("cycleNum",(Integer) session.getAttribute("cycleNum") + 1);
		}
		
		//Thar be MySQL thingz below
	%>
	
	
	<c:if test="${sqlOp != null}"><%-- tests if there is an operation done (just in case) --%>
		<sql:update dataSource="${database}">
			INSERT INTO match_team_cycles VALUES (?, ?, ?, ?, ?, ?);<%-- Columns in order: Tournament, matchnum, team number, cycle number, operation, success --%>
			<sql:param value="${tournamentID}" />
			<sql:param value="${matchNum}" />
			<sql:param value='${cycleTeam }' />
			<sql:param value='${cycleNum}' />
			<sql:param value='${sqlOp}' />
			<sql:param value='${sqlSucc}' />
		</sql:update>
	</c:if>
<%-- </c:catch> 
<c:if test="${teleCycleException != null }">
	<script id="self-destruct">
		console.error("Teleop-cycle error! Error:" + '<c:out value="${teleCycleException}"/>');
	</script>
</c:if> --%>