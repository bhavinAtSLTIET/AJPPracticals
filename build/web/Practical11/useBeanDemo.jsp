<%--
    Document   : useBeanDemo
    Created on : Apr 25, 2022, 6:24:34 PM
    Author     : Bhavin Vasara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>useBean Demo</title>
    </head>
    <body>
	<jsp:useBean class="Practical11.BeanDemo" id="demo">
	    <jsp:setProperty name = "demo" property = "message" value = "Hello useBean." />
	    <jsp:getProperty name = "demo" property = "message" />
	</jsp:useBean>

    </body>
</html>
