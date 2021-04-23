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
 <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st2=con.createStatement();
	String appBy=request.getParameter("approvalby");
	if(appBy!=null){
		int slength=(Integer)session.getAttribute("slength");
		int vlength=(Integer)session.getAttribute("vlength");
		try{
			for(int i=0;i<slength;i++)
			{	String s=(String)session.getAttribute("s"+i);
				st2.executeUpdate("insert into approval values('documentload','"+s+"','"+uid+"','"+appBy+"','yetto')");	
			}
			for(int i=0;i<vlength;i++)
			{	String s=(String)session.getAttribute("v"+i);
				st2.executeUpdate("insert into approval values('documentshared','"+s+"','"+uid+"','"+appBy+"','yetto')");
			}
%>
		<jsp:forward page="DocumentView.jsp"></jsp:forward>
<%
		}
		catch(Exception e){
	%>
			<h3 style="color: red">document(s) is not send for approval. try agin</h3>
	<% 	
		}
	}
	%>
  <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>