<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>

<%
	String allianceInput = request.getParameter("selAlliance");
	if (allianceInput != null) {
		session.setAttribute(allianceKey, allianceInput);
		%>
		<script id="self-destruct">
			//requestChoosematch(); uncommented to test finishAlCallChoosematch()
			remove();
		</script>
		<%

	}
%>