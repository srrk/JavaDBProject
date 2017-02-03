<%-- 
    Document   : expenses
    Created on : 2 Feb, 2017, 12:30:01 PM
    Author     : zeroadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kushboo Expenses</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
    </head>
    <body>
        
        <sql:setDataSource
            var = "myDS"
            driver = "org.sqlite.JDBC"
            url = "jdbc:sqlite:/tmp/test.db"
        />
        
        <sql:query
            var = "listExpenses" dataSource="${myDS}">
            SELECT * FROM January;
        </sql:query>
            
        
        <p>
            <center><h3>Kushboo Expenses</h3></center>
        </p>
        
        <div align="center">
            <table class="products" border = "1" cellpadding = "5">
                <tr>
                    <th>Day</th>
                    <th>Description</th>
                    <th>Cost</th>
                </tr>
                <c:forEach var = "item" items = "${listExpenses.rows}">
                    <tr>
                        
                        <td class = "rght"><c:out value="${item.day}" /></td>
                        <td class = "cent"><c:out value="${item.description}" /></td>
                        <td class = "left"><c:out value="${item.cost}" /></td>
                        
                        <!-- additional columns, for CRUD Operations-->
                        <td><a href="${pageContext.request.contextPath}/show.jsp?id=${item.day}">Show</a></td>
                        <td><a href="${pageContext.request.contextPath}/edit.jsp?id=${item.day}">Edit</a></td>
                        <td><a href="${pageContext.request.contextPath}/delete.jsp?id=${item.day}">Delete</a></td>
                        
                    </tr>
                    
                </c:forEach>
            </table>
        </div>
        
    </body>
</html>
