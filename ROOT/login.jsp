<%-- server-side login handler --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp" %>
<% String user; String pass;

if(request.getParameter(userKey) != null && request.getParameter(passKey) != null){
	//^^^ vvv gets user and password
	user = request.getParameter(userKey); pass = request.getParameter(passKey);
	 
	
	if (pass.equals("Gearheads") ){
		
		//sets session variable for initials and checks isLoggedIn as true
		session.setAttribute(userKey, user);
		session.setAttribute(loginKey, true);
		%>
			<script id='self-destruct'>
				//Created loggedOn var (currently unused); calls function to request choosematch.jsp.
				loggedOn = true;
				console.log("Login successful");
				
				swap("alliance", false);
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