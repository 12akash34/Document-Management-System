<%@ page contentType="text/html" pageEncoding="UTF-8"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>DocSpace-manage documents</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
Statement st=con.createStatement();
st.executeUpdate("create table student(f_name varchar(50),l_name varchar(50),s_id varchar(50) not null,password varchar(50) not null ,emailid varchar(100),branch varchar(20), year varchar(10), city varchar(50),mobile varchar(50))");
st.executeUpdate("create table faculty(f_name varchar(50),l_name varchar(50),s_id varchar(50) not null,password varchar(50) not null ,emailid varchar(100),dept varchar(20),city varchar(50),mobile varchar(50))");
st.executeUpdate("create table documentload(docname varchar(50), description varchar(200),docid integer  not null,version integer,author varchar(50),size float,create_on date, status varchar(20),filepath varchar(200))");
st.executeUpdate("create table documentshared(docid integer,sharedto varchar(50),sharedby varchar(50),shared_on date,status varchar(50))");
st.executeUpdate("create table approval(docid integer,s_id varchar(50),approvalby varchar(50),status varchar(50))");	
st.executeUpdate("create table docids(docid integer)");
st.executeUpdate("create table message(mid integer auto_increment,sender varchar(50),reciever varchar(50),subject varchar(100), message varchar,sent_on date,senderstatus varchar(20),recieverstatus varchar(20))");
%>
success.

</body>
</html>