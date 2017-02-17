<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="auth.jsp"%>
<%
	
	String[] t1AutInf = new String[7];
	String[] t2AutInf = new String[7]; 
	String[] t3AutInf = new String[7]; //will hold all relavant autonomous info foreach team
	
	/* ARRAY INDICIES AND WHAT THEY CORRESPOND TO:
	0: NoShowed
	1. Crossed Baseline
	2: Attempted Gear
	3: Robot Gear S/F
	4: Human Gear S/F
	5: Attempted Shot
	6: Shot S/F 
	*/
	
	t1AutInf[0] = request.getParameter("t1Showed");
	t1AutInf[1] = request.getParameter("t1XBaseline");
	t1AutInf[2] = request.getParameter("t1AttemptedGear");
	t1AutInf[3] = request.getParameter("t1RoboGearSucc");
	t1AutInf[4] = request.getParameter("t1HuGearSucc");
	t1AutInf[5] = request.getParameter("t1AttemptedShot");
	t1AutInf[6] = request.getParameter("t1ShotSucc");
	
	t2AutInf[0] = request.getParameter("t2Showed");
	t2AutInf[1] = request.getParameter("t2XBaseline");
	t2AutInf[2] = request.getParameter("t2AttemptedGear");
	t2AutInf[3] = request.getParameter("t2RoboGearSucc");
	t2AutInf[4] = request.getParameter("t2HuGearSucc");
	t2AutInf[5] = request.getParameter("t2AttemptedShot");
	t2AutInf[6] = request.getParameter("t2ShotSucc");
	
	t3AutInf[0] = request.getParameter("t3Showed");
	t3AutInf[1] = request.getParameter("t3XBaseline");
	t3AutInf[2] = request.getParameter("t3AttemptedGear");
	t3AutInf[3] = request.getParameter("t3RoboGearSucc");
	t3AutInf[4] = request.getParameter("t3HuGearSucc");
	t3AutInf[5] = request.getParameter("t3AttemptedShot");
	t3AutInf[6] = request.getParameter("t3ShotSucc");
	
	/*
		MySQL Calls
	*/
%>	
<script id="self-destruct">
			setTimeout( function() {swap("teleop",false);}, 3);
			remove();
		</script>	
	
