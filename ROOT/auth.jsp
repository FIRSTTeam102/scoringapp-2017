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
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", ".");
}
%>

<%
String 
userKey = "user",
passKey = "pass",
allianceKey = "allianceColor";
%>

<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://198.100.45.55/Scoring2017" user="gearheads"
	password="Gearhe3ads4prezdent"/>
