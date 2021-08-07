<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.Date,java.text.*" %>
<!DOCTYPE html>
<html>
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
<body >
<%@ include file="header.jsp" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docspace","root","");
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
%>

<div class="container-fluid">
<div class="row row-content">
    <div class="col-sm-3"></div>
     <div class="col-sm-6" id="reg">
	<div class="modal-content">
            <div class="modal-header" style="background: #724acf">
          <h4 class="modal-title">Upload your Document </h4>
         
        </div>
        <div class="modal-body">
          <form action="upload2.jsp" method="post" name="form1">
            <div class="form-row">
            
              <div class="form-group px-1">
                <label for="fn">Author</label>
                <input type="text" class="form-control form-control-sm mr-1" id="fn"  value="<%=uid %>" name="author" disabled>
              </div>
              <div class="form-group px-1">
                <label for="ln">Document Name</label>
                <input type="text" class="form-control form-control-sm mr-1" id="ln" name="dn" required>
              </div>
              <div class="form-group px-1">
                <label for="uid">Description</label>
                <textarea type="text" class="form-control form-control-sm mr-1" id="uid" name="des" rows="3" required></textarea>
                
              </div>

              <div class="form-group px-1">
                <label for="eid">Version</label>
                <input type="number" class="form-control form-control-sm mr-1" id="eid" name="ver" min="1" value="1" required>
              </div>
              
              <div class="form-group px-1">
                <label for="sel">Faculty</label>
                <select class="form-control" name="fac" id="sel">
                                             <% ResultSet rs3=st3.executeQuery("select f_id from faculty");
                                             while(rs3.next()){
                                                 %>
                                                 <option value="<%=rs3.getString("f_id")%>"><% out.print(rs3.getString("f_id")); %></option>
                                             <%
                                                 }
                                             %>
                                         </select>
              </div>
                  <div class="form-group px-1">
                <label for="dom">Domain</label>
                <select class="form-control" name="dom" id="dom">
                                             <% ResultSet rs4=st4.executeQuery("select domain_n from domain");
                                             while(rs4.next()){
                                                 %>
                                                 <option value="<%=rs4.getString("domain_n")%>"><% out.print(rs4.getString("domain_n")); %></option>
                                             <%
                                                 }
                                             %>
                                         </select>
              </div>                         
            </div>
              <p style="color: red">
         <%
            if(request.getParameter("msg")!=null)
            out.println(request.getParameter("msg"));
         %>
           </p>
            <div class="form-row">
              <button type="reset" class="btn btn-secondary btn-sm ml-auto" value="reset">Cancel</button>
              <button type="submit" value="upload" class="btn btn-primary btn-sm ml-1">Proceed to Upload Document</button>
            </div>
          </form>
        </div>
      </div>
     </div>
</div>
</div>




           <%@ include file="footer.jsp" %>
   <script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>