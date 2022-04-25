<%--
    Document   : addUserToDB
    Created on : Apr 25, 2022, 4:44:48 PM
    Author     : Bhavin Vasara
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add user to db</title>
    </head>
    <body>
	<c:if test="${param.submit != null}">
	    <c:set var="name" value="${param.name}"/>
	    <c:set var="rollNo" value="${param.rollNo}"/>
	    <c:set var="course" value="${param.course}"/>

	    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
			       url = "jdbc:mysql://localhost:3306/students"
			       user = "root"  password = ""  />


	    <jsp:useBean id="now" class="java.util.Date" />
	    <fmt:formatDate var="date" value="${now}" pattern="yyyyMMdd" />

	    <sql:update dataSource="con" var="count" sql="INSERT INTO student_info VALUES(null, '${name}', ${rollNo}, '${course}, ${date})"/>
	    <c:if test="${count > 0}">
		User added successfully! <br>
	    </c:if>


	</c:if>


	<form action="" method="post">
	    Name: <input type="text" name="name"><br>
	    Roll No.: <input type="number" name="rollNo"><br>
	    Course: <input type="text" name="course"><br>
	    <input type="submit" name="submit" value="Submit">
	</form>
    </body>
</html>
