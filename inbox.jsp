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
Statement st2=con.createStatement();
ResultSet rs=st.executeQuery("select * from message where receiver='"+uid+"' and status!='deleted' order by sent_on desc ");

%>	<form action="forward.jsp" method="post" name="msgs">
	<h2 align="center">Inbox</h2>
	<table class="table table-striped table-bordered table-hover table-warning" cellspacing="5" align="center" border="1">
	<thead class="bg-success">	
            <tr>
			<th>Sent by</th>
			<th>Subject</th>
                        <th>Message</th>
			<th> on </th>
		</tr>
        </thead>
		
<%while(rs.next()){
%>
	<tr>
			<td><input type="checkbox" name="mid" value="<%=rs.getString("mid")%>"> <%=rs.getString("sender") %></td>
                        <td><%=rs.getString("sub") %></td>
                        <td width="200px"><div style="overflow:auto; width:200px"><%=rs.getString("msg")%></div></td>
			<td><%=rs.getString("sent_on") %></td>
		</tr>			
<%	
}
%>
		<tr>
			<td><input type="submit" value="delete" name="s" >
			
			</td>
		</tr>
               
	</table>
                <h5 align="center" >forward to : <input list="forw" name="user">
                    <datalist id="forw">
                        <% ResultSet rs2=st2.executeQuery("select f_id as id from faculty where f_id!='"+uid+"' union select s_id from student where s_id!='"+uid+"'");
                        while(rs2.next()){                       
                        %>
                        <option value="<%=rs2.getString("id") %>">
                            <% } %>
                    </datalist>
                    
		<input type="submit" value="forward" name="s"></h5>
	</form>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>