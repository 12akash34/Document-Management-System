<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
Statement st=con.createStatement();
String uid=(String)session.getAttribute("login_user1");
String s[]=request.getParameterValues("selec");
String app=request.getParameter("approval");
if(app.equals("approve")){
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update approval set status='approved' where approvalby='"+uid+"' and docid='"+s[i]+"'");
	}
        response.sendRedirect("Approve.jsp?msg=Approved sucessfully");
}
else{
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update approval set status='discarded' where approvalby='"+uid+"' and docid='"+s[i]+"'");
	}
           response.sendRedirect("Approve.jsp?msg=Rejected sucessfully");
}
%>

</body>
</html>