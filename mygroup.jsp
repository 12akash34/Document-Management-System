<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
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
 <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
        Statement st1=con.createStatement();
        Statement st2=con.createStatement();
        Statement st4=con.createStatement();
        Statement st5=con.createStatement();
        ResultSet rs1=st.executeQuery("select branch, batch from student where s_id='"+uid+"'");
        rs1.next(); 
        String branch=rs1.getString("branch");
        String batch=rs1.getString("batch");
        
 %>
 
 <ul class="nav nav-tabs">
    <li class="nav-item active"><a data-toggle="tab" class="nav-link active" href="#yg">Your group</a></li>
    <li class="nav-item"><a data-toggle="tab" class="nav-link" href="#cg">Create group</a></li>
    
  </ul>
 <div class="tab-content">
     <div id="yg" class="tab-pane active">
      <% ResultSet rs5=st5.executeQuery("select * from team where mem1='"+uid+"' or mem2='"+uid+"' or mem3='"+uid+"' or mem4='"+uid+"'");
         rs5.next(); %>
         <ul style="list-style-type: none;">
             <li><h4>Domain: <%=rs5.getString("domain")%></h4></li>
             <li><h5>Guide: <%=rs5.getString("guide")%></h5></li>
             <li><%=rs5.getString("mem1")%></li>
             <li><%=rs5.getString("mem2")%></li>
             <li><%=rs5.getString("mem3")%></li>
             <li><%=rs5.getString("mem4")%></li>
         </ul>
    </div>
    
         
         <div id="cg" class="tab-pane">
      <h4>Create Group</h4>
 <form action="group.jsp" method="post">
     Branch: <input type="text" name="branch" value="<%=branch%>" readonly><br>
     Year: <select id="yyyy" name="year">
         <option value="FE">FE</option>
         <option value="SE">SE</option>
         <option value="TE">TE</option>
         <option value="BE">BE</option>
     </select> <br>
     Project domain: <select id="domain" name="dom">
         <% ResultSet rs2=st1.executeQuery("select domain_n from domain");
         while(rs2.next()){
             %>
             <option value="<%=rs2.getString("domain_n")%>"><% out.print(rs2.getString("domain_n")); %></option>
         <% } %>
     </select><br>
     Guide: <input list="fac" name="guide">
     <datalist id="fac">
         <% ResultSet rs3=st2.executeQuery("select distinct faculty from domain_expertise");
         while(rs3.next()){
             %>
             <option value="<%=rs3.getString("faculty")%>">
         <% } %>
     </datalist><br>
     
     Member 2: <input list="mem2" name="mem2" required>
     <datalist id="mem2">
         <%  ResultSet rs4=st4.executeQuery("select s_id from student where branch='"+branch+"' and batch='"+batch+"'");
            
         while(rs4.next()){
         %>
         <option value="<%=rs4.getString("s_id")%>">
             <% } %>
     </datalist><br>
     Member 3: <input list="mem3" name="mem3" required>
     <datalist id="mem3">
         <% rs4.beforeFirst();
         while(rs4.next()){
         %>
         <option value="<%=rs4.getString("s_id")%>">
             <% } %>
     </datalist><br>
     Member 4: <input list="mem4" name="mem4">
     <datalist id="mem4">
         <% rs4.beforeFirst();
         while(rs4.next()){
         %>
         <option value="<%=rs4.getString("s_id")%>">
             <% } %>
     </datalist><br>
     <p style="color: red">
         <%
            if(request.getParameter("msg")!=null)
            out.println(request.getParameter("msg"));
         %>
     </p>
     <button type="submit" value="grp">Form group</button>
 </form>
    </div>
 </div>
 
<%@ include file="footer.jsp" %>
<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>