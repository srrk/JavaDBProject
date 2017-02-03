<%-- 
    Document   : edit
    Created on : 3 Feb, 2017, 2:52:43 PM
    Author     : zeroadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit purchase</title>
        <link rel="stylesheet" href="style.css" type="text/css"></link>
    </head>
    <body>
        <sql:setDataSource
            var = "myDS"
            driver = "org.sqlite.JDBC"
            url = "jdbc:sqlite:/tmp/test.db"
        />
        
        <sql:query var = "listStuff" dataSource = "${myDS}">
            SELECT * FROM January where day = ${param.id};
        </sql:query>
        
            <fieldset>
                <legend class="legend">Edit Product</legend>
                <form action="saveEdits.jsp" method = "post">
                    <table>
                        <!-- readonly first row, day row. -->
                        <tr style="background: white;">
                            <td><label for = "day">Id:</label></td>
                            <td> <input id = "day" name = "day" style= "font-size:16px" value='${param.id}' type = "text" readonly /></td>
                        </tr>
                        <!-- Other rows -->
                        <tr style='background: white;'>
                            <td>
                                <label for="description">Description:</label>
                            </td>
                            <td>
                                <input id = "description" name="description" style="font-size:16px" value="${listStuff.rows[0].description}" type='text' />
                            </td>
                        </tr>
                        <!-- last row, cost row -->
                        <tr style="background:white">
                            <td>
                                <label for="cost">Cost</label>
                            </td>
                            <td>
                                <input id="cost" name="cost" style='font-size:16px' value='${listStuff.rows[0].cost}' type='number' />
                            </td>
                        </tr>
                        <!-- end of the rows -->
                    </table>
                            <p><input type='submit' value='save edits'/></p>
                            <p><a href="${pageContext.request.contextPath}/expenses.jsp" />Back</p>
                </form>
    </body>
</html>
