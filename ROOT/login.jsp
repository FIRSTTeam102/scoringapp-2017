<%-- server-side login handler --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% String user; String pass;

if(request.getParameter("user") != null && request.getParameter("pass") != null){
	//^^^ vvv gets user and password
	user = request.getParameter("user"); pass = request.getParameter("pass");
	 
	
	if (pass.equals("Gearheads") ){
		
		//sets session variable for initials and checks isLoggedIn as true
		session.setAttribute("user", user);
		session.setAttribute("isLoggedIn", true);
		%>
			<script id='self-destruct'>
				//Created loggedOn var (currently unused); calls function to request alliance.jsp.
				loggedOn = true;
				console.log("Login successful");
				
				swap("alliance", false);
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