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
	Statement st=con.createStatement();
        ResultSet rs;
        ResultSet rs3;
        
	rs=st.executeQuery("select * from student where s_id!='"+uid+"' order by s_id");
        
%>
<div class="container-fluid">
	<h3 align="center">Student Register</h3>
	<form action="pass.jsp" name="ss" method="post">
		<table class="table table-striped table-bordered table-hover table-warning" align="center">
		<thead class="bg-success">
                    <tr>
			<th>contact name</th>
			<th>contact Id</th>
                        <th>contact number</th>
		</tr>
                </thead>
                <%
                        while(rs.next()){
%>				
		<tr>
			<td> <input type="checkbox" name="contact" value="<%=rs.getString("s_id")%>">
			<%=rs.getString("f_name")%> <%=rs.getString("l_name")%></td>
			<td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("mobile")%></td>
		</tr>		
<%			
		}
 if(session.getAttribute("login_user1")!=null){
                    rs3=st.executeQuery("select * from faculty where f_id!='"+uid+"' order by f_id");
                    while(rs3.next()){
               %>
                <tr>
                    <td> <input type="checkbox" name="contact" value="<%=rs3.getString("f_id")%>">
			<%=rs3.getString("f_name")%> <%=rs3.getString("l_name")%></td>
			<td><%=rs3.getString("email")%></td>
                        <td><%=rs3.getString("mobile")%></td>
                </tr>
                <%
                    }
}
               
			
%>		
		</table>
                        Subject:<input align="center" type="text" name="sub" size="50">
			
			<textarea alihn="center" rows="6" cols="70" name="msg"></textarea>
					<input type="submit" value="send">
				
		
	</form>
                
	 <h3 align="center">History</h3>     
          <table class="table table-striped table-bordered table-hover table-warning" align="center" border="1">
              <thead class="bg-success">
              <tr>
			<th>   Subject   </th>
			<th>   Message   </th>
                        
                        <th>   Time   </th>
		</tr>
              </thead>
              <%
                  Class.forName("com.mysql.jdbc.Driver");
	
	ResultSet rs1=st.executeQuery("select distinct sub,msg,sent_on from message where status='broadcast' order by sent_on desc");
	
        while(rs1.next()){
            %>
        
			<tr>
		            <td><%=rs1.getString("sub")%></td>
                            <td width="200px"><div style="overflow:auto; width:200px"><%=rs1.getString("msg")%></div></td>
                            
                            <td><%=rs1.getString("sent_on")%></td>
			</tr>
		<% } %>	
                        
		</table>
</div>
                 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>