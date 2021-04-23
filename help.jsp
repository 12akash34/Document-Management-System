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
     <table class="table table-striped table-bordered table-hover table-warning" align="center" border="2">
	<thead class="bg-success">	
         <tr>
			<th>functionality</th>
			<th>usage</th>
		</tr>
        </thead>
		<tr>
			<td>compose</td>
			<td>helps to create and send message to users in the system</td>
		</tr>
		<tr>
			<td>inbox</td>
			<td>here you can see the messages came to you and share requests</td>
		</tr>
		<tr>
			<td>outbox</td>
			<td>here you can see the messages send from you</td>
		</tr>
		<%if(uid.equals("login_user2")){ %>
		<tr>
			<td>manage documents</td>
			<td>here you can manage all the documents in the system</td>
		</tr>
		<tr>
			<td>manage users</td>
			<td>here you can manage all the users with in the system</td>
		</tr>
		<tr>
			<td>report generation</td>
			<td>to generate reports of either users or documents</td>
		</tr>
		<%}else{ %>
		<tr>
			<td>create document</td>
			<td>here you can create documents to have online storage</td>
		</tr>
		<tr>
			<td>view document</td>
			<td>
				here you can view all your documents and documents shared documents.<br>
				from here you can share documents to any one in the system or send for approval.
			</td>
		</tr>
		<tr>
			<td>Approve documents</td>
			<td>here you can approve documents came for approval by you</td>
		</tr>
		<tr>
			<td>search</td>
			<td>here you can search your documents or documents in the system</td>
		</tr>
		<%} %>
		<tr>
			<td>settings</td>
			<td>here you can change your current password</td>
		</tr>
		<tr>
			<td>address book</td>
			<td>here you can maintain all your contacts of the users in the system </td>
		</tr>
		
	</table>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>