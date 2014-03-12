<%-- 
    Document   : login
    Created on : 2010-2-25, 21:37:23
    Author     : jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Lib Manager</title>
</head>
<body>
<center>
<hr>
<br/>
<br/>
<%!
Connection con  = null ;
PreparedStatement pstmt = null ;
ResultSet rs  = null ;
%>
<%
String name = null ;
boolean flag = false ;
String user = request.getParameter("user") ;
String passwd = request.getParameter("passwd") ;
String sql = "SELECT * FROM admin WHERE user=? AND passwd=?" ;
try
{
    library.GetConn Data=new library.GetConn();
          this.con=Data.getConn();
    pstmt = con.prepareStatement(sql) ;
    pstmt.setString(1,user) ;
    pstmt.setString(2,passwd) ;
    rs = pstmt.executeQuery() ;
    if(rs.next())
    {
        name = rs.getString(1) ;
        flag = true ;
    }
    rs.close() ;
    pstmt.close() ;
    con.close() ;
    }
catch(Exception e)
{
 System.out.println(e) ;
}
%>
<%
if(flag)
{
request.setAttribute("name",name) ;
%>
<jsp:forward page="manager.jsp"/>
<%
}
else
{
%>
<jsp:forward page="login_fault.html"/>
<%
}
%>
</center>
</body>
</html>
