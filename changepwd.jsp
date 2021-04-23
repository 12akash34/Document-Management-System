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
		function  valids(){
			var npw=document.cp.npwd.value;
			var cpw=document.cp.cpwd.value;
			
			if(npw!=cpw){
					ns.innerText="password do not match";
				return false;
			}
				
		}
		
	</script>
</head>
<body>
 <%@ include file="header.jsp" %>
 <div class="container-fluid">
     <div class="form-row">
     <form name="cp" onsubmit="return valids()" action="change.jsp" method="post">
<div class="form-group">
current password <input type="password" name="opwd" required>

</div>
<div class="form-group">
new password<input type="password" name="npwd" required>

</div>
<div class="form-group">
confirm password<input type="password" name="cpwd" required>>
	<p id="ns"></p>
</div>
<div class="form-group">
	<input type="submit" value="change">
                <p style="color: red"><%
            if(request.getParameter("msg")!=null)
            out.println(request.getParameter("msg"));
        
%></p>
</div>
     </div>
</form>
 </div>
  <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>