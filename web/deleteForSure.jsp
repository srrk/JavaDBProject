<%-- 
    Document   : create
    Created on : 3 Feb, 2017, 11:25:53 AM
    Author     : zeroadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "error.jsp" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new user</title>
        <link rel="stylesheet" href="style.css" type="text/css"></link>
    </head>
    <body>
        
        <sql:setDataSource
            var="myDS"
            driver="org.sqlite.DBMS"
            url="jdbc:sqlite:/tmp/test.db"
        />
        
        <sql:update dataSource="${myDS}" var="count">
            DELETE FROM January WHERE id = '${param.id}' ;
        </sql:update>
        
            <c:if test="${count >= 1}">
                <div class="goodSave">
                    
                    <center>Product Deleted</center>
                    <center><a href="${pageContext.request.contextPath}/expenses.jsp"</center>
                    
                </div>
            </c:if>
        
    </body>
</html>
