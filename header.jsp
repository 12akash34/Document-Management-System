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
                <div class="col-12 col-sm-5 align-self-center">
                    <h1>DOCUMENT MANAGEMENT SYSTEM</h1>
                    <h3>WE SECURE YOUR DOCUMENTS</h3>
                    
                </div>
                <div class="col-12 col-sm-4 align-self-center">
                    <form action="go.jsp" method="post" onsubmit="return ds()">
                        <div class="form-row">    
                          <div class="form-group">
                              <label class="font-weight-bold" for="srch">Search Document :</label>
                        <input type="text" class="form-control" size="40" id="srch" placeholder="Search" name="srch">
                          </div>
                          <div class="form-group"> 
                              <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="st" id="in" value="in" checked>
                  <label for="in">Within my documents</label>
                  &nbsp;<input class="form-check-input" type="radio" name="st" id="out" value="out">
                  <label for="out">Out of my doucments</label>
                              </div>
                          </div>
                        </div>
                            <div class="form-row">
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
      <ul class="navbar-nav nav-pills">
     
          <li class="nav-item active"><a class="nav-link" href="home.jsp" ><i class="bi bi-house-door-fill"></i> Home</a> </li>
		  <li class="nav-item"><a class="nav-link" href="profile.jsp" ><i class="bi bi-person-fill"></i> Profile</a></li>
                  <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="bi bi-chat-left-text-fill"></i> Message</a>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="SendMessage.jsp" >Compose</a>
		      <a class="dropdown-item" href="inbox.jsp" >Inbox</a>
		      <a class="dropdown-item" href="outbox.jsp" >Outbox</a>
		    </div>
		  </li>
		  <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="bi bi-display-fill"></i> My Account</a>
		             <% if(session.getAttribute("login_user1")!=null){ %>
		  	 <div class="dropdown-menu">
		      <a class="dropdown-item" href="users.jsp" >Manage Users</a>
		      <a class="dropdown-item" href="documents.jsp">Manage Documents</a>
                      <a class="dropdown-item" href="Approve.jsp" >Approve Documents</a>
		      <a class="dropdown-item" href="report.jsp" >Generate Report</a>
                         </div>
		  <%}
else if(session.getAttribute("login_user2")!=null){ %>
			   <div class="dropdown-menu">
			      <a class="dropdown-item" href="upload.jsp">Create Document</a>
			      <a class="dropdown-item" href="DocumentView.jsp" >View Documents</a>
			      
                           </div>
		   <%} %>
		  </li>
		  <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="bi bi-gear-fill"></i> Settings</a>
		  		<div class="dropdown-menu">
		  			<a class="dropdown-item" href="changepwd.jsp" >Change Password</a>
		  		</div>
		  </li>
		  <li><a class="nav-link" href="Broadcast.jsp"><i class="bi bi-soundwave"></i> Broadcast</a></li>
		    <li><a class="nav-link" href="help.jsp"><i class="bi bi-question-circle-fill"></i> Help</a></li>
		  <li><a class="nav-link" href="logout.jsp"><i class="bi bi-power"></i> Logout</a></li>
		</ul>
      </div>
    </div>
</nav>
