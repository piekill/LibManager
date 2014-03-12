<%-- 
    Document   : update
    Created on : 2010-2-27, 1:50:37
    Author     : jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%!    Connection con = null;
    PreparedStatement pstmt = null;
    String Title;
    String Author;
    String State;
    int id;
%>
<%
            String sql;
            try {
                library.GetConn Data = new library.GetConn();
                this.con = Data.getConn();
                if (request.getParameter("update") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                    String title = request.getParameter("title");
                    String author = request.getParameter("author");
                    String state = request.getParameter("state");
                    sql = "UPDATE books SET title=?,author=?,state=? WHERE id=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, title);
                    pstmt.setString(2, author);
                    pstmt.setString(3, state);
                    pstmt.setInt(4, id);
                    pstmt.executeUpdate();

                    out.print("Update succeeded！return to Manager after 1 seconds！");
                    response.setHeader("Refresh", "1;url=manager.jsp");
                } else {
                    id = Integer.parseInt(request.getParameter("id"));
                    sql = "SELECT * FROM books WHERE id=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1, id);
                    ResultSet rs = pstmt.executeQuery();
                    rs.next();
                    Title = rs.getString("title");
                    Author = rs.getString("author");
                    State = rs.getString("state");
                }
                pstmt.close();
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
%>
<html>
    <head>
        <title>Library Manager--Update</title>
    </head>
    <body>
        <form action = "update.jsp?id=<%=id%>" method = "post">
            <table>
                <tr>
                    <td width="100">ID:</td>
                    <td><%=id%></td>
                </tr>
                <tr>
                    <td width="100">Title:</td>
                    <td><input  name="title" size="15" type="text" value="<%=Title%>"/></td>
                </tr>
                <tr>
                    <td width="100">Author:</td>
                    <td><input  name="author" size="15" type="text" value="<%=Author%>"/></td>
                </tr>
                <tr>
                    <td width="100">State:</td>
                    <td><input  name="state" size="15" type="text" value="<%=State%>"/></td>
                </tr>
                <tr>
                    <td width="100"><input type = "submit" name = "update" value = "Update"></td>
                    <td><a href="manager.jsp">Return</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>

