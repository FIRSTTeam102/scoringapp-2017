<%-- server-side login handler --%>
<%!String user;%>
<%!String pass;%>
<%user = request.getParameter("aUsr"); pass = request.getParameter("aPass");%>
<% 
if (user.equals("gearheads") && pass.equals("test") ){
	out.println("OOH! Login successful!");
}
else {
	out.println("WRONG");
	
}
%>