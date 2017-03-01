<%-- This page is to initialize all required SQL database access, and to pull any session variables created in previous pages. --%>
<%-- All of the code is run each time a page is loaded. --%>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Database setup code is in a different file, so that index page can access it, so that it can receive tournament name info --%>  
<%@include file="database.jsp" %>

<% //Rejects pageload if request is not 'POST' or if isLoggedIn is not true
final String loginKey = "isLoggedIn";

if(!request.getMethod().equals("POST")){
	%>
	<script>alert("Either there has been an error or you have attempted to load a page you are unauthorized to access.");</script>
	<%
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", ".");
}if(session.getAttribute(loginKey) == null){
	%>
	<script id="self-destruct">
		setTimeout(function(){
			currentPage = "#login";
			swap("login");
		}, 5);

		remove();
	</script>
	<%
	throw new javax.servlet.jsp.SkipPageException();
}
%>

<% //Sets keys for naming session variables and request parameters. Useful because renaming a variable is easier than renaming a string.
final String 
initialsKey = "user", //Username = user's initials.
passKey = "pass",
allianceKey = "allianceColor",
tournamentNameKey = "tournamentName",
tournamentIDKey = "tournamentID",
matchKey = "matchNumber",
team1Key = "team1",
team2Key = "team2",
team3Key = "team3";
%>

<%
if(session.getAttribute(loginKey) == null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", ".");
}
%>

<% //Sets local variables from session variables when each page loads.
String alliance = (String)session.getAttribute(allianceKey); //Alliance color
String tournament = (String)session.getAttribute(tournamentNameKey); //Tournament name
String tournamentID = (String)session.getAttribute(tournamentIDKey); //
String match = (String)session.getAttribute(matchKey); //Match number
String initials = (String)session.getAttribute(initialsKey); //User = initials

//vvv Using Integer objects to avoid null pointer exceptions.
Integer team1 = (Integer)session.getAttribute(team1Key); //Team numbers
Integer team2 = (Integer)session.getAttribute(team2Key);
Integer team3 = (Integer)session.getAttribute(team3Key);
%>

