package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import database.LikeData;
import helper.ConnectionProvider;

@WebServlet
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				PrintWriter out=response.getWriter();
		
		String operation=request.getParameter("operation");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));

		LikeData likedata=new LikeData(ConnectionProvider.getConnection());
		if(operation.equals("like"))
		{
			boolean f=likedata.insertLike(pid, uid);
			out.print(f);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

	}

}
