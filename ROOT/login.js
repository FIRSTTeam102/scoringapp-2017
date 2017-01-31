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
				//maybe change this to set a div's contents to the return... or something
				$("#login-pane").html(data); //let's make a jquery page that returns either "logged in." or "not logged in."
			});
			
		});
});

