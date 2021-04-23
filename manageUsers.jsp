<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
	String uid=(String)session.getAttribute("login_user2");
	String s[]=request.getParameterValues("users");
	if(s!=null)
		for(int i=0;i<s.length;i++)
		{	
			st.executeUpdate("update student set status='deleted' where s_id='"+s[i]+"'");
			
		}
	response.sendRedirect("users.jsp");
%>

</body>
</html>