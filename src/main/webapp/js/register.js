
$(document).ready(function (){
	
	console.log("Loaded......")
	
	$('#reg-form').on('submit', function (event){
		
		event.preventDefault();
		
		
		
		let form = new FormData(this)
		
		$('#submit-btn').hide();
		$('#loader').show();
	
		$.ajax({
			
			url : "RegisterServlet",
			type : 'POST',
			data : form,
			success: function (data, textStatus, jqXHR){
				console.log(data)
				
				$('#submit-btn').show();
				$('#loader').hide();
				
				if(data.trim() === "Done"){
				swal("Registered Successfully..we are going to redirect you to login page")
				.then((value) => {
				  window.location = "login-page.jsp";
				});
			}
			else{
				swal(data)
			}
				
			},
			error : function (jqXHR, textStatus , errorThrown){
				console.log(jqXHR);	
				$('#submit-btn').show();
				$('#loader').hide();
				swal("Something went wrong..try again"+errorThrown);
			},
			processData : false,
			contentType: false,
			
		})
		
		
		
	})
	
	
})