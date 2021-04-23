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
        Statement st1=con.createStatement();

        %>
 <div class="container-fluid">
     <div class="row">
         <div class="col col-sm-3 pt-3" style="background-color: #ffe4b3;">
             <ul id="myUL">
         
  <li><span class="caret">AI</span>
    <ul class="nested">
      <li>doc</li>
      <li>doc</li>
    </ul>
  </li>
  <li><span class="caret">Blockchain</span>
        <ul class="nested">
          <li>doc</li>
          <li>doc</li>
        </ul>
      </li>
   <li><span class="caret">Bigdata</span>
            <ul class="nested">
              <li>doc</li>
              <li>doc</li>
              <li>doc</li>
              <li>doc</li>
            </ul>
          </li>
    <li><span class="caret">IOT</span>
            <ul class="nested">
              <li>doc</li>
              <li>doc</li>
              <li>doc</li>
              <li>doc</li>
            </ul>
          </li>
      <li><span class="caret">Web Development</span>
            <ul class="nested">
              <li>doc</li>
              <li>doc</li>
              <li>doc</li>
              <li>doc</li>
            </ul>
          </li>
</ul>
         </div>
         <div class="col col-sm-9">
             
             <div class="table-responsive">
		<table class="table table-striped table-bordered table-hover table-warning" align="center">
		<thead class="bg-success">
                    <tr>
				<th>document name</th>
				<th>description</th>
				<th>created on</th>
				<th>version</th>
				<th>size(bytes)</th>
                                <th>author</th>
			</tr>
                </thead>
			<%	
                            ResultSet rs1=st.executeQuery("select * from approval where status='approved'");
                            while(rs1.next()){ 
				ResultSet rs2=st1.executeQuery("select * from documentload where docid='"+rs1.getString("docid")+"'");
				rs2.next();
			%>
			<tr>
				<td><input type="checkbox" name="mine" value="<%=rs1.getString("docid")%>">
				<a href="DownloadFile.jsp?path=C:\docSpace\<%=rs2.getString("filepath")%>"><%=rs2.getString("docname")%></a></td>
				<td><%=rs2.getString("description")%></td>
				<td><%=rs2.getString("createdon")%></td>
				<td><%=rs2.getString("version")%></td>
				<td><%=rs2.getString("size")%></td>
                                <td><%=rs1.getString("author")%></td>
                        <tr>
                            <% } %>
                            <td>
					<input type="submit" value="delete" name="s" >
					
					
				</td>
			</tr>
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