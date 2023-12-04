<%-- 
    Document   : Foodlist
    Created on : Jul 19, 2023, 2:27:44 AM
    Author     : min
--%>

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
          <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            background-image: url('images/backgrounglogin.jpg');
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: purple;
        }

        h3 {
            text-align: center;
            color: red;
        }
        div.view {
            display: flex;
            justify-content: center;
        }
            
        a {
            display: inline-block;
            text-align: center;
            margin: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 12px 24px;
            border-radius: 5px;
            transition: background-color 0.2s ease;
        }

        a:hover {
            background-color: #0056b3;
        }

        form {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            margin-left: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #e3e3e3;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
        }
        div.mess{
            display: flex;
            justify-content: center;
        }
    </style>
    </head>
    <body> 
        <h1>Pet Food Shop</h1>
         <!--<h1>Welcome: ${sessionScope.cloud.fullName}</h1>-->
         <h3 style="color: red">${requestScope.error}</h3>
         <div class ='view'>
                <a href="MainController?action=Logout">Logout</a>   
                <a href="viewCart.jsp">View Cart</a>
         </div>
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
                        <th></th>
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
<div class ="mess">    
    <%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
</div>
    </body>
</html>
