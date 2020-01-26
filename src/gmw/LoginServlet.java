package gmw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
//@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		
		
		 try {
		      Class.forName("com.mysql.jdbc.Driver");
		      Connection con = DriverManager.getConnection("jdbc:mysql://localhost/meta","root","");
		      Statement stmt = con.createStatement();
		      ResultSet rs = stmt.executeQuery("select user_id,username,password from user where username='"+name+"' and password='"+pass+"'");
		     
		      if(rs.next()) {
		        response.sendRedirect("http://localhost:8001/GMW/welcome.jsp?name="+rs.getString("username"));
		        int user_id=Integer.parseInt(rs.getString("user_id"));
		        String un=rs.getString("username");
		        HttpSession session = request.getSession();
		        session.setAttribute("user_id",user_id );
		        session.setAttribute("user_name",un );
		        
		        
		      }else {
		    	  out.println("<script type=\"text/javascript\">");
		    	  out.println("alert('Invalid Username or Password');");
		    	  out.println("</script>");
		          response.sendRedirect("welcome.jsp");  
		      }
		      
		      
		      
		    } catch (ClassNotFoundException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    } catch (SQLException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    } 

		}
}
