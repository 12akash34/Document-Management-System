<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>  
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/docSpace","root","");
        Statement st=con.createStatement();
        String user=request.getParameter("user");
	String fn=request.getParameter("fn");
	String ln=request.getParameter("ln");
	String uid=request.getParameter("uid");
	String pwd=request.getParameter("pwd");
	String eid=request.getParameter("eid");
	String city=request.getParameter("city");
	String phone=request.getParameter("phone");
	String branch=request.getParameter("branch");
        if(user.equals("student")){
	st.executeUpdate("insert into student values('"+fn+"','"+ln+"','"+uid+"','"+pwd+"','"+eid+"','"+branch+"','"+city+"','"+phone+"','enabled');");
        response.sendRedirect("reg.jsp?msg=Registration Success");
        }
        else if(user.equals("faculty")){
        st.executeUpdate("insert into faculty values('"+fn+"','"+ln+"','"+uid+"','"+pwd+"','"+eid+"','"+branch+"','"+city+"','"+phone+"','enabled');");
        response.sendRedirect("reg.jsp?msg=Registration Success");
        }
	%>
	
	</body>
</html>