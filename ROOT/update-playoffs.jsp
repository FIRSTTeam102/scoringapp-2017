<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://198.100.45.55/Scoring2017?useOldAliasMetadataBehavior=true" user="gearheads"
	password="Gearhe3ads4prezdent"/>
	
<sql:update dataSource="${database}" >



</sql:update>