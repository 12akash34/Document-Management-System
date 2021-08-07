<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
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
	String s=request.getParameter("srch");
        String from=request.getParameter("from");
        String to=request.getParameter("to");
       
        String branch=request.getParameter("branch");
        String domain=request.getParameter("domain");
	Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st2=con.createStatement();
	Statement st3=con.createStatement();
	String us=request.getParameter("st");
%>
<table class="table table-striped table-bordered table-hover table-warning" align="center" border="1">
<thead class="bg-success">	
    <tr>
		<th>document name</th>
		<th>description</th>
		<th>docid</th>
		<th>author</th>
		<th>size</th>
	</tr>
</thead>
<%
	if(us.equals("in")){
		ResultSet rs1=st2.executeQuery("select * from documentload where status!='deleted' and author='"+uid+"'");
		String d[]=s.split(" ");
		while(rs1.next()){
			String k=rs1.getString("docname");
			for(int i=0;i<d.length;i++){
				if(k.startsWith(d[i])){
%>					<tr>	
						<td><a href="<%=rs1.getString("filepath")%>"><%=k%></a></td>
						<td><%=rs1.getString("description")%></td>
						<td><%=rs1.getString("docid")%></td>	
						<td><%=rs1.getString("author") %></td>
						<td><%=rs1.getString("size") %></td>
								
					</tr>
<%
				}
			
			}
		}
		ResultSet rs3=st3.executeQuery("select * from documentshared where sharedto='"+uid+"'");
	if(rs3.next()){	
while(rs3.next()){
			ResultSet rs2=st2.executeQuery("select * from documentload where docid='"+rs3.getString("docid")+"'");
			if(rs2.next()){
			String k=rs2.getString("docname");
			for(int i=0;i<d.length;i++){
				if(k.startsWith(d[i])){
%>					
					<tr>	
						<td><a href="c:\docSpace\<%=rs2.getString("filepath")%>"><%=k%></a></td>
						<td><%=rs2.getString("description")%></td>
						<td><%=rs2.getString("docid")%></td>	
						<td><%=rs2.getString("author") %></td>
						<td><%=rs2.getString("size") %></td>
					</tr>	
<%				}
			
			}
}
		}
}
	}
else{
ResultSet rs1=null;
 if(domain!=null&&branch!=null)	{
rs1=st2.executeQuery("select * from documentload where status !='deleted' and author!='"+uid+"' and domain_doc='"+domain+"' and branch='"+branch+"' and createdon between '"+from+"-00-00' and '"+to+"-00-00'");
}
else if(domain!=null){
rs1=st2.executeQuery("select * from documentload where status !='deleted' and author!='"+uid+"' and domain_doc='"+domain+"' and createdon between '"+from+"-00-00' and '"+to+"-00-00'");
}
else if(branch!=null) {
rs1=st2.executeQuery("select * from documentload where status !='deleted' and author!='"+uid+"' and branch='"+branch+"' and createdon between '"+from+"-00-00' and '"+to+"-00-00'");
}
 else {
rs1=st2.executeQuery("select * from documentload where status !='deleted' and author!='"+uid+"' and createdon between '"+from+"-00-00' and '"+to+"-00-00'");
}

String d[]=s.split(" ");
		while(rs1.next()){
			String k=rs1.getString("docname");
			for(int i=0;i<d.length;i++){
				if(k.startsWith(d[i])){
%>
					<tr>	
						<td><%=k%></td>
						<td><%=rs1.getString("description")%></td>
						<td><%=rs1.getString("docid")%></td>	
						<td><%=rs1.getString("author") %></td>
						<td><%=rs1.getString("size") %></td>
								
					</tr>			
<%				
				}
				
			}
		}
		ResultSet rs3=st3.executeQuery("select * from documentshared where sharedto!='"+uid+"'");
if(rs3.next()){
		while(rs3.next()){
			ResultSet rs2=st2.executeQuery("select * from documentload where docid='"+rs3.getString("docid")+"'");
			if(rs2.next()){
			String k=rs2.getString("docname");
			for(int i=0;i<d.length;i++){
					if(d[i].startsWith(k)){
%>
					<tr>	
						<td><%=k%></td>
						<td><%=rs2.getString("docid")%></td>	
						<td><%=rs2.getString("author") %></td>
						<td><%=rs2.getString("size") %></td>
					</tr>			
<%					}
					if(k.startsWith(d[i])){
%>	
						<tr>	
							<td><%=k%></td>
							<td><%=rs2.getString("docid")%></td>	
							<td><%=rs2.getString("author") %></td>
							<td><%=rs2.getString("size") %></td>
						</tr>			
					
<%					}
			}
}
		}
}
	}
%>
</table>
 </div>
 <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>