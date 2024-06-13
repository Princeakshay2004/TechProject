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

import database.UserData;
import entity.Message;
import entity.User;
import helper.ConnectionProvider;
import helper.Helper;

@WebServlet
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out =response.getWriter();
		// step 1: To get input from user
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String mobile=request.getParameter("user_mobile");
		String password=request.getParameter("user_password");
		
		
		// Step 2 :Get User from session
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("CurrentUser");
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setMobile_no(mobile);
		
	
		
		// Step 3 : create object of dao and connect it
		UserData data=new UserData(ConnectionProvider.getConnection());
		if(data.updateUser(user))
		{
			Message msg= new Message("Profile Details Updated Successfully","success","alert-success");
			session.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
		}
		else
		{
			Message msg= new Message("Profile Details not Updated !","error","alert-danger");
			session.setAttribute("msg", msg);
			
			response.sendRedirect("profile.jsp");		}
		
	}

}
