<%-- 
    Document   : success
    Created on : Jul 20, 2023, 10:38:08 PM
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
        <h2>Submit Order successful</h2>
        <h2>Thank you</h2>

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
    <div style="display: flex; justify-content: center;">
    <a href="Foodlist.jsp">Back</a>
    </div>
    </table>
