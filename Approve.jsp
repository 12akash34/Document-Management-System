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
Statement st2=con.createStatement();
ResultSet rs3;
ResultSet rs=st.executeQuery("select * from approval where approvalby='"+uid+"' and status!='discarded'");
%>
<div class="container-fluid">
 <form action="judge.jsp" method="post" name="myform">
<table class="table table-striped table-bordered table-hover table-warning" align="center" cellspacing="5" border="1">
	<thead class="bg-success">
    <tr>
		<th>document name</th>
		<th>version</th>
                <th>description</th>
		<th>sent by</th>
                <th>created on</th>
                <th>status</th>
		
	</tr>
        </thead>
        <%while(rs.next()){ 
			
				rs3=st2.executeQuery("select * from documentload where docid='"+rs.getString("docid")+"'");
				rs3.next();
		%>
	<tr>

		<td><input type="checkbox" name="selec"
			value='<%=rs.getString("docid")%>'> <a
			href='DownloadFile.jsp?path=<%=rs3.getString("filepath")%>'><%=rs3.getString("docname")%></a>
		</td>
		<td><%=rs3.getString("version")%></td>
                <td><%=rs3.getString("description")%></td>
		<td><%=rs.getString("author")%></td>
                <td><%=rs3.getString("createdon")%></td>
                <td><%=rs.getString("status")%></td>

	</tr>
	<%	
		}
		%>
	<tr>
		<td><input type="submit" value="approve" name="approval"></td>
		<td><input type="submit" value="reject" name="approval"></td>
                <td><p style="color: red"><%
            if(request.getParameter("msg")!=null)
            out.println(request.getParameter("msg"));
        
%></p></td>
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
