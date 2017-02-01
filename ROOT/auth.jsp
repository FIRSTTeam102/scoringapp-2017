<%-- This page is to initialize all required SQL database access, and to pull any session variables created in previous pages. --%>
<%-- All of the code is run each time a page is loaded. --%>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
           
<%-- SQL business for later.         
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://Gearheads-5/scoring2016?useOldAliasMetadataBehavior=true" user="scoring102"
	password="${SQLPassword }"/>
--%>  