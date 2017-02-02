function initLogin(){
	$("#login-form").on("submit", function(event) {
		   event.preventDefault();//Stops refresh
		   var user = $(this).find('[name=username]').val();
		   var pass = $(this).find('[name=password]').val();
		   $.post("login.jsp",
			{
				user: user,
				pass: pass
			},
			
			function(data, status, xhr) {
				//Sets the content div's contents to whatever the jsp page has on it.
				//$("#content").html(data); 
				if(status == "success"){
					$("#content").append(data.trim());
				}else if(status == "error"){
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
			
	}); 
}

