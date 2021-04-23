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
    String s[]=request.getParameterValues("contact");
if(s!=null){session.setAttribute("smlength",s.length);
	for(int i=0;i<s.length;i++){
		session.setAttribute("sm"+i,s[i]);
	}
}
 %>	<form action="pass.jsp" method="post">
		
     Subject:<input align="center" type="text" name="sub" size="70"><br>
     <textarea align="center" rows="6" cols="70" name="msg"></textarea><br>
					<input type="submit" value="send">
			
	</form>
                <h3 align="center">Conversation History</h3>     
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
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select distinct sub,msg,sent_on from message order by sent_on desc");
	
        while(rs.next()){
            %>
        
			<tr>
		            <td><%=rs.getString("sub")%></td>
                            <td width="200px"><div style="overflow:auto; width:200px"><%=rs.getString("msg")%></div></td>
                            
                            <td><%=rs.getString("sent_on")%></td>
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