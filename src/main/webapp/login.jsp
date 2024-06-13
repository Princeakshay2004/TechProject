<%@page import="helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="entity.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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


	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 80vh">
		<div class="container" style="width: 150vh">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div
							class="card-header primary-background text-white text-center ">
							<span class="fa-solid fa-user fa-3x"></span> <br>
							<p>Login Here</p>
						</div>

						<%
						Message m=(Message)session.getAttribute("msg");
						if(m!=null)
						{
							
						
						%>
						<div class="alert <%= m.getCssClass() %>" role="alert">
						<%= m.getContent() %></div>
						<% 	
							session.removeAttribute("msg");
						}
						
						%>
						

						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">User name</label> <input
										type="email" name="u_email" required class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email ">
									
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										 name="u_password" type="password" required class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<br>
								<div class="container text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

	<%-- Javascript --%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>
</html>