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
        Statement st1=con.createStatement();
        Statement st2=con.createStatement();
        Statement st3=con.createStatement();
        Statement st4=con.createStatement();
	ResultSet rs1=st.executeQuery("select * from documentload where author='"+uid+"' and status='created'");
	
        %>
	
		<h2>Documents</h2>
		<form  action="share.jsp" name="form2">
                    <div class="table-responsive">
		<table class="table table-striped table-bordered table-hover table-warning" align="center">
		<thead class="bg-success">
                    <tr>
				<th>document name</th>
				<th>author</th>
				<th>description</th>
				<th>document id</th>
				<th>created on</th>
				<th>version</th>
				<th>size(bytes)</th>
				<th>status</th>
                                <th>faculty</th>
			</tr>
                </thead>
			<%	while(rs1.next()){ 
				
			%>
			<tr>
				<td><input type="checkbox" name="mine" value="<%=rs1.getString("docid")%>">
				<a href="DownloadFile.jsp?path=C:\docSpace\<%=rs1.getString("filepath")%>"><%=rs1.getString("docname")%></a></td>
				<td><%=rs1.getString("author")%></td>
				<td><%=rs1.getString("description")%></td>
				<td><%=rs1.getString("docid")%></td>
				<td><%=rs1.getString("createdon")%></td>
				<td><%=rs1.getString("version")%></td>
				<td><%=rs1.getString("size")%></td>
				<td>
					<%
                                                ResultSet rs2=st1.executeQuery("select status,approvalby from approval where docid='"+rs1.getString("docid")+"';");
						rs2.next();
						out.print(rs2.getString("status")); 
						
						
					%> 
				</td>
                                <td>
                                    <% out.print(rs2.getString("approvalby")); %>
                                </td>
			</tr>
			<% 	
			}
			%>
			<tr>
				<td colspan="8">
					<input type="submit" value="delete" name="s" >
					
					
				</td>
			</tr>
                </table>
                    </div>
                       
                     
                                <h5 align="center">share to:<input type="text" name="shareto"><br>
			<input type="submit" align="center" value="share" name="s"></h5>

		</form>
		<form  action="share.jsp" name="form3">	
                        <h3 align="center">Documents shared to you</h3>
                        <div class="table-responsive">
			<table class="table table-striped table-bordered table-hover table-warning" title="documents shared to you" border="1" cellspacing="5" align="center">
			<thead class="bg-success">	
                            <tr>
					<th>document name</th>
					<th>author</th>
					<th>description</th>
					<th>document id</th>
					<th>shared by</th>
					<th>shared on</th>
					<th>version</th>
					<th>size in bytes</th>
					<th>approval status</th>
				</tr>
                        </thead>
				<%
					ResultSet rs3=st2.executeQuery("select * from documentshared where sharedto='"+uid+"'");
					while(rs3.next()){ 
						ResultSet rs5=st3.executeQuery("select * from documentload where docid='"+rs3.getString("docid")+"'");
						rs5.next();
						ResultSet rs4=st4.executeQuery("select status,approvalby from approval where docid='"+rs3.getString("docid")+"' ");
				%>
				<tr>
					<td><input type="checkbox" name="share" value="<%=rs3.getString("docid")%>">
					<a href="DownloadFile.jsp?path=<%=rs5.getString("filepath")%>"><%=rs5.getString("docname")%></a></td>
					<td><%=rs5.getString("author")%></td>
					<td><%=rs5.getString("description")%></td>
					<td><%=rs3.getString("docid")%></td>
					<td><%=rs3.getString("sharedby") %></td>
					<td><%=rs3.getString("shared_on")%></td>
					<td><%=rs5.getString("version")%></td>
					<td><%=rs5.getString("size")%></td>
					<td>
						<% 
								rs4.next();
								out.print(rs4.getString("status")); 
								
						%>
				    </td>
                                    <td>
                                        <% out.print(rs4.getString("approvalby")); 
                                         %>
                                    </td>
				</tr>
				<% } %>
				<tr>
					<td colspan="8"><input type="submit" value="delete" name="s" >
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="share" name="s">
					
					
				</tr>
			</table>
                        </div>
			</form>
 </div>
  <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>