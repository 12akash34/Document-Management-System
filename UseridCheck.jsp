<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
	String uid=request.getParameter("uid");
	ResultSet rs=st.executeQuery("select s_id from student");
	int i=2;
	while(rs.next())
	{	String s=rs.getString("s_id");
		if(s.equalsIgnoreCase(uid)){
			i=1;
			break;
		}
			
		else i=0;
		
	}
	if(i==1) out.println("false");
	else  out.println("true");
%>		

