<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DocSpace-manage documents</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/tree.css">
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

        %>
        
       
     <div class="row">
         <div class="col col-sm-3 py-3" style="background-color: #ffe4b3;">
             <ul id="myUL">
                 <% ResultSet rs3=st2.executeQuery("select * from domain");
                 while(rs3.next()){
                     %>
                 
                 
  <li><span class="caret"><%=rs3.getString("domain_n")%></span>
    <ul class="nested">
        <% ResultSet rs4=st3.executeQuery("SELECT docname FROM `documentload` WHERE domain_doc='"+rs3.getString("domain_n")+"' and docid in (select docid from approval where documentload.docid=approval.docid and status='approved')");
        while(rs4.next()){
        %>
        <li><%=rs4.getString("docname")%></li>
     <% } %>
    </ul>
  </li>
  <% } %>
    </ul>
  </li>
             </ul>
             </div>
         <div class="col col-sm-9">
             
             <div class="table-responsive">
                 <table class="table table-striped table-bordered table-hover table-warning" align="center">
		<thead class="bg-success">
                    <tr>
				<th>Doc Name</th>
				<th>Info</th>
				<th>Created on</th>
                                <th>Author</th>
                                <th>Approved by</th>
                                <th>Domain</th>
			</tr>
                </thead>
			<%	
                            ResultSet rs1=st.executeQuery("select * from approval where status='approved'");
                            while(rs1.next()){ 
				ResultSet rs2=st1.executeQuery("select * from documentload where docid='"+rs1.getString("docid")+"'");
				rs2.next();
			%>
			<tr>
				<td>
				<a href="DownloadFile.jsp?path=<%=rs2.getString("filepath")%>"><%=rs2.getString("docname")%></a></td>
				<td><%=rs2.getString("description")%></td>
				<td><%=rs2.getString("createdon")%></td>
                                <td><%=rs1.getString("author")%></td>
                                <td><%=rs1.getString("approvalby")%></td>
                                <td><%=rs2.getString("domain_doc")%></td>
                       		</tr>
                                <% } %>	
                </table>
                 
                 </div>
         
         </div>
     </div>
 </div>
    <%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
   <script>
      var toggler = document.getElementsByClassName("caret");
var i;

for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested").classList.toggle("active");
    this.classList.toggle("caret-down");
  });
}
</script>
</body>
</html>