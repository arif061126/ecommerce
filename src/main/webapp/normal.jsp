<%-- 
    Document   : normal
    Created on : 21 Feb 2022, 22:40:56
    Author     : arif
--%>

<%@page import="com.ecommerce.dao.UserDAO"%>
<%@page import="com.ecommerce.entity.Product"%>
<%@page import="com.ecommerce.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entity.Category"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.entity.User"%>
<%

    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "Please login first!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You can not access this page!");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%    CategoryDAO catDao = new CategoryDAO(FactoryProvider.getFactory());
    List<Category> list = catDao.getCategory();

    ProductDAO pDao = new ProductDAO(FactoryProvider.getFactory());
    List<Product> pList = pDao.getProducts();

    UserDAO uDao = new UserDAO(FactoryProvider.getFactory());
    List<User> uList = uDao.getUsers();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_js_css.jsp"%>
        <title>E-Commerce: General Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>


        <div class="container">
            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card users">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/users-avatar.png" width="100px" alt="users"/>
                            </div>
                            <h1 class="text text-center text-success"><%= uList.size()%></h1>
                            <h1 class="text text-center text-uppercase">Users</h1>         
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card categories">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/categories.png" width="100px" alt="users"/>
                            </div>
                            <h1 class="text text-center text-warning"><%= list.size()%></h1>
                            <a href="index.jsp" style="text-decoration: none;color: #689f38;"><h1 class="text text-center text-uppercase">Categories</h1></a>         
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card products">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/new-product.png" width="100px" alt="users"/>
                            </div>
                            <h1 class="text text-center text-danger"><%= pList.size()%></h1>
                            <a href="index.jsp" style="text-decoration: none;color: #ef6c00;"><h1 class="text text-center text-uppercase">Products</h1></a>         
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <%@include file="cart.jsp" %>
    </body>
    
    <%@include file="footer.jsp" %>
    
</html>
