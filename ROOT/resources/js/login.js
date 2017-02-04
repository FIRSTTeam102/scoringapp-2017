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
				//$("#content").html(data)
				if(status == "success"){
					//Script to handle login is located on login.jsp.
					$("#content").append(data.trim());
					setTimeout(function(){
						if(loggedOn != true){
							console.error("Login unsuccessful");
						}
					}, 1);

				}else if(status == "error"){
					alert("An error occurred.");
					error("Error:" + xhr.status);
				}
			});
			
	}); 
}

