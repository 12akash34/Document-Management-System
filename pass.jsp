<%@page contentType="text/html" import="java.sql.*" %>
<html>
  <body>
<%
          String uid="";
      if(session.getAttribute("login_user1")!=null){
          uid=session.getAttribute("login_user1").toString();
      }
      else if(session.getAttribute("login_user2")!=null){
          uid=session.getAttribute("login_user2").toString();
      }
      String s[]=request.getParameterValues("contact");
if(s!=null){session.setAttribute("smlength",s.length);
	for(int i=0;i<s.length;i++){
		session.setAttribute("sm"+i,s[i]);
	}
}
	
	String sub=request.getParameter("sub");
	String msg=request.getParameter("msg");
        String rec=request.getParameter("to");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
	
	if(rec==null){
		int slen=(Integer)session.getAttribute("smlength");
		for(int i=0;i<slen;i++){
			rec=(String)session.getAttribute("sm"+i);
			st.executeUpdate("insert into message (sender,receiver,sub,msg,status) values('"+uid+"','"+rec+"','"+sub+"','"+msg+"','broadcast')");
                       
		}
                 response.sendRedirect("Broadcast.jsp");
	
	}
	else{
		st.executeUpdate("insert into message (sender,receiver,sub,msg) values('"+uid+"','"+rec+"','"+sub+"','"+msg+"')");
	response.sendRedirect("outbox.jsp");
	}
%>
</body>
</html>