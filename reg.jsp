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
  <script language="javascript" type="text/javascript">

		var userid;
		function check(){
		if(window.XMLHttpRequest){
			return(new XMLHttpRequest());
		}
		else if(window.ActiveXObject){
			return(new ActiveXObject("Microsoft.XMLHTTP"));
		}
		else return null;
	}
	function sendRequest(){
			var uid=document.forms[0].uid.value;
		if(uid==""){
		}
	else{
		var request=check();
		request.onreadystatechange=function(){handleResponse(request)};
		userid=document.forms[0].uid.value;
		request.open("POST","UseridCheck.jsp?uid="+userid,true);
		request.send(null);
		}
	}
	function handleResponse(request){
		var make=true;
		if(request.readyState==4){
			s=""+request.responseText;
			if(s.match("true")){
					f2.innerText=userid+" is available ";
					f1.innerText="";
					make=true;
			}
			else{
				f1.innerText=userid+" is not available ";
				f2.innerText="";
				make=false;
			}
		}
	}
	
	function tests(){
	var val;
	var pwd=document.forms[0].pwd.value;
	var cepwd=document.forms[0].cepwd.value;
	
	if(pwd!=cepwd){
		f3.innerText="passwords do not match";
		val=false;
	}
        else f3.innerText="";
	 if(make==false)
	 	val=false;
            else val=true;
	return Boolean(val);
}	
</script>
</head>
<body>
    <ul class="nav justify-content-center bg-primary">
   <li class="nav-item active"><a style="color: white;" class="nav-link" href="index.jsp"><span class="bi bi-house-door"></span> Home</a></li>
   <li class="nav-item"><a style="color: white;" class="nav-link" href="index.jsp#about"><span class="bi bi-info-circle"></span> About us</a></li>
   <li class="nav-item"><a style="color: white;" class="nav-link" href="reg.jsp#reg"><span class="bi bi-person-plus"></span> Register</a></li>
   <li class="nav-item"><a style="color: white;" class="nav-link" href="index.jsp#login"><span class="bi bi-box-arrow-in-right"></span> Login</a></li>	
   
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
<div class="container-fluid">
<div class="row row-content">
    <div class="col-sm-3"></div>
     <div class="col-sm-6" id="reg">
	<div class="modal-content">
            <div class="modal-header" style="background: #724acf">
          <h4 class="modal-title">Register </h4>
         
        </div>
        <div class="modal-body">
          <form action="regstore.jsp" method="post" onsubmit="tests()">
            <div class="form-row">
              <div class="form-group">
                  
                  <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="user" id="student" value="student" checked><label for="student"> Student </label>
                  <input class="form-check-input" type="radio" name="user" id="faculty" value="faculty"><label for="faculty"> Faculty</label>
              
                  </div></div>
              <div class="form-group px-1">
                <label for="fn">First Name</label>
                <input type="text" class="form-control form-control-sm mr-1" id="fn" name="fn" required>
              </div>
              <div class="form-group px-1">
                <label for="ln">Last Name</label>
                <input type="text" class="form-control form-control-sm mr-1" id="ln" name="ln" required>
              </div>
              <div class="form-group px-1">
                <label for="uid">User ID</label>
                <input type="text" class="form-control form-control-sm mr-1" id="uid" onblur="sendRequest()" name="uid" required><br>
                <p id="f1" style="color: red;"></p><p id="f2" style="color:yellow;"></p>
              </div>
              <div class="form-group px-1">
                <label for="pwd">Password</label>
                <input type="password" class="form-control form-control-sm mr-1" id="pwd" name="pwd" required>
              </div>
              <div class="form-group px-1">
                <label for="cepwd">Confirm Password</label>
                <input type="password" class="form-control form-control-sm mr-1" id="cepwd" onblur="tests()" name="cepwd" required><br>
                <p id="f3" style="color: red;">
              </div>
              <div class="form-group px-1">
                <label for="eid">Email</label>
                <input type="email" class="form-control form-control-sm mr-1" id="eid" name="eid" required>
              </div>
              <div class="form-group px-1">
                <label for="city">City</label>
                <input type="text" class="form-control form-control-sm mr-1" id="city" name="city">
              </div>
              <div class="form-group px-1">
                <label for="phone">Mobile</label>
                <input type="number" class="form-control form-control-sm mr-1" id="phone" name="phone">
              </div>
              <div class="form-group px-1">
                <label for="branch">Branch</label>
                <select class="form-control" id="branch" name="branch">
    <option value="CMPN">CMPN</option>
    <option value="INFT">INFT</option>
    <option value="EXTC">EXTC</option>
    <option value="ETRX">ETRX</option>
    <option value="BIOM">BIOM</option>
    <option value="MMS">MMS</option>
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
              <button type="submit" value="submit" class="btn btn-primary btn-sm ml-1">Register</button>
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
