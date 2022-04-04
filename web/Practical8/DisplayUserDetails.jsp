<%--
    Document   : DisplayUserDetails
    Created on : Apr 4, 2022, 8:19:28 PM
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
            Cookie userCookie = new Cookie("username", request.getParameter("username"));
            Cookie passCookie = new Cookie("password", request.getParameter("password"));
            response.addCookie(userCookie);
            response.addCookie(passCookie);

            Cookie cookies[] = request.getCookies();
            for (Cookie ck : cookies) {
                out.println(ck.getName() + " = " + ck.getValue() + "<br>");
            }


        %>
    </body>
</html>
