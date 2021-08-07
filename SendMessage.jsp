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
     <form action="pass.jsp" method=""post">
           To:<input list="authors" name="to">
         <datalist id="authors">
             <% Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st2=con.createStatement();
        ResultSet rs2=st2.executeQuery("select f_id as id from faculty where f_id!='"+uid+"' union select s_id from student where s_id!='"+uid+"'");
        while(rs2.next()){
            %>
        
            <option value="<%=rs2.getString("id") %>">
              <% } %>
             
         </datalist>
         Subject:<input type="text" name="sub" size="50"><br>
                <textarea rows="6" cols="70" name="msg"></textarea><br>
		<input type="submit" value="send">
</form>
 </div>
  <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>