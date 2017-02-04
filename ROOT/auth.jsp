<%-- This page is to initialize all required SQL database access, and to pull any session variables created in previous pages. --%>
<%-- All of the code is run each time a page is loaded. --%>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
if(!request.getMethod().equals("POST")){
	%>
	<script>alert("Either there has been an error or you have attempted to load a page you are unauthorized to access.");</script>
	<%
	//response.setStatus(response.SC_MOVED_TEMPORARILY);
	//response.setHeader("Location", ".");
}
%>

<% //Sets keys for naming session variables and request parameters. Useful because renaming a variable is easier than renaming a string.
String 
userKey = "user", //Username = user's initials.
passKey = "pass",
allianceKey = "allianceColor",
tournamentNameKey = "tournamentName",
tournamentIDKey = "tournamentID",
matchKey = "matchNumber";
%>

<% //Sets local variables from session variables when each page loads.
String alliance = (String)session.getAttribute(allianceKey); //Alliance color
String tournament = (String)session.getAttribute(tournamentNameKey); //Tournament name
String tournamentID = (String)session.getAttribute(tournamentIDKey); //
String match = (String)session.getAttribute(matchKey); //Match number
String initials = (String)session.getAttribute(userKey); //User = initials

%>

<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://198.100.45.55/Scoring2017" user="gearheads"
	password="Gearhe3ads4prezdent"/>
