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
String str=request.getParameter("start");
String end=request.getParameter("end");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
Statement st2=con.createStatement();	
ResultSet rs=st2.executeQuery("select * from documentload where createdon  between '"+str+"' and '"+end+"' and status!='deleted'");
%>
	<table class="table table-striped table-bordered table-hover table-warning" align="center" border="2">
		<thead class="bg-success">
            <tr>
			<th>documentid</th>
			<th>document name</th>
			<th>author</th>
			<th>size</th>
		</tr>
                </thead>
<%
while(rs.next()){
%>
		<tr>
			<td><%=rs.getString("docid") %></td>
			<td><%=rs.getString("docname") %></td>
			<td><%=rs.getString("author") %></td>
			<td><%=rs.getString("size") %></td>
		</tr>

<%} %>	
</table>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>