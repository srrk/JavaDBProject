<%-- 
    Document   : saveEdits
    Created on : 3 Feb, 2017, 3:33:36 PM
    Author     : zeroadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "error.jsp" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Edit</title>
        <link rel="stylesheet" ref="style.css" type="text/css"></link>
    </head>
    <body>
        
        <sql:setDataSource
            var = "myDS"
            driver ="org.sqlite.JDBC"
            url = "jdbc:sqlite:/tmp/test.db"
        />
        
        <sql:update dataSource="${myDS}" var = "result">
            UPDATE January SET description = ?,
            cost = ?
            where day = ${param.day};
            <sql:param value = "${param.description}"/>
            <sql:param value = "${param.cost}" />
        </sql:update>
        
            <c:if test = "${result >= 1}">
                <div class="goodSave">
                    <center>Edited product saved</center>
                    <center><a href="${pageContext.request.contextPath}/expenses.jsp">Back</a></center>
                </div>
            </c:if>
        
        
    </body>
</html>
