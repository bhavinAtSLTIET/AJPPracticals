<%--
    Document   : getUserCart
    Created on : Apr 20, 2022, 8:15:45 PM
    Author     : Bhavin Vasara
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Cart</title>
    </head>
    <body>
        <%-- NOTE: You have to add glassfish.web.xml file in WEB-INF to run this program. --%>
        <%
            if (request.getParameter("add") != null) {

                if (session.getAttribute("items") != null) {
                    List<String> items = (List<String>) session.getAttribute("items");
                    items.add(request.getParameter("item"));
                    session.setAttribute("items", items);
                } else {
                            List<String> items = new ArrayList<>();
                            items.add(request.getParameter("item"));
                            session.setAttribute("items", items);
                        }
                    } else if (request.getParameter("delete") != null) {
                        List<String> items = (List<String>) session.getAttribute("items");
                        items.remove(Integer.parseInt(request.getParameter("delete")));
                        session.setAttribute("items", items);
                    }
            if (!session.isNew()) {
                if (session.getAttribute("items") != null) {
                    List<String> items = (List<String>) session.getAttribute("items");
                            if (!items.isEmpty()) {

                                out.println("Items in cart: <form method='POST'><ol>");
                                int index = 0;
                                for (String item : items) {
                                    out.println("<li>" + item + " <button type='submit' name='delete' value='" + index + "'>Delete</button></li>");
                                    index++;
                                }
                                out.println("</ol></form>");
                            } else {
                                out.println("No items in cart!");
                            }
                        }
            }
        %>
        <form action="" method="POST">
            Add Item: <input type="text" name="item" required>
            <input type="submit" name="add" value="Add to cart">
        </form>
    </body>
</html>
