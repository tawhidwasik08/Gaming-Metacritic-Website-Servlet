package gmw;

import java.util.ArrayList; 
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

import com.sun.org.apache.xml.internal.serializer.utils.StringToIntTable;

/**
 * Servlet implementation class DetailsServlet
 */
//@WebServlet("/DetailsServlet")
public class DetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at : ").append(request.getContextPath());

		String game_id = request.getParameter("game_id");
		
		request.setAttribute("game_id",game_id);
		
		HttpSession session = request.getSession();
        
       
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/meta", "root", "");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select name,image,sreq,summary,trailer,genre from game_info where game_id=" + game_id);						
			// String str="<table><tr><th>Image</th><th>Name</th><th>Genre</th></tr>";
			String str_name="",str_img="",str_req="",str_sum="",str_trailer="";
			
			if (rs.next()) {

				// String page="http://localhost:8001/GMW/details?game_id="+rs.getString(1);
				// str+= "<img src="+rs.getString("image")+" height="+100+" width="+100+">";
				str_name = rs.getString("name");
				str_img = rs.getString("image");
				str_req = rs.getString("sreq");
				str_sum = rs.getString("summary");
				str_trailer=rs.getString("trailer");

			}
			
			request.setAttribute("name", str_name);
			request.setAttribute("image", str_img);
			request.setAttribute("req", str_req);
			request.setAttribute("sum", str_sum);
			request.setAttribute("trlr", str_trailer);
			
			Statement stmt3 = con.createStatement();
			ResultSet rs3 = stmt3.executeQuery("select * from game_critic_review where game_id=" + game_id);
			
			ArrayList<String> c_name_list = new ArrayList<String>();
			ArrayList<String> c_review_sum_list = new ArrayList<String>();
			ArrayList<String> c_score_list = new ArrayList<String>();
			ArrayList<String> c_link_list = new ArrayList<String>();
			
			while (rs3.next()) {
					
				c_name_list.add(rs3.getString("critic_name"));
				c_review_sum_list.add(rs3.getString("review_sum"));
				c_score_list.add(rs3.getString("score"));
				c_link_list.add(rs3.getString("link"));			
			}
			
			for (int i=0;i<c_name_list.size();i++) {
				System.out.println(c_name_list.get(i));
			}
			
			
			request.setAttribute("c_name_list", c_name_list);
			request.setAttribute("c_review_sum_list", c_review_sum_list);
			request.setAttribute("c_score_list", c_score_list);
			request.setAttribute("c_link_list", c_link_list);
			
			Statement stmt4 = con.createStatement();
			ResultSet rs4 = stmt4.executeQuery("SELECT user.username,game_user_review.review,game_user_review.score FROM game_user_review INNER JOIN user on game_user_review.user_id=user.user_id WHERE game_user_review.game_id=" + game_id);
			
			ArrayList<String> u_name_list = new ArrayList<String>();
			ArrayList<String> u_review_list = new ArrayList<String>();
			ArrayList<String> u_score_list = new ArrayList<String>();
			ArrayList<String> u_like_list = new ArrayList<String>();
			
			while (rs4.next()) {
					
				u_name_list.add(rs4.getString("username"));
				u_review_list.add(rs4.getString("review"));
				u_score_list.add(rs4.getString("score"));
				//u_like_list.add(rs4.getString("likes"));			
			}
			
			for (int i=0;i<c_name_list.size();i++) {
				System.out.println(c_name_list.get(i));
			}
			
			Statement stmt6 = con.createStatement();
			ResultSet rs6 = stmt6.executeQuery("select AVG(score) FROM game_critic_review where game_id=" + game_id);
			
			String avg_c_scr="0";
			if(rs6.next()) {
				avg_c_scr=rs6.getString(1);
			}
			
			request.setAttribute("avg", avg_c_scr);
			
			request.setAttribute("u_name_list", u_name_list);
			request.setAttribute("u_review_list", u_review_list);
			request.setAttribute("u_score_list", u_score_list);
			//request.setAttribute("u_like_list", u_like_list);
			
			
			
			
			
			
		

			if(session.getAttribute("user_id")!=null) {
				int user_id=(int)session.getAttribute("user_id");
				Statement stmt2 = con.createStatement();
				ResultSet rs_user_has_review = stmt2.executeQuery("select review_id from game_user_review where user_id=" + user_id+" and game_id="+game_id);
				if (rs_user_has_review.next()) {

					session.setAttribute("user_reviewed", 1);

				}
				else {
					session.setAttribute("user_reviewed", 0);
				}
				
				
			}
			
			
			

			
			request.getRequestDispatcher("details.jsp").forward(request, response);
	       //response.sendRedirect("http://localhost:8001/GMW/details.jsp?image=" + str);
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
