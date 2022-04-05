<%-- 
    Document   : login
    Created on : 21 Feb 2022, 20:17:08
    Author     : arif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce: Login</title>
        <%@include file="all_js_css.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header custom-bg text-white text-center">
                            <h3>Please Login Here!</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="userEmail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="userPassword" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <a href="register.jsp">If not registered, click here.</a>
                                </div>
                                
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg">Login</button>
                                    <button type="reset" class="btn btn-secondary">Reset</button>
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
