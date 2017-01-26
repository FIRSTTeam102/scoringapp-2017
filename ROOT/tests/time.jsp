<html>
<head>
<title>server</title>
</head>
<body>
<h1>OOOH! Tomcat!</h1>
<button id="button" onclick="checkTime();">Check Time</button>
<p id="logger"></p>
<script>
	logger = document.getElementById("logger");
	
	function checkTime(){
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		  if (this.readyState == 4 && this.status == 200) {
		    logger.innerHTML += this.responseText + "</br>";
		  }
		};
		xhttp.open("GET", "sendTime.jsp", true);
		xhttp.send();
	}
</script>
</body>
