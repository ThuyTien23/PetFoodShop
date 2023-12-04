<%-- 
    Document   : admin
    Created on : Jul 19, 2023, 12:52:27 AM
    Author     : min
--%>


<%@page import="dto.PetFood"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:useBean id="f" class="dao.PetFoodDAO" scope="request"></jsp:useBean>--%>
<jsp:useBean id="f" class="dao.UserDAO" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
         <c:if test="${sessionScope.cloud.roleID != 'AD'}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>
        <c:set var="list" value="${sessionScope.listacc}"/>
        <link rel="stylesheet" href="styleadmin.css" type="text/css" />
    </head>
    <body>   

            <h1>Welcome: ${sessionScope.cloud.fullName}</h1>
            <h3 style="color: red">${requestScope.error}</h3>             
            <a class ="out" href="MainController?action=Logout">Logout</a> 

        <div class="add">
            <a class="test" href="addlist.jsp">Add Food</a> 
        </div>         
    
    <form action="MainController" method="post">
            <div class="search">
                <input name="search" type="text" placeholder="Food's Name"/>
                <button type="submit" value="Search" name="action">Search</button>
            </div>
    </form>   
    
    <table border="2">
                <thead>
                    <tr>                       
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th></th>
                    </tr>
                </thead>                                   
                <tbody>                
                    <c:forEach items = "${listacc}" var = "i">
                        <form action  = "MainController" method = "POST">
                            <tr>
                                
                                <td data-title  = "ID" > ${i.id} </td>
                                <td data-title  = "Name" > ${i.name}</td>
                                <td data-title  = "Description" > ${i.description} </td>
                                <td data-title  = "Price" > ${i.price }</td>
                                <td data-title  = "Quantity" >${i.quantity} </td>   
                                <td data-title="Delete"><a class="test" href="MainController?id=${i.id}&action=Delete">Delete</a></td>
                            </tr> 
                        </form>
                        <br>
                    </c:forEach>
    
    </tbody>    
    </table>
    </br>
<!--    <form action="MainController" method="post">
            <div class="search">
                <input name="search" type="text" placeholder="User's Name"/>
                <button type="submit" value="Search_acc" name="action">Search</button>
            </div>
    </form>  -->
    <table border="2">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Password</th>
                    <th>Role ID</th>
                    
                </tr>
            </thead>
            <%
                int count = 0;
            %>
                <tbody>
                    <c:forEach items ="${f.getListUser()}" var="p" >
                    <form action="MainController" method="POST">
                        <tr>        
                            <td><%= ++count%></td>
                            <td>${p.userID}</td>
                            <td>${p.fullName}</td>
                            <td>${p.roleID}</td>
                            <td>${p.password}</td>                                                                             
                        </tr>
                    </form>
                    <br> 
                </c:forEach>
        </tbody>
    </table>
    </body>
</html>
