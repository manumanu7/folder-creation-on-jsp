<%@ page import="java.sql.*" %>

		<%
		String eid=request.getParameter("User");
		
		try
		{
			Connection con= null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","surya123");
			String qry ="select username from register where username=?";
			PreparedStatement pstmt = con.prepareStatement(qry);
			pstmt.setString(1,eid);
			
			ResultSet rs= pstmt.executeQuery();
			while(rs.next())
			{
						if(eid.equals(rs.getString(1))){
							response.sendRedirect("loggedin.html");
						}
                         
						 
			}
		
			out.print("You are not a valid user please register......");
		}
		catch(Exception e)
		{
		out.print(e);
		e.printStackTrace();
		}
		%>