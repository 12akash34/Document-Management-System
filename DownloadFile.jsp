<%@ page contentType="text/html" pageEncoding="UTF-8"  import="java.io.*"%>
<!DOCTYPE html>
<html>
<body>
	<%
	  String actualPath = request.getParameter("path");
	  ServletOutputStream ou = response.getOutputStream();
	  out.println("actual : "+ actualPath);
	   System.out.println("actual : "+ actualPath);
	   response.setContentType("APPLICATION/OCTET-STREAM");
	   File file = new File(actualPath);
	   String fname = file.getName();
	   System.out.println(fname);
	   response.addHeader("Content-Disposition","attachment;filename=\""+fname+"\";");
	   //out.println(fname);		  
	   FileInputStream fileIn = new FileInputStream(file);
	   byte[] outputByte = new byte[4096];
	   while(fileIn.read(outputByte, 0, 4096) != -1)
	   {
	ou.write(outputByte, 0, 4096);
	   }
	   fileIn.close();
	  ou.flush();
	   ou.close();
	%>
</body>
</html>