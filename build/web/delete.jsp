<%-- 
    Document   : delete
    Created on : 3 Feb, 2017, 11:36:40 AM
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
        <title>Delete a product</title>
        <link rel="stylesheet" href="style.css" type="text/css"></link>
    </head>
    <body>
        <fieldset>
            <legend class = "legend">Delete user</legend>
            
            <div style = "font-weight:bold;font-size:101%;">
                <c:out value="Are you sure you want to day with Id ${param.id}?" />
            </div>
            
                <p><a href="${pageContext.request.contextPath}/expenses.jsp">Cancel</a>  |  
                    <a href="${pageContext.request.contextPath}/deleteForSure.jsp?id=${param.id}">Delete the purchase</a>
                </p>
                
        </fieldset>
    </body>
</html>
