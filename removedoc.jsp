<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DocSpace-manage documents</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="icons/font/bootstrap-icons.css">
    <script type="text/javascript">
	function ds(){
		sr=document.forms[0].srch.value;
		if(sr=="")		
			return false;
			return true;
	}
</script>
</head>
<body>
 <%@ include file="header.jsp" %>
 <div class="container-fluid">
     <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
	String s[]=request.getParameterValues("mine");
	String v[]=request.getParameterValues("share");
	String ds=request.getParameter("s");
	if(ds.equals("delete")){
		for(int i=0;i<s.length;i++)
		{	
			st.executeUpdate("delete from approval where docid='"+s[i]+"' and s_id='"+uid+"' ans status!='approved'");
			st.executeUpdate("update documentload set status='deleted' where docid='"+s[i]+"'");
			
		}
        response.sendRedirect("DocumentView.jsp");
	}
	else if(ds.equals("share")){
%>		<form action="share.jsp">
		<h3 align="center">share to:<input type="text" name="share">
			<input type="submit" value="share"></h3>
		</form>
<%
	if(s!=null){
		session.setAttribute("slength",s.length);
		session.setAttribute("vlength",0);
		for(int i=0;i<s.length;i++){
			session.setAttribute("s"+i,s[i]);
		}
	}
	else{	session.setAttribute("slength",0);
			session.setAttribute("vlength",v.length);
			for(int i=0;i<v.length;i++){
				session.setAttribute("v"+i,v[i]);
			}
	}
} 
else{ 
%>
		<form action="approval.jsp">
	<h3 align="center">approval by:<input type="text" name="approvalby">
	<input type="submit" name="send for approval"></h3>
	</form>
<%if(s!=null){
			session.setAttribute("slength",s.length);
			session.setAttribute("vlength",0);
			for(int i=0;i<s.length;i++){
				session.setAttribute("s"+i,s[i]);
			}
			
		}
		else{
			session.setAttribute("slength",0);
			session.setAttribute("vlength",v.length);
			for(int i=0;i<v.length;i++){
				session.setAttribute("v"+i,v[i]);
			}
		}
}
%>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>