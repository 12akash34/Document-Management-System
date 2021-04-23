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
<script type="text/javascript">
		function valids1(){
			var len=document.docform.docs.length;
			if(len>0)
				for(i=0;i<len;i++){
					if(document.docform.docs[i].checked)
					  		return true;
				}
			else
				if(document.docform.docs.checked)
					return true;
		
			return false;
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
ResultSet rs=st.executeQuery("select * from documentload where status!='deleted'");
Boolean z=rs.next();
if(z){
%><form action="managedocs.jsp" method="get" name="docform"  onsubmit="return valids1()">
	<table class="table table-striped table-bordered table-hover table-warning" align="center" border="1">
	<thead class="bg-success">	
            <tr>
			<th>document name</th>
			<th>document id</th>
			<th>author</th>
			<th>size</th>
		</tr>
        </thead>
<%
	while(z){
		%>
		<tr>
			<td><input type="checkbox" name="docs" value="<%=rs.getString("docid")%>"><%=rs.getString("docname")%></td>
			<td><%=rs.getString("docid") %></td>
			<td><%=rs.getString("author") %></td>
			<td><%= rs.getString("size")%></td>
		</tr>
<%
	z=rs.next();
	}
%>
	<tr>
		<td colspan="5"><input type="submit" value="delete"></td>
	</tr>
	</table></form>
<% 
}
%>
 </div>
  <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>