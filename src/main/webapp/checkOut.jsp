<%-- 
    Document   : checkOut
    Created on : 26 Feb 2022, 04:56:14
    Author     : arif
--%>

<%@page import="com.ecommerce.entity.User"%>
<%

    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "Please login first to check out!");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_js_css.jsp"%>
        <title>E-Commerce: Check out</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="container">
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h3>Your Selected Products</h3>
                        </div>
                        <div class="card-body">
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <form>
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input value="<%= user.getUserName() %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="Max Mustermann" required>
                        </div>

                        <div class="form-group">
                            <label for="email">User E-mail</label>
                            <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="user@user.com" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="contact">Telephone</label>
                            <input value="<%= user.getUserPhone() %>" type="number" class="form-control" id="contact" placeholder="1234567890" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Billing Address</label>
                            <input value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea" name="userAddress" style="height: 100px;" rows="3" required />
                        </div>
                        
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Click before to check out</label>
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-success">Check Out</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="cart.jsp" %>
    </body>
    
    <%@include file="footer.jsp" %>
    
</html>
