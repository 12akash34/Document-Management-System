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
	String status=(String)session.getAttribute("status");
if(status.equals("recieverstatus")){
%>
<h3 align="center"><a href="inbox.jsp"> back to inbox </a></h3>
<%}else{ %>
<h3 align="center"><a href="outbox.jsp"> back to outbox </a></h3>
<%} %>
<br>
<table class="table table-striped table-bordered table-hover table-warning" style="color: black" bgcolor="white" align="center" height="200" width="700">
<tr>
	<td><%=request.getParameter("sub") %></td>
</tr>
<tr>
	<td>
	<%
		out.println(request.getParameter("msg"));
	%>
	</td>
</tr>
</table>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>