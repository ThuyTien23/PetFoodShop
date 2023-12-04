<%-- 
    Document   : registration
    Created on : Jul 19, 2023, 12:54:25 AM
    Author     : min
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" href="stylein.css" type="text/css" />
    </head>
    <body>
        <div class="login-container" >
            <h2>Registration</h2>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="userID">Username:  
                    <input type="text" name="userID" required>
                    </label>
                </div>
                <div class="form-group">
                    <label for="userID">FullName:</label>  
                    <input type="text" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="userID">Password:</label>  
                    <input type="text" name="password" required>
                </div>       
                <p style="color: #32CD32">${success}</p>
                <p style="color: red">${error}</p><br>
                <button class="submit-btn" type="submit" name="action" value="Signup">Sign Up</button>          
            </form>
                </br>
                <a href="login.jsp"  class="register-link">Back</button</a> 
        </div>
    </body>
</html>
