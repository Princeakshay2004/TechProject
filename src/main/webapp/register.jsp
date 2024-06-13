<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="icon" type="image/x-icon" href="Images/fav-icon.png">


<%-- css --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="css/mystyle.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
.banner-background {
	clip-path: polygon(50% 0%, 74% 0, 100% 0, 100% 100%, 84% 91%, 61% 91%, 33% 100%, 0
		93%, 0 0, 20% 0);
}
</style>
</head>

<body>

	<%-- navbar --%>
	<%@include file="navbar.jsp"%>

	<main class="primary-background banner-background"
		style="padding-bottom: 70px">
		<div class="container">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-3x fa-user-plus"></span>
						<p>Register Here</p>
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter Name">
							</div>

							<div class="form-group">
								<label for="mobile_no">Mobile No</label> <input
									name="user_mobile" type="number" class="form-control"
									id="mobile_no" aria-describedby="emailHelp"
									placeholder="Enter Mobile No">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								<label for="gender">Gender</label> <input type="radio"
									id="gender" name="gender" value="male">Male <input
									type="radio" id="gender" name="gender" value="female">Female
								<br>
							</div>
							<br>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions</label>
							</div>

							<div class="container text-center" id="loader"
								style="display: none;">
								<span><i class="fa-solid fa-arrows-rotate fa-spin fa-2x"></i></span>
								<h3>Please wait..</h3>
							</div>


							<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
						</form>
					</div>

				</div>

			</div>


		</div>


	</main>



	<%-- Javascript --%>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
$(document).ready(function()
		{
		console.log("loaded...")
	
		
		$('#reg-form').on('submit',function(event){
			event.preventDefault();
			
			let form=new FormData(this);
			$("#submit-btn").hide();
			$("#loader").show();
			
			
			
			// send to register servlet
			$.ajax({
				url:"RegisterServlet",
				type:"post",
				data:form,
				success: function(data,textStatus,jqXHR)
				{
					console.log(data)
					$("#submit-btn").show();
					$("#loader").hide();
					
					if(data.trim()==='done')
					{
					swal("Good job!", "You clicked the button!", "success")
						.then((value)=>{
							window.location="login.jsp"
						});
						}
					else
						{
						swal(data);
						}

					
				},
				error: function(data,textStatus,errorThrown)
				{
					swal("Somthing went wrong!");
					
				},
				processData:false,
				contentType:false

			});
		});
		
		});
</script>

</body>
</html>