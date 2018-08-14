package KayitSistemi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet extends HttpServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("servlete gide id:"+request.getParameter("id"));
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();

		 System.out.println("Before Login" );
         System.out.println("IsUserInRole?.." 
                     + request.isUserInRole("manager"));
         System.out.println("getRemoteUser?.." + request.getRemoteUser());
         System.out.println("getUserPrincipal?.." +request.getUserPrincipal().toString()+"  "
                     + request.getUserPrincipal().equals("dude"));
         System.out.println("getAuthType?.." + request.getAuthType()+"<br><br>");
         
         if(request.isUserInRole("manager")){
        	 System.out.println(request.getParameter("action"));
        	if(request.getParameter("action")!=null){
        		if(request.getParameter("action").equals("Update")){
              		request.setAttribute("TC",request.getParameter("id"));
                	 RequestDispatcher yon=request.getRequestDispatcher("Guncelleme.jsp");
         			yon.forward(request,response); 
              	}
        	}else{
        	request.setAttribute("TC",request.getRemoteUser());
        	RequestDispatcher yon=request.getRequestDispatcher("KisiGoruntule.jsp");
  			yon.forward(request,response);
        	}
        	
        	
          	
         }
         else{
        	 request.setAttribute("TC",request.getRemoteUser());
        	 RequestDispatcher yon=request.getRequestDispatcher("Guncelleme.jsp");
 			yon.forward(request,response); 
         }
			

		
	}
}
