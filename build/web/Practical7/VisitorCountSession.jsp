<%--
    Document   : VisitorCountSession
    Created on : Apr 4, 2022, 8:31:53 PM
    Author     : Bhavin Vasara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                //TODO:Find what is throwing null pointer Exception
                if (session.isNew()) {
                    session.setAttribute("count", 1);
                    out.println("Welcome New user!");
                } else {
                    session.setAttribute("count", Integer.parseInt(session.getAttribute("count").toString()) + 1);
                    out.println("Count = " + session.getAttribute("count"));
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
