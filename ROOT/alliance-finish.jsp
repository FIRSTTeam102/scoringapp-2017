<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%
	String allianceInput = request.getParameter("selAlliance");
	if (allianceInput != null) {
		if(allianceInput.equals("Blue") || allianceInput.equals("Red")){
		session.setAttribute(allianceKey, allianceInput);
		%>
		<%--sets session variable of alliance --%>
		<c:set var="alliance" scope="session" value="${param.selAlliance }"/>
		
		<script id="self-destruct">
			//setTimeout( function(){requestChoosematch();}, 1); 
			alliance = '<%=allianceInput%>';
			requestChoosematch(); //Requests Choosematch because it needs to be done after alliance is selected
			updateAlliance();
			swap("choosematch",true);//Makes choosematch visible
			console.log("( ͡° ͜ʖ ͡°)");
			console.log("(that's a lenny face)")
			remove();
		</script>
		<%
		}
	}
%>