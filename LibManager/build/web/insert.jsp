<%-- 
    Document   : insert
    Created on : 2010-2-26, 20:53:36
    Author     : jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%!    Connection con = null;
    PreparedStatement pstmt = null;
%>
<%
            Integer id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String state = request.getParameter("state");
            String sql = "INSERT  INTO books (id,title,author,state) VALUES (?,?,?,?)";
            if (request.getParameter("insert") != null) {
                try {
                    library.GetConn Data = new library.GetConn();
                    this.con = Data.getConn();
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1, id);
                    pstmt.setString(2, title);
                    pstmt.setString(3, author);
                    pstmt.setString(4, state);
                    pstmt.execute();

                    out.print("Insert succeeded！return to Manager after 1 seconds！");
                    pstmt.close();
                    con.close();
                    response.setHeader("Refresh", "1;url=manager.jsp");
                } catch (Exception e) {
                    out.println(e);
                }
                }
%>
