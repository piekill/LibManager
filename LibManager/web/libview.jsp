<%-- 
    Document   : libview
    Created on : 2010-2-26, 19:03:08
    Author     : jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="pages" scope="page" class="library.Viewer" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%!    int pageSize = 5;
    String sqlStr = "";
    int showPage = 1;
%>

<%
            sqlStr = "select * from books ";
            String strPage = null;
            strPage = request.getParameter("showPage");
            if (strPage == null) {
                showPage = 1;
                pages.initialize(sqlStr, pageSize, showPage);
            } else {
                try {
                    showPage = Integer.parseInt(strPage);
                    pages.initialize(sqlStr, pageSize, showPage);
                } catch (NumberFormatException ex) {
                    showPage = 1;
                    pages.initialize(sqlStr, pageSize, showPage);
                }
                if (showPage < 1) {
                    showPage = 1;
                    pages.initialize(sqlStr, pageSize, showPage);
                }
                if (showPage > pages.getPageCount()) {
                    showPage = pages.getPageCount();
                    pages.initialize(sqlStr, pageSize, showPage);
                }
            }
            Vector<Object> vData = pages.getPage();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
        <title>Library Manager</title>
    </head>

    <body bgcolor="#ffffff" text="#000000">
        
        <h2>Welcome to Library Manager</h2>
        <table align="Center">
            <tr>
                <td width="150"><a href="insert.html">Insert</a></td>
                <td width="150"><a  href="delete.html">Delete</a></td>
                <td width="150"><a href="update.html">Update</a></td>
            </tr>
        </table>

        <h3 align=center>BOOKS</h3>
        <div align=center>
            <table border="1" cellspacing="0" cellpadding="0" width="80%">
                <tr>
                    <th width="20%">ID</th>
                    <th width="40%">Title</th>
                    <th width="40%">Author</th>
                    <th width="40%">State</th>
                </tr>
                <%
                            for (int i = 0; i < vData.size(); i++) {
                                String[] sData = (String[]) vData.get(i);
                %>
                <tr>
                    <td><%=sData[0]%></td>
                    <td><%=sData[1]%></td>
                    <td><%=sData[2]%></td>
                    <td><%=sData[3]%></td>
                </tr>
                <%
                            }
                %>
            </table>
            <p>
            <form action="libview.jsp" method="get" target="_self">
                <p>第<font color=red><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页&nbsp;&nbsp;[<a href="libview.jsp?showPage=1" target="_self">首页</a>]&nbsp;
                    <%
                                if (showPage > 1) {
                    %>
                    [<a href="libview.jsp?showPage=<%=showPage - 1%>" target="_self">上一页</a>]&nbsp;
                    <%
                                                    } else {
                    %>
                    [上一页]&nbsp;
                    <%              }
                                if (showPage < pages.getPageCount()) {
                    %>
                    [<a href="libview.jsp?showPage=<%=showPage + 1%>" target="_self">下一页</a>]&nbsp;
                    <%
                                                    } else {
                    %>
                    [下一页]&nbsp;
                    <%              }
                    %>

                    [<a href="libview.jsp?showPage=<%=pages.getPageCount()%>" target="_self">尾页</a>]&nbsp;转到
                    <select name="select">
                        <%
                                    for (int x = 1; x <= pages.getPageCount(); x++) {
                        %>
                        <option value="<%=x%>"
                                <%
                                                                        if (showPage == x) {
                                                                            out.println("selected");
                                                                        }
                                %> ><%=x%></option>
                        <%
                                    }
                        %>
                    </select>
                    页&nbsp;&nbsp;&nbsp;
                    <input type="submit" name="go" value="提交" />
                </p>
            </form>
    </div>
</body>
</html>

