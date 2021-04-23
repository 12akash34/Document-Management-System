<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>

<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/docSpace","root","");

 String user,uid,pwd;
        user=request.getParameter("user");
        uid=request.getParameter("uname");
        pwd=request.getParameter("pwd");
        PreparedStatement pst;
        ResultSet rs;
        if(user.equals("student")){
        pst=con.prepareStatement("select s_id, password from student where s_id=? and password=?");
        pst.setString(1,uid);
        pst.setString(2,pwd);
        rs=pst.executeQuery();
        if(rs.next()){
            session.setAttribute("login_user2",uid);
        response.sendRedirect("home.jsp");
        }
        else
        {
        response.sendRedirect("index.jsp?msg=Invalid Login Details");
        }
        }
        
        else if(user.equals("faculty")){
            pst=con.prepareStatement("select f_id, password from faculty where f_id=? and password=?");
        pst.setString(1,uid);
        pst.setString(2,pwd);
        rs=pst.executeQuery();
        if(rs.next()){
            
            session.setAttribute("login_user1",uid);
        response.sendRedirect("home.jsp");
        }
        else
        {
        response.sendRedirect("index.jsp?msg=Invalid Login Details");
        }
        }
%>

</body>
</html>