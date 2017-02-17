<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%
	String allianceInput = request.getParameter("selAlliance");
	if (allianceInput != null) {
		session.setAttribute(allianceKey, allianceInput);
		%>
		<script id="self-destruct">
			//setTimeout( function(){requestChoosematch();}, 1); 
			setTimeout( function() {swap("choosematch",true);}, 3);
			remove();
		</script>
		<%
	}
%>