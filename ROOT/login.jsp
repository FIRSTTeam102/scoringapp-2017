<%-- server-side login handler --%>
<%!String user;%>
<%!String pass;%>
<%user = request.getParameter("aUsr"); pass = request.getParameter("aPass");%>
<% 
if (user.equals("gearheads") && pass.equals("test") ){
	out.println("<div class=\"transparent-box\">OOH! Login successful!</div>");
}
else {
	out.println("<div class=\"transparent-box\">WRONG</div>");
	
}
%>