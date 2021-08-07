<% 
          String uid="";
      if(session.getAttribute("login_user1")!=null){
          uid=session.getAttribute("login_user1").toString();
      }
      else if(session.getAttribute("login_user2")!=null){
          uid=session.getAttribute("login_user2").toString();
      }
      %>
<header class="jumbotron">
        <div class="container-fluid"id="head">
            <div class="row row-header">
                <div class="col-12 col-sm-3 align-self-center">
                  <img src="img/document.png" class="img-fluid">
                </div>
                <div class="col-12 col-sm-5">
                    <h2 style="text-align:center">DOCUMENT MANAGEMENT SYSTEM</h2>
                    <h4 style="text-align:center">WE SECURE YOUR DOCUMENTS</h4>
                    <h5 style="text-align:center">WELCOME <%=uid%> !</h5>
                </div>
                <div class="col-12 col-sm-4 align-self-center">
                    <form action="go.jsp" method="post" onsubmit="return ds()">
                         <div class="form-row">
                          <div class="form-group mb-1 pb-1">
                              <label class="font-weight-bold" for="srch">Search Document :</label>
                        <input type="text" class="form-control form-control-sm" size="26" id="srch" placeholder="Search" name="srch">
                          </div>
                          <div class="form-group p-0 m-0 pr-1"> 
                              <div class="form-check form-check-inline p-0 m-0">
                  
                  <input class="form-check-input p-0 m-0" type="radio" name="st" id="out" value="out" checked>
                  <label for="out">Other</label>
                  &nbsp;<input class="form-check-input p-0 m-0" type="radio" name="st" id="in" value="in">
                  <label for="in">My</label>
                              </div>
                          </div>
                         </div>
                        <div class="form-row">
                            <div class="form-group p-0 m-0 pr-1">
                              Year from <input type="number" class="form-control form-control-sm" min="1980" max="2100" value="1980" name="from">
                          </div>
                            <div class="form-group p-0 m-0 pr-1">
                               To <input type="number" class="form-control form-control-sm" min="1980" max="2100" value="2100" name="to"> 
                            </div>
                         </div>
                        <div class="form-row">
                            <div class="form-group p-0 m-0 pr-1">
                                Branch <select class="form-control form-control-sm"  style="max-width:100px" name="branch">
    <option hidden disabled selected value>--select--</option>
                                    <option value="CMPN">CMPN</option>
    <option value="INFT">INFT</option>
    <option value="EXTC">EXTC</option>
    <option value="ETRX">ETRX</option>
    <option value="BIOM">BIOM</option>
    <option value="MMS">MMS</option>
  </select>
                            </div>
                            <div class="form-group p-0 m-0 pr-1">
                                Domain <select class="form-control form-control-sm" style="max-width:60%" name="domain">
                                    <option hidden disabled selected value>--select--</option>
                                                <%  Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st8=c.createStatement();
                                                    ResultSet rs8=st8.executeQuery("select domain_n from domain");
                                                while(rs8.next()){
                                                    %>
                                               
                                                <option value="<%=rs8.getString("domain_n") %>"><% out.print(rs8.getString("domain_n")); %></option>
                                            <% } %>
                                            </select>
                            </div>
                        </div>
                            <div class="form-row mt-1">
                      <button type="submit" value="search" class="btn btn-primary btn-sm ml-1">Search</button>
            </div>
                       </form>
                    
                    
                </div>
            </div>
        </div>
    </header>

<nav class="navbar navbar-dark bg-primary font-weight-bold navbar-expand-sm mb-4">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="Navbar">
      <ul class="navbar-nav mr-auto">
     
          <li class="nav-item active"><a class="nav-link" href="home.jsp" ><i class="bi bi-house-door-fill"></i> Home</a> </li>
		  
                  <li class="nav-item active dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="bi bi-chat-left-text-fill"></i> Message</a>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="SendMessage.jsp" >Compose</a>
		      <a class="dropdown-item" href="inbox.jsp" >Inbox</a>
		      <a class="dropdown-item" href="outbox.jsp" >Outbox</a>
		    </div>
		  </li>
		  <li class="nav-item active dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="bi bi-display-fill"></i> My Account</a>
		             <% if(session.getAttribute("login_user1")!=null){ %>
		  	 <div class="dropdown-menu">
		      <a class="dropdown-item" href="users.jsp" >Manage Users</a>
		      <a class="dropdown-item" href="documents.jsp">Manage Documents</a>
                      <a class="dropdown-item" href="Approve.jsp" >Approve Requests</a>
		      <a class="dropdown-item" href="report.jsp" >Generate Report</a>
                         </div>
		  <%}
if(session.getAttribute("login_user2")!=null){ %>
			   <div class="dropdown-menu">
			      <a class="dropdown-item" href="upload.jsp">Create Document</a>
			      <a class="dropdown-item" href="DocumentView.jsp" >View Documents</a>
			      
                           </div>
		   <%} else {}%>
		  </li>
		  <li class="nav-item active dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="bi bi-gear-fill"></i> Settings</a>
		  		<div class="dropdown-menu">
                                        <a class="dropdown-item" href="profile.jsp" >Profile</a>
		  			<a class="dropdown-item" href="changepwd.jsp" >Change Password</a>
		  		</div>
		  </li>
		  <li class="nav-item active"><a class="nav-link" href="Broadcast.jsp"><i class="bi bi-soundwave"></i> Broadcast</a></li>
		    <li class="nav-item active"><a class="nav-link" href="help.jsp"><i class="bi bi-question-circle-fill"></i> Help</a></li>
		  <li class="nav-item active"><a class="nav-link" href="logout.jsp"><i class="bi bi-power"></i> Logout</a></li>
      </ul>
                  <% if(session.getAttribute("login_user2")!=null){ %>
                  <ul class="navbar-nav navbar-right">
                  <li class="nav-item active" style="border: 2px solid #ff944d; border-radius: 3px;"><a class="nav-link" href="mygroup.jsp"><i class="bi bi-people-fill"></i> My Group</a></li>
		  </ul>
                  <% } %>
                         
      </div>
    </div>
</nav>
