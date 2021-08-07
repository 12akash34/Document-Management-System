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
        Statement st3 =con.createStatement();
	String fn,ln,user,eid,city,phno;
        fn=ln=user=eid=city=phno="";
        if(session.getAttribute("login_user1")!=null){
	ResultSet rs=st.executeQuery("select * from faculty where f_id='"+uid+"'");
        rs.next();
        fn=rs.getString("f_name");
	ln=rs.getString("l_name");
	user=rs.getString("f_id");
	eid=rs.getString("email");
	city=rs.getString("city");
	phno=rs.getString("mobile");
        }
        else if(session.getAttribute("login_user2")!=null){
            ResultSet rs=st.executeQuery("select * from student where s_id='"+uid+"'");
            rs.next();
            fn=rs.getString("f_name");
	ln=rs.getString("l_name");
	user=rs.getString("s_id");
	eid=rs.getString("email");
	city=rs.getString("city");
	phno=rs.getString("mobile");
        }
	%>
	<div class="container-fluid">
	<form action="UpdateProfile.jsp"  method="post">
			<table class="table table-striped table-bordered table-hover table-warning" align="center">	
				<tr>
					 <td>First name :</td>
					 <td><input type="text" name="fn" maxlength="15"  value="<%=fn%>"/></td>
					 
				</tr>
				<tr>
				        <td>Last name :</td>
					<td><input type="text" name="ln" maxlength="15" value="<%=ln%>"/></td>
					
				</tr>
				<tr>
					<td>User ID :</td>
					<td><input type="text" name="uid" maxlength="10" disabled="disabled" value="<%=user%>"/></td>
					
				</tr>
				
				<tr>
				        <td>Email ID :</td>
					<td><input type="text" name="eid" maxlength="20" value="<%=eid%>"/></td>
					
				</tr>
				<tr>
					<td>City :</td>
					<td><input type="text" name="city" maxlength="10" value="<%=city%>"></td>
					
				</tr>
				<tr>
					<td>Mobile :</td>
					<td><input type="text" name="phone" maxlength="12" value="<%=phno%>"/></td>
					
				</tr>
                                <% if(session.getAttribute("login_user1")!=null){
                                    ResultSet rs1=st1.executeQuery("select distinct domain_n from domain_expertise where faculty='"+uid+"'");
                                    %>
                                    <tr>
                                        <td>Domains :</td>
                                        <td><p><% while(rs1.next()){ out.print(rs1.getString("domain_n")+". "); } %></p>
                                            Add new Domain :(Use Ctrl button or drag mouse to select multiple)<br>
                                            <select name="dom" multiple>
                                                <% ResultSet rs3=st3.executeQuery("select domain_n from domain where domain_n not in (select distinct domain_n from domain_expertise where faculty='"+uid+"')");
                                                while(rs3.next()){
                                                    %>
                                               
                                                <option value="<%=rs3.getString("domain_n") %>"><% out.print(rs3.getString("domain_n")); %></option>
                                            <% } %>
                                            </select>
                                        </td>
                                    </tr> 
                                    
                             <%   } %>
				
                                <tr><td></td>
                                    <td><button type="reset" value="cancel"/>Reset
                                        <button type="submit" value="update">Update</button>
				  </td>
				</tr>
				</table>			
		</form>
        </div>
                                         <%@ include file="footer.jsp" %>
	<script src="bootstrap/jquery/dist/jquery.slim.min.js"></script>
  <script src="bootstrap/popper.js/dist/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>