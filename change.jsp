<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
	
	String pwd=request.getParameter("opwd");
	String npwd=request.getParameter("npwd"); 
	String uid="";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
        ResultSet rs;
        if(session.getAttribute("login_user2")!=null){
            uid=(String)session.getAttribute("login_user2");
	rs=st.executeQuery("select password from student where s_id='"+uid+"'");
	if(rs.next()){
		if(rs.getString("password").equals(pwd)){
			st.executeUpdate("update student set password='"+npwd+"' where s_id='"+uid+"'");
                       
                    response.sendRedirect("changepwd.jsp?msg=Password changed successfully");
		}
                else
                    response.sendRedirect("changepwd.jsp?msg=Current password is invalid");
	}
        }
        else if(session.getAttribute("login_user1")!=null){
            uid=(String)session.getAttribute("login_user1");
            rs=st.executeQuery("select password from faculty where f_id='"+uid+"'");
	if(rs.next()){
		if(rs.getString("password").equals(pwd)){
			st.executeUpdate("update faculty set password='"+npwd+"' where f_id='"+uid+"'");
		 response.sendRedirect("changepwd.jsp?msg=Password changed successfully");
                }
                else
                    response.sendRedirect("changepwd.jsp?msg=Current password is invalid");
	}
        }
%> 
	