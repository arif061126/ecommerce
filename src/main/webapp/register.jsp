<%-- 
    Document   : register
    Created on : 21 Feb 2022, 14:55:21
    Author     : arif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_js_css.jsp"%>
        <title>Register</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="message.jsp" %>
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img class="img-fluid" src="image/user_icon.png" style="width: 100px;"/>
                            </div>
                            <h3 class="text text-center mb-5">Sign up for New User!</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" class="form-control" id="name" name="userName" placeholder="Enter Name" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">User E-mail</label>
                                    <input type="email" class="form-control" id="email" name="userEmail" placeholder="user@email.com" required/>
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input type="password" class="form-control" id="password" name="userPassword" placeholder="Enter Password" required/>
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input type="number" class="form-control" id="phone" name="userPhone" placeholder="Enter Phone Number" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">User Address</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea" name="userAddress" rows="3" required></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    
    <%@include file="footer.jsp" %>
    
</html>
