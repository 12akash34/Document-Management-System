<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<body>
<%
    String uid="";
      if(session.getAttribute("login_user1")!=null){
          uid=session.getAttribute("login_user1").toString();
      }
      else if(session.getAttribute("login_user2")!=null){
          uid=session.getAttribute("login_user2").toString();
      }
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
Statement st=con.createStatement();
String mid[]=request.getParameterValues("mid");
String ds=request.getParameter("s");
	if(ds.equals("delete")){
		for(int i=0;i<mid.length;i++){	
			st.executeUpdate("update message set status='deleted' where mid='"+mid[i]+"'");
		}
		response.sendRedirect("inbox.jsp");
}
        else if(ds.equals("forward")){
String forwardto=request.getParameter("user");

		for(int i=0;i<mid.length;i++)
		{	
			ResultSet rs=st.executeQuery("select * from message where mid='"+mid[i]+"'");
			rs.next();
			st.executeUpdate("insert into message (sender,receiver,sub,msg) values('"+uid+"','"+forwardto+"','"+rs.getString("sub")+"','"+rs.getString("msg")+"')");	
		}
                response.sendRedirect("outbox.jsp");
        }
%>

</body>
</html>