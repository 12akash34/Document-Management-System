<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat" %>
<html>
<body>
<%
	
	//to get the content type information from JSP Request Header
	String contentType = request.getContentType();
	//here we are checking the content type is not equal to Null and  as well as the passed 
	//data from mulitpart/form-data is greater than or equal to 0
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
		
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
			totalBytesRead += byteRead;
			}
		String file = new String(dataBytes);
		//for saving the file name
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		Date s1=new Date();
   		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd"); 
   	        String uid="";
      if(session.getAttribute("login_user1")!=null){
          uid=session.getAttribute("login_user1").toString();
      }
      else if(session.getAttribute("login_user2")!=null){
          uid=session.getAttribute("login_user2").toString();
      }
		String docname=(String)session.getAttribute("dname");
		int version=(Integer)session.getAttribute("version");
		String des=(String)session.getAttribute("descrip");
		String approver=(String)session.getAttribute("faculty");
		
		saveFile=uid+docname+version+saveFile;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"docSpace","root","");
		
         
            Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
		Statement st4=con.createStatement();	
		// creating a new file with the same name and writing the content in new file
			ResultSet rs=st1.executeQuery("select docname,version from documentload where author='"+uid+"'");
		String s=docname+version;
		String flag="true";
		while(rs.next()){
			String filepath=rs.getString("docname");
			String ver=rs.getString("version");
			String x=filepath+ver;
			if(x.equals(s)){
					
					flag="false";
       response.sendRedirect("upload.jsp?msg=document name already exists with the given version number");
       break;
			}
		}
			
		// creating a new file with the same name and writing the content in new file
			if(flag.equals("true")){
				String filePath = "C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\" + saveFile;
				FileOutputStream fileOut = new FileOutputStream(filePath);
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.flush();
				fileOut.close();
				st1.executeUpdate("insert into documentload(`docname`, `description`, `version`, `author`, `size`, `createdon`, `status`, `filepath`) values('"+docname+"','"+des+"','"+version+"','"+uid+"','"+formDataLength+"','"+f.format(s1) +"','created','"+saveFile+"')");
                               
				ResultSet rs1=st2.executeQuery("select docid from documentload where docname='"+docname+"' and version='"+version+"' and author='"+uid+"'");
				rs1.next();
				String id=rs1.getString("docid");
				st3.executeUpdate("insert into docids values('"+id+"')");
                            

                                 st4.executeUpdate("insert into approval(`docid`, `author`, `approvalby`) values('"+id+"','"+uid+"','"+approver+"');");
                      response.sendRedirect("upload.jsp?msg=Document uploaded successfully");
			}	
		}
	else {
			response.sendRedirect("upload2.jsp?msg=Error in uploading file");
		}	
%>		
	

</body>
</html>