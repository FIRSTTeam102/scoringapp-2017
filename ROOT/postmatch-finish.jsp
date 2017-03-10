<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<%
	boolean t1Climbed = Boolean.parseBoolean(request.getParameter("t1Climb"));
	boolean t2Climbed = Boolean.parseBoolean(request.getParameter("t2Climb"));
	boolean t3Climbed = Boolean.parseBoolean(request.getParameter("t3Climb"));
	
	int rotorCount;
	int foulCount;
	int foulPoints;
	int points;
	int pressure;
	
	if(request.getParameter("rotNum") == null){
		rotorCount = 0;
	}else{
		rotorCount = Integer.parseInt(request.getParameter("rotNum"));
	}
	if(request.getParameter("numFouls") == null){
		foulCount = 0;
	}else{
		foulCount = Integer.parseInt(request.getParameter("numFouls"));
	}
	if(request.getParameter("numFoulPoints") == null){
		foulPoints = 0;
	}else{
		foulPoints = Integer.parseInt(request.getParameter("numFoulPoints"));
	}
	/*if(request.getParameter("pts") == null){
		points = 0;
	}else{
		points = Integer.parseInt(request.getParameter("points"));
	}	*/
	
	try {
		points = Integer.parseInt(request.getParameter("pts"));
	}
	catch (NumberFormatException l) {
		points = 0;
	}
	
	try {
		pressure = Integer.parseInt(request.getParameter("pressure"));
	}
	catch (NumberFormatException l) {
		pressure = 0;
	}
	
%>
<script id="self-destruct">
swap("choosematch",true);
remove();
</script>
	<!--  	ADD COMPLETED FOR THE MATCH!!!!!!!! -->