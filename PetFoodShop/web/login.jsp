<%-- 
    Document   : login
    Created on : Jul 19, 2023, 12:48:08 AM
    Author     : min
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="stylein.css" type="text/css" />
</head>
<body>    
    <div class="login-container" >        
            <h2>Login Form</h2>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="userID">Username:  
                    <input type="text" name="userID" required>
                    </label>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required>
                </div>
                <p class="error-message">${mess}</p>
                <button class="submit-btn" type="submit" name="action" value="Login">Login</button>
            </form>
            <a class="register-link" href="registration.jsp">Register a new account</a>         
    </div>
      

    
    </body>
</html>
