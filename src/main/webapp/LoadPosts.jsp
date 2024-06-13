<%@page import="database.PostData" %>
<%@page import="helper.ConnectionProvider"%>
<%@page import="entity.Post" %>
<%@page import="entity.User" %>
<%@page import="database.LikeData" %>
<%@page import="java.util.List" %>

<%-- css --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="css/mystyle.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<%-- end of css --%>
<style>
	pre::-webkit-scrollbar{
	display:none;
	}
	
</style>
<div class="row ">
<%
	Thread.sleep(700);
	User user = (User) session.getAttribute("CurrentUser");
	PostData pd=new PostData(ConnectionProvider.getConnection());
	int cid=Integer.parseInt(request.getParameter("cid"));
	List<Post>list=null;
	if(cid==0){
	list=pd.getAllPost();
	}
	else{
		list=pd.getPostByCatId(cid);
	}
	if(list.size()==0){
		out.println("<h4 class='display-3 text-center'>No Posts in this Category</h4>");
	}
	for(Post p:list)
	{
%>
			
  <div class="card m-2" style="width: 18rem; background-color: #CDE8E5">
  <div  class="card-img"  style="height: 13rem; margin-top:0.7rem;background-size: cover;  background-image: url('blog_pic/<%=p.getpPic()%>'); ">
  </div>		  
  <div class="card-body">
	<b class="card-title"><%=p.getpTitle() %></b>
	<hr>
	<p  class="card-text"><%=p.getpContent() %></p>
  </div>
  <div style="border-style:outset;border-color:#BED7DC" >
  <pre style="height: 4rem;" ><%=p.getpCode() %></pre>
 </div>
  <div class="card-footer">
  <%
  LikeData likedata=new LikeData(ConnectionProvider.getConnection()); 
  %>
    <a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More..</a>
	<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-up"></i> <span class="like-counter"><%=likedata.PostLikeCount(p.getPid()) %></span></a>
	<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-comment"></i><span>10</span></a>					
  </div>
</div>

<% 
}

%>
</div>



