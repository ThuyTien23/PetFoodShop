<%-- 
    Document   : addlist
    Created on : Jul 19, 2023, 2:17:05 AM
    Author     : min
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD Page</title>
    
    <c:if test="${sessionScope.cloud.roleID != 'AD'}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>
        <c:set var="list" value="${sessionScope.listacc}"/>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            background-image:  url('images/backgrounglogin.jpg');
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        form input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        form button[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            color: red;
            margin-top: 10px;
        }

        a {
            display: inline-block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 8px 16px;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body> 
        <form action="MainController" method="POST">
            Food's ID: <input name="FID" required> <br>
            Name: <input name="name" required> <br>
            Description: <input name="des" required> <br>
            Price: <input name="price" required> <br>
            Quantity: <input name="quantity" required> <br>
            <p style="color: red">${errorAdd} </p>
            <button type="submit" name="action" value="Add">Add Food</button>
            <a href="admin.jsp">Back</a>
        </form>
        

    </body>
</html>
