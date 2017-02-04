<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%
	String allianceInput;
	if (Boolean.valueOf(request.getParameter("rdioRedChecked"))) {
		allianceInput = "RED";
	}
	else {
		allianceInput = "BLUE";
	}
	if (allianceInput != null) {
		session.setAttribute(allianceKey, allianceInput);
		%>
		<script>requestChoosematch();</script>
		<script id="self-destruct">
			//requestChoosematch();
			remove();
		</script>
		<%

	}
%>