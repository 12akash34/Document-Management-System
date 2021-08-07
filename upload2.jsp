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
    
    String dname=request.getParameter("dn");
    String descrip=request.getParameter("des");
    int version=Integer.parseInt(request.getParameter("ver"));
    String faculty=request.getParameter("fac");
    String domain=request.getParameter("dom");
    
    session.setAttribute("dname",dname);
    session.setAttribute("descrip",descrip);
    session.setAttribute("version",version);
    session.setAttribute("faculty",faculty);
    session.setAttribute("domain",domain);
    
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
          <form name="form2">
            <div class="form-row">
            
              <div class="form-group px-1">
                <label for="fn">Author</label>
                <input type="text" class="form-control form-control-sm mr-1" id="fn"  value="<%=uid %>" name="author" disabled>
              </div>
              <div class="form-group px-1">
                <label for="ln">Document Name</label>
                <input type="text" class="form-control form-control-sm mr-1" id="ln" name="dn" value="<%=dname %>" disabled>
              </div>
              <div class="form-group px-1">
                <label for="uid">Description</label>
                <input type="text" class="form-control form-control-sm mr-1" id="uid" oname="des" rows="3" value="<%=descrip %>" disabled><br>
                
              </div>

              <div class="form-group px-1">
                <label for="eid">Version</label>
                <input class="form-control form-control-sm mr-1" id="eid" type="number" name="ver" value="<%=version %>" disabled>
              </div>
              
              <div class="form-group px-1">
                <label for="sel">Faculty</label>
                <input class="form-control form-control-sm mr-1" type="text" name="fac" id="sel" value="<%=faculty %>" disabled>
              </div>
              <div class="form-group px-1">
                <label for="sel">Domain</label>
                <input class="form-control form-control-sm mr-1" type="text" name="dom" id="dom" value="<%=domain %>" disabled>
              </div>
            </div>
          </form>
              <form method="post"  action="uploadFile.jsp" name="form2" enctype="multipart/form-data">
                  <div class="form-row">
                      <div class="form-group px-1">
                          <label for="fil">Select a file to upload:</label>
                            <input class="form-control-file" type="file" id="fil" name="uploadfile" required>
                      </div>
                      <p style="color: red">
         <%
            if(request.getParameter("msg")!=null)
            out.println(request.getParameter("msg"));
         %>
           </p>
                      <div class="form-group px-1">
                          <input type="hidden" name="todo" value="upload">
                         <button type="reset" class="btn btn-secondary btn-sm ml-auto" value="reset">Cancel</button>
              <button type="submit" name="Submit" value="Upload" class="btn btn-primary btn-sm ml-1">Upload</button> 
                      </div>
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