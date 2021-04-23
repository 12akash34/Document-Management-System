<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
	String s[]=request.getParameterValues("docs");
	if(s!=null)
		for(int i=0;i<s.length;i++)
		{	
			st.executeUpdate("update documentload set status='deleted' where docid='"+s[i]+"'");
			
		}
	response.sendRedirect("documents.jsp");
%>

</body>
</html>