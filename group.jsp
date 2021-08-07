<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<%      String uid="";
      if(session.getAttribute("login_user1")!=null){
          uid=session.getAttribute("login_user1").toString();
      }
      else if(session.getAttribute("login_user2")!=null){
          uid=session.getAttribute("login_user2").toString();
      }
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
	Statement st=con.createStatement();
        String branch=request.getParameter("branch");
        String year=request.getParameter("year");
        String domain=request.getParameter("dom");
	String guide=request.getParameter("guide");
	String mem2=request.getParameter("mem2");
	String mem3=request.getParameter("mem3");
	String mem4=request.getParameter("mem4");
	st.executeUpdate("insert into team(`year`, `branch`, `domain`, `guide`, `mem1`, `mem2`, `mem3`, `mem4`) values('"+year+"','"+branch+"','"+domain+"','"+guide+"','"+uid+"','"+mem2+"','"+mem3+"','"+mem4+"')");
        response.sendRedirect("mygroup.jsp?msg=Group formed");


%>