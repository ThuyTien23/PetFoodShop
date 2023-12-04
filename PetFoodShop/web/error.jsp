<%-- 
    Document   : error
    Created on : Jul 19, 2023, 12:59:21 AM
    Author     : min
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>ERROR!!!</h1>
    </body>
</html>-->
<%@page import="dto.PetFood"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="f" class="dao.PetFoodDAO" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping</title>
        
        <c:set var="list" value="${sessionScope.listacc}"/>
    </head>
    <body>        
         <h1>Welcome: ${sessionScope.cloud.fullName}</h1>
         <h3 style="color: red">${requestScope.error}</h3>
    <a href="MainController?action=Logout">Logout</a>   
    <a href="viewCart.jsp"><button>View Cart</button></a>
    
    <form action="MainController">              
            <div>
                <input name="search" type="text" placeholder="Food's Name"/>
                <button type="submit" value="Search_Food" name="action">Search</button>
            </div>
    </form>   
    <table border="1">
                <thead>
                    <tr>                       
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>                                   
                <tbody>                
                    <c:forEach items = "${requestScope.listacc}" var = "i">
                        <form action = "MainController">
                            <tr>                                
                                <td> ${i.id}</td>
                                <td> ${i.name}</td>
                                <td> ${i.description}</td>
                                <td> ${i.price }</td>
                                <td>${i.quantity}</td> 
                                <td>
                                    <input type="hidden" name="id" value="${i.id}"/>
                                    <input type="hidden" name="name" value="${i.name}"/>
                                    <input type="hidden" name="description" value="${i.description}"/>
                                    <input type="hidden" name="price" value="${i.price}"/>
                                    <input type="hidden" name="quantity" value="${i.quantity}"/>
                                    <input type="submit" value="Add to your cart" name="action"/>                                      
                                </td>                                          
                            </tr> 
                        </form>
                        <br>
                    </c:forEach>    
                </tbody>    
    </table>
<!--    <p style="color: red">${"Add successfull!"}</p><br>-->
    <%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
    </body>
</html>