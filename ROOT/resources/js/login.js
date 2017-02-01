$(function(){
	$("#login-form").on("submit", function(event) {
		   event.preventDefault();//hopefully stops reload
		   var usr = $(this).find('[name=username]').val();
		   var pass = $(this).find('[name=password]').val();
		   $.post("auth.jsp",
			{
				aUsr: usr,
				aPass: pass
			},
			
			function(data, status) {
				//Sets the content div's contents to whatever the jsp page has on it.
				$("#content").html(data); 
			});
			
		   
		   
		}); 
	
});

