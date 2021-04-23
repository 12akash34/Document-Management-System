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
</head>
<body>
 <ul class="nav justify-content-center bg-primary ">
   <li class="nav-item active"><a style="color: white;" class="nav-link" href="index.jsp"><span class="bi bi-house-door"></span> Home</a></li>
   <li class="nav-item"><a style="color: white;" class="nav-link" href="#about"><span class="bi bi-info-circle"></span> About us</a></li>
   <li class="nav-item"><a style="color: white;" class="nav-link" href="reg.jsp"><span class="bi bi-person-plus"></span> Register</a></li>
   <li class="nav-item"><a style="color: white;" class="nav-link" href="#login"><span class="bi bi-box-arrow-in-right"></span> Login</a></li>	
 </ul>      
    <header class="jumbotron p-0">
        <div class="container-fluid" id="head">
            <div class="row row-header">
                <div class="col-12 col-sm-4 p-5 align-self-center">
                  <img src="img/document.png" class="img-fluid">
                </div>
                <div class="col-12 col-sm-8 align-self-center">
                    <h1>DOCUMENT MANAGEMENT SYSTEM</h1>
                    <h3>WE SECURE YOUR DOCUMENTS</h3>
                    <p>Welcome</p>
                </div>
                
            </div>
        </div>
    </header>
 
    <div id="about" class="container-fluid">
        <div class="row row-content">
            <div class="col-12 col-sm-8" style="text-align: center;">
            <p><b>Online Document Management System</b> solution streamlines your document management processes. Secure online file storage capabilities let you store and organize documents online and access them where ever you are. You can share documents online and collaborate on them with colleagues, students and partners. Online document management and document collaboration let you store, organize, view, and modify files with just an Internet connection. There's no software to install, no servers to maintain...ever!
			online document management system at a fraction of the time and cost of traditional document management software. Our effective document manager solution is low-cost, hassle-free, scalable, and secure.
			Document management software allows files to be stored, organized, and modified seamlessly. Professionals need better document management capabilities to streamline document creation, review, and sharing processes. Get an all-in-one document solution for your business and save time and money.</p>
        
            </div>
            <div class="col-12 col-sm-4" id="login">
                <div class="modal-content">
                <div class="modal-header" style="background: #724acf">
          <h4 class="modal-title">Login </h4>
          
        </div>
                    <div class="modal-body">
                <form action="login.jsp" method="post">
            <div class="form-row">
                
              <div class="form-group">
                  
                  <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="user" id="student" value="student" checked><label for="student"> Student</label>
                  &nbsp;<input class="form-check-input" type="radio" name="user" id="faculty" value="faculty"><label for="faculty"> Faculty</label>
              
                  </div>
              </div>
              <div class="form-group col-md-6">
                <label for="uname">User ID</label>
                <input type="text" class="form-control form-control-sm mr-1" id="uname" placeholder="Enter User-id" name="uname"><br>
              </div>
              <div class="form-group col-md-6">
                <label for="pwd">Password</label>
                <input type="password" class="form-control form-control-sm mr-1" placeholder="Password" id="pwd" name="pwd">
              </div>
              
            </div>
                    <p style="color: red">
         <%
            if(request.getParameter("msg")!=null)
            out.println(request.getParameter("msg"));
         %>
           </p>
            <div class="form-row">
                
              <button type="button" class="btn btn-secondary btn-sm ml-auto" data-dismiss="modal">Cancel</button>
              <button type="submit" value="submit" class="btn btn-primary btn-sm ml-1">Sign in</button>
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