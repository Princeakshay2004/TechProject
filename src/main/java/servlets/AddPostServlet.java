package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import database.PostData;
import entity.Post;
import entity.User;
import helper.ConnectionProvider;
import helper.Helper;

@MultipartConfig
@WebServlet
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPostServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pPic");
		// Getting currnet user id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("CurrentUser");
		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());

		PostData postdata = new PostData(ConnectionProvider.getConnection());
		if (postdata.savePost(p)) {	
			
			String path =request.getServletContext().getRealPath("/blog_pic")+ File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			
			
			out.print("done");
		} else {
			out.print("error");


		}

	}

}
