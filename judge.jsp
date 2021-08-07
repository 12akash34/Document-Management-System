<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
String uid=(String)session.getAttribute("login_user1");
String s[]=request.getParameterValues("selec");
String app=request.getParameter("approval");
if(app.equals("approve")){
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update approval set status='approved' where approvalby='"+uid+"' and docid='"+s[i]+"'");
                ResultSet rs=st1.executeQuery("select approval.author,docname from approval,documentload where approval.docid=documentload.docid and approval.docid='"+s[i]+"'");
                rs.next();
                st2.executeUpdate("insert into message (docid,sender,receiver,sub,msg) values('"+s[i]+"','"+uid+"','"+rs.getString("author")+"','Approved','Your document titled \\'"+rs.getString("docname")+"\\' is approved')");
	}
        response.sendRedirect("Approve.jsp?msg=Approved sucessfully");
}
else{
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update approval set status='discarded' where approvalby='"+uid+"' and docid='"+s[i]+"'");
	        ResultSet rs1=st1.executeQuery("select approval.author,docname from approval,documentload where approval.docid=documentload.docid and approval.docid='"+s[i]+"'");
                rs1.next();
                st2.executeUpdate("insert into message (docid,sender,receiver,sub,msg) values('"+s[i]+"','"+uid+"','"+rs1.getString("author")+"','Unapproved','Your document titled \\'"+rs1.getString("docname")+"\\' is unapproved')");
        }
           response.sendRedirect("Approve.jsp?msg=Rejected sucessfully");
}
%>

</body>
</html>