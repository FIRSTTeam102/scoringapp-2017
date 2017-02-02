$(function(){
	$("#login-form").on("submit", function(event) {
		   event.preventDefault();//Stops refresh
		   var user = $(this).find('[name=username]').val();
		   var pass = $(this).find('[name=password]').val();
		   $.post("login.jsp",
			{
				user: user,
				pass: pass
			},
			
			function(data, status) {
				//Sets the content div's contents to whatever the jsp page has on it.
				$("#content").html(data); 
			});
			
		}); 
	
});

