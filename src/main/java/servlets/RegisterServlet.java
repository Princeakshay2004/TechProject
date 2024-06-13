package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import database.UserData;
import entity.User;
import helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");

		if (check == null) {
			out.println("please check terms and condition");
		} else {
			// Step 1: To get input values
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String mobile = request.getParameter("user_mobile");

			// Step 2 :create user object and set all data in it.
			User user = new User(name, email, mobile, password, gender);
	
			// create object of userData(DAO) and connect it
			UserData data = new UserData(ConnectionProvider.getConnection());

			if (data.saverUser(user)) {
				out.print("done");
				
				
				
			} else {
				out.print("error in user data");
			}
		}

	}

}
