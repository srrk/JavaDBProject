<%-- 
    Document   : save
    Created on : 3 Feb, 2017, 4:24:58 PM
    Author     : zeroadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = 'error.jsp' %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation for Expense Creation</title>
        <link rel="stylesheet" href="style.css" type="text/css" /></link>
    </head>
    <body>
        
        <sql:setDataSource
            var = "myDS"
            driver = "org.sqlite.JDBC"
            url = "jdbc:sqlite:/tmp/test.db"
        />
        
        <!-- check all fields are non-empty, if empty redirect -> create.jsp with a msg -->
        <c:if test = "${empty param.day or empty param.description or empty param.cost}">
            <c:redirect url = "create.jsp">
                <c:param name = "errMsg" value = "Please enter day, description, price" />
            </c:redirect>
        </c:if>
        
        <!-- now update -->
        <sql:update dataSource="${myDS}" var="result">
            INSERT INTO January(day, description, cost) VALUES
            ('<%= request.getParameter("day") %>',
            '<%= request.getParameter("description") %>',
            '<%= request.getParameter("cost") %>');
        </sql:update>
            
        <!-- check the update and confirm -->
        <c:if test="${result >= 1}">
            <div class="goodSave">
                <center>Product created</center>
                <center><a href="${pageContext.request.contextPath}/expenses.jsp">Back</a></center>
            </div>
        </c:if>
        
    </body>
</html>
