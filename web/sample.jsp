<%-- 
    Document   : sample
    Created on : Feb 5, 2017, 3:42:24 PM
    Author     : SRRK <rajeshs@cdac.in>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <c:if test="${ empty param.next}">
            <c:set var="start" value="10" scope="session"></c:set>
        </c:if>
        
        <sql:setDataSource
            var = "myDS"
            driver = "org.sqlite.JDBC"
            url = "jdbc:sqlite:/tmp/test.db"
        />
        
        <sql:query
            var = "listExpenses" dataSource="${myDS}">
            SELECT * FROM January;
        </sql:query>
            
            <%-- <c:out value="No.of.rows = ${listExpenses.getRowCount()}"></c:out> --%>
            <c:out value="start is ${start}"></c:out>
            <sql:query
                 
    </body>
</html>
