<%-- 
    Document   : delete
    Created on : 2010-2-27, 1:31:36
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
            int id = Integer.parseInt(request.getParameter("id"));
            String sql = "DELETE FROM books where id=?";
            if (request.getParameter("delete") != null) {
                try {
                    library.GetConn Data = new library.GetConn();
                    this.con = Data.getConn();
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1, id);
                    pstmt.execute();

                    out.print("delete succeeded！return to Manager after 1 seconds！");
                    pstmt.close();
                    con.close();
                    response.setHeader("Refresh", "1;url=manager.jsp");
                } catch (Exception e) {
                    out.println(e);
                }
                }
%>