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

/**
 * Servlet implementation class ShowGames
 */
//@WebServlet("/ShowGames")
public class ShowGamesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowGamesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
		      Class.forName("com.mysql.jdbc.Driver");
		      Connection con = DriverManager.getConnection("jdbc:mysql://localhost/meta","root","");
		      Statement stmt = con.createStatement();
		      ResultSet rs = stmt.executeQuery("select game_id,image,name,genre from game_info");
		      //String str="<table><tr><th>Image</th><th>Name</th><th>Genre</th></tr>";
		      String str="";
		      
		      while(rs.next()) {
		    	  
		    	  String page="http://localhost:8001/GMW/details?game_id="+rs.getString(1);
		    	  str+= "<tr><td><img src="+rs.getString(2)+" height="+100+" width="+100+"></td><td><a href="+page+">"+
		        		rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>";
		        
		        
		      }
		      
		      //str+="</table>";
		      //out.println(str);
		      response.sendRedirect("http://localhost:8001/GMW/showgames.jsp?table_data="+str);
		      con.close();
		      
		      
		    } catch (ClassNotFoundException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    } catch (SQLException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    } 

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
