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
        <title>Create purchase</title>
        <link rel="stylesheet" href="style.css" type="text/css"></link>
    </head>
    <body>
       
        <div>
            <fieldset>
                <legend class="legend">Edit Product</legend>
                <form action="${pageContext.request.contextPath}/save.jsp" method = "post">
                    <table>
                        <tbody>
                        <!--  first row, day row. -->
                        <tr style="background: white;">
                            <td><label for = "day">Id:</label></td>
                            <td> <input id = "day" name = "day" style= "font-size:16px" type = "text" /></td>
                        </tr>
                        <!-- description row -->
                        <tr style='background: white;'>
                            <td>
                                <label for="description">Description:</label>
                            </td>
                            <td>
                                <input id = "description" name="description" style="font-size:16px" type='text' />
                            </td>
                        </tr>
                        <!-- last row, cost row -->
                        <tr style="background:white">
                            <td>
                                <label for="cost">Cost</label>
                            </td>
                            <td>
                                <input id="cost" name="cost" style='font-size:16px' type='number' />
                            </td>
                        </tr>
                        <!-- end of the rows -->
                        </tbody>
                    </table>
                            <p><input type='submit' value='Create Expense'/></p>
                            <p><a href="${pageContext.request.contextPath}/expenses.jsp" />Back</p>
                </form>
            </fieldset>
        </div>
    </body>
</html>
