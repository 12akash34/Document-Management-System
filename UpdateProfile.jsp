<%@ page contentType="text/html" pageEncoding="UTF-8"   import="java.sql.*" %>
<html>
<body>
<%@ include file="header.jsp" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();

	String fn=request.getParameter("fn");
	String ln=request.getParameter("ln");
	String eid=request.getParameter("eid");
	String city=request.getParameter("city");
	String phone=request.getParameter("phone");
	if(session.getAttribute("login_user1")!=null){
        st.executeUpdate("update faculty set f_name='"+fn+"',l_name='"+ln+"',email='"+eid+"',city='"+city+"',mobile='"+phone+"' where f_id='"+uid+"'");
        }
        else if(session.getAttribute("login_user2")!=null){
	st.executeUpdate("update student set f_name='"+fn+"',l_name='"+ln+"',email='"+eid+"',city='"+city+"',mobile='"+phone+"' where s_id='"+uid+"'");
        }
        response.sendRedirect("profile.jsp");
%>
</body>
</html>