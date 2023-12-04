<%-- 
    Document   : viewCart
    Created on : Jul 20, 2023, 2:36:42 AM
    Author     : min
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
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
            margin-top: 30px;
            color: black;
        }

        table {
            width: 80%;
            margin: 30px auto;
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
            background-color: antiquewhite;
            color: black;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #e3e3e3;
        }

        a {
            display: inline-block;
            text-align: center;
            margin: 20px auto;
            text-decoration: none;
            color: #fff;
            background-color: gray;
            padding: 12px 24px;
            border-radius: 5px;
            transition: background-color 0.2s ease;
        }/*

        a:hover {
            background-color: #0056b3;
        }*/

        h2 {
            text-align: center;
            color: #007bff;
            margin-top: 30px;
        }

        .total-container {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
    </head>
    <body>
        <h1>Your cart</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>                    
                </tr>         
            </thead>
        <tbody>
            <c:forEach var="i" items="${sessionScope.CART.getCart().values()}" varStatus="count">
            <form action="MainController">
                <c:set var="total" value = "${total + (i.quantity * i.price)}" />
                <tr>
                    <td>${count.count}</td>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>${i.description}</td>
                    <td>${i.price}</td>
                    <td>${i.quantity}</td>
                    <td>${i.quantity * i.price}</td>
                    <td>
                        <input type="hidden" name="id" value="${i.id}"/>
                        <input type="submit" value="Remove" name="action"/>
                    </td>
                </tr>
            </form>
            </c:forEach>
        </tbody>
    </table>
    <h1>Total: ${total} VNĐ</h1>
    <div style="display: flex; justify-content: center;">
    <a href="Foodlist.jsp">Add more</a>
    </div>
    <div style="display: flex; justify-content: center;">
    <a href="success.jsp">Submit Order</a>
    </div>
</body>
</html>
