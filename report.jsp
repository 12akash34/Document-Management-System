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
 <form action="generate.jsp">
           
		<table class="table table-striped table-bordered table-hover table-warning" align="center">
                    <tr><td></td>
                        <td> <h3>Documents Report</h3></td></tr>
			<tr>
				<td>from<input type="text" name="start" placeholder="yyyy-MM-dd"/></td>
				<td>to<input type="text" name="end" placeholder="yyyy-MM-dd"></td> 
				<td><input type="submit" name="generate" value="generate"></td>
			</tr>
			
		</table>
	</form>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>