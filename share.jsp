<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<body>
<%@ include file="header.jsp" %>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
Statement st=con.createStatement();	
String s[]=request.getParameterValues("mine");
String sharedto=request.getParameter("shareto");
	
		for(int i=0;i<s.length;i++)
		{
			ResultSet rs=st.executeQuery("select * from documentload where docid='"+s[i]+"'");
			rs.next();
			
			st.executeUpdate("insert into documentshared (`docid`, `sharedto`, `sharedby`) values('"+s[i]+"','"+sharedto +"','"+uid+"')");	
		}
 
%>
<%@include file="footer.jsp" %>	
</body>
</html>