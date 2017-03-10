<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="auth.jsp"%>
<%
	boolean t1Climbed = Boolean.parseBoolean(request.getParameter("t1Climb"));
	boolean t2Climbed = Boolean.parseBoolean(request.getParameter("t2Climb"));
	boolean t3Climbed = Boolean.parseBoolean(request.getParameter("t3Climb"));
	
	if(request.getParameter("rotNum") == null){
		int rotorCount = 0;
	}else{
		int rotorCount = Integer.parseInt(request.getParameter("rotNum"));
	}
	if(request.getParameter("numFouls") == null){
		int rotorCount = 0;
	}else{
		int rotorCount = Integer.parseInt(request.getParameter("rotNum"));
	}
	
	
	int foulCount = Integer.parseInt(request.getParameter("numFouls"));
	int foulPoints = Integer.parseInt(request.getParameter("numFoulPoints"));
	int points = Integer.parseInt(request.getParameter("pts"));
	int pressure = Integer.parseInt(request.getParameter("pressure"));
%>

	<!--  	ADD COMPLETED FOR THE MATCH!!!!!!!! -->