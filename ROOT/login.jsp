<%-- server-side login handler --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp" %>

<% String user; String pass;

if(request.getParameter("aUsr") != null && request.getParameter("aPass") != null){
	
	user = request.getParameter("aUsr"); pass = request.getParameter("aPass");
	 
	if (user.equals("gearheads") && pass.equals("test") ){
		out.println("<div class=\"transparent-box\">OOH! Login successful!</div>");
	}
	else {
		out.println("<div class=\"transparent-box\">WRONG</div>");
	}
	
} else {
	out.println("<script>alert('Put in a password!')</script>");
}
%>