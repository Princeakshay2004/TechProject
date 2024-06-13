package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import database.UserData;
import entity.Message;
import entity.User;
import helper.ConnectionProvider;

@WebServlet
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		String useremail=request.getParameter("u_email");
		String userpassword=request.getParameter("u_password");
		
		UserData userdata=new UserData(ConnectionProvider.getConnection());
		
		User user=userdata.getUserByEmailAndPassword(useremail, userpassword);
		
		if(user == null)
		{
			// in case of wrong information
			
			Message msg= new Message("Invalid Details ! try with another","error","alert-danger");
			HttpSession session=request.getSession();
			session.setAttribute("msg", msg);			
			response.sendRedirect("login.jsp");
		
		}
		else {
			HttpSession session=request.getSession();
			session.setAttribute("CurrentUser", user);			
			response.sendRedirect("profile.jsp");			
		}
		
	
	}

}
