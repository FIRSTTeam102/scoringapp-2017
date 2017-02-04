<%-- server-side login handler --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp" %>
<% String user; String pass;

if(request.getParameter(userKey) != null && request.getParameter(passKey) != null){
	
	user = request.getParameter(userKey); pass = request.getParameter(passKey);
	 
	
	if (pass.equals("Gearheads") ){
		
		//sets session variable for initials
		//session.setAttribute(userKey, user);
		%>
			<script id='self-destruct'>
				//Created loggedOn var (currently unused); calls function to request choosematch.jsp.
				loggedOn = true;
				console.log("Login successful");
				requestAllianceSelection();
				remove();
			</script>
		<%
	}
	else {
		%>
		<script>alert("Password incorrect.");</script>
		<%
	}
	
} else {
	%>
		<script>alert("Put in a username and password!");</script>
	<%
}
%>