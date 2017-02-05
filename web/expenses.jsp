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
        
        <%-- <c:set var="noOfRows" value="${param.next}"></c:set> --%>
        
           
        
            <%
                int start, end;
                
                if(request.getParameter("start") == null){
                    start = 1;
                    end = 10;
                }
                else{
                    start = Integer.parseInt(request.getParameter("start"));
                    end = Integer.parseInt(request.getParameter("end"));
                }
                
            %>
        
        <sql:query
            var = "listExpenses" 
            dataSource="${myDS}"
            >
            SELECT * FROM January where day between ? and ?;
            <sql:param value="<%=start %>" />
            <sql:param value="<%=end %>" />
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
            
            <%
                if(start != 1){
                out.println("<a href=http://localhost:9090/JavaDBProject/expenses.jsp"+"?start="+(start-10)+"&end="+(end-10)+">"+"Back"+"</a>");
                }
                start += 10;
                end += 10;
                out.println("<a href=http://localhost:9090/JavaDBProject/expenses.jsp"+"?start="+start+"&end="+end+">"+"Next"+"</a>");
                if(start != 1){
                }
                
            %>
        </div>
        
    </body>
</html>
