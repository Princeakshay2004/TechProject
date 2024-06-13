<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="entity.User"%>
<%@page errorPage="error.jsp"%>
<%@page import="entity.Message"%>
<%@ page import="database.PostData"%>
<%
User user = (User) session.getAttribute("CurrentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
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
<%-- end of css --%>
</head>
<body style="background-image: url('Images/background.jpg'); background-size: cover; background-attachment: fixed;">

	<%-- navbar --%>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" style="margin-left: 20px;"
			href="HomePageServlet"> <span><i
				class="fa-brands fa-slack fa-spin"></i></span> TechProject
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span><i
							class="fa-brands fa-leanpub"></i></span> Learn With Me<span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false"><span><i
							class="fa-solid fa-layer-group"></i></span> Categories</a>
					<div class="dropdown-menu">
						<%
						PostData pd = new PostData(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = pd.getAllCategory();
						for (Category cc : list1) {
						%>
						<a class="dropdown-item" href="#"
							onclick="getPosts(<%=cc.getCid()%>)"><%=cc.getName()%></a>
						<%
						}
						%>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span><i
							class="fa-solid fa-phone"></i></span> Contact Us</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span><i
							class="fa-solid fa-circle-plus"></i></span> Post</a></li>
			</ul>
		</div>

		<div class="searchinput">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search"
				style="margin-right: 10px; width: 400px">
			<button class="btn btn-outline-light my-2 my-sm-0" type="submit"
				style="margin-right: 100px">Search</button>
		</div>

		<div class="searchinput" style="margin-right: 20px">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-model"><span><i
							class="fa-solid fa-user-circle"></i></span><%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span><i
							class="fa-solid fa-user"></i></span> Log Out</a></li>
			</ul>
		</div>
	</nav>

	<%-- end of navbar --%>
	
	
	

	

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%></div>
	<%
	session.removeAttribute("msg");
	}
	%>

	<%-- Post Upload Code --%>
	<%
	Message message = (Message) session.getAttribute("msg");
	if (message != null) {
	%>
	<div class="alert <%=message.getCssClass()%>" role="alert">
		<%=message.getContent()%></div>
	<%
	session.removeAttribute("msg");
	}
	%>


	<%-- Post Showing body --%>

	<main>
		<div class="conainter text-center" id="loader">
			<i class="fa fa-refresh fa-2x fa-spin mt-2"></i>
			<h4 class="mt-2">Loading...</h4>
		</div>
		<div class=" container-fluid" id="post-container"></div>
	</main>
	<%-- End Post Showing body --%>


	<%-- Profile Model --%>

	<!-- Modal -->
	<div class="modal fade" id="profile-model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLongTitle">TechProject</h5>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>"
							style="max-width: 130px; border-radius: 50%">
						<h5 class="modal-title" id="exampleModalLongTitle"><%=user.getName()%></h5>
						<br>
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Mobile No:</th>
										<td><%=user.getMobile_no()%></td>
									</tr>

								</tbody>
							</table>
						</div>
						<%-- profile edit --%>
						<div id="profile-edit" style="display: none">
							<h4>Please Edit Carefully</h4>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">ID :</th>
											<td><%=user.getId()%></td>

										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td><input type="text" class="form-control"
												name="user_name" value="<%=user.getName()%>"></td>
										</tr>
										<tr>
											<th scope="row">Email :</th>
											<td><input type="text" class="form-control"
												name="user_email" value="<%=user.getEmail()%>"></td>
										</tr>
										<tr>
											<th scope="row">Mobile :</th>
											<td><input type="text" class="form-control"
												name="user_mobile" value="<%=user.getMobile_no()%>"></td>
										</tr>
										<tr>
											<th scope="row">Password :</th>
											<td><input type="password" class="form-control"
												name="user_password" value="<%=user.getPassword()%>"></td>
										</tr>

									</tbody>
								</table>

								<div class="modal-footer">
									<button id="back-profile-button" type="button"
										class="btn btn-primary">Back</button>
									<button id="save-profile-button" type="submit"
										class="btn btn-primary">Save</button>
								</div>



							</form>


						</div>

					</div>
				</div>
				<div class="modal-footer" id="modal-footer">
					<button id="close-profile-button" type="button"
						class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<%-- End Profile Modal --%>

	<%-- Add post Modal --%>

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title " id="exampleModalLabel">Provide the
						post Details</h5>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid" required
								style="margin: 3px">
								<option selected disabled>---Select category---</option>
								<%
								PostData postdata = new PostData(ConnectionProvider.getConnection());
								ArrayList<Category> list = postdata.getAllCategory();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>

						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title"
								style="margin: 3px" class="form-control">
						</div>

						<div class="form-group">
							<textarea name="pContent" style="height: 150px; margin: 3px"
								class="form-control" placeholder="Enter Your Content"></textarea>
						</div>

						<div class="form-group">
							<textarea name="pCode" style="height: 150px; margin: 3px"
								class="form-control" placeholder="Enter Your Code(if any)"></textarea>
						</div>

						<div class="form-group">
							<label style="margin: 3px">Upload Your Pic :</label> <input
								name="pPic" type="file">
						</div>
						<br>
						<div class="container text-center">
							<button id="post-btn" type="submit"
								class="btn btn-outline-primary">Post</button>


						</div>




					</form>
				</div>

			</div>
		</div>
	</div>

	<%-- End of Add post Modal --%>

	





	<%-- JavaScript --%>
	
	<script src="js/myjs.js" type="text/javascript"></script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function() {
	let editStatus = false;
	$("#save-profile-button").hide()

	if (editStatus == false) {
		$("#edit-profile-button").click(function() {
			$("#profile-details").hide()
			$("#profile-edit").show()
			$("#edit-profile-button").hide()
			$("#close-profile-button").hide()
			$("#save-profile-button").show()
			$("#modal-footer").hide()
			editStatus = true;
		})

		$("#back-profile-button").click(function() {
			editStatus = false;
			$("#profile-details").show()
			$("#profile-edit").hide()
			$("#edit-profile-button").show()
			$("#close-profile-button").show()
			$("#save-profile-button").hide()
			$("#modal-footer").show()

		})

	}
});
</script>

	<%-- Add-Post-Js --%>
	<script type="text/javascript">
$(document).ready(function() {
	$("#add-post-form").on("submit",function(event) {
	// This code called when you submit post
			event.preventDefault();
		console.log("submit click")
		let form = new FormData(this);
		// now requesting to server
		$.ajax({
				url : "AddPostServlet",
				type : 'POST',
				data : form,
				success : function(data,textStatus,jqHXR) 
				{
					// success
					console.log(data);
					if (data.trim() == 'done') 
					{
					swal("Good Job!","Post Uploaded Successfully","success");
					} 
					else
					{
						swal("Error!","Post not Uploaded","error");
					}
				},
				error : function(jqXHR,textStatus,errorThrown)
				{
					// error
					swal("Error!","Post not Uploaded","error");
				},
				processData : false,
				contentType : false
		})
	})
})
</script>

	<%-- Loading Post using ajax --%>
	<script type="text/javascript">
	
	function getPosts(catId){
		$.ajax({
			url:"LoadPosts.jsp",
			data:{cid:catId},
			success: function(data,textStatus,jqHXR)
			{
				$("#loader").hide();
				$("#post-container").html(data);
			}
			
		})
	}


$(document).ready(function (e){
	getPosts(0)	
})
</script>


</body>
</html>