<%-- 
    Document   : admin
    Created on : 21 Feb 2022, 22:39:47
    Author     : arif
--%>

<%@page import="com.ecommerce.dao.UserDAO"%>
<%@page import="com.ecommerce.entity.Product"%>
<%@page import="com.ecommerce.dao.ProductDAO"%>
<%@page import="com.ecommerce.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="com.ecommerce.entity.User"%>
<%

    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "Please login first!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().trim().equals("normal")) {
            session.setAttribute("message", "You can not access this page!<br>Only Admin has right to access this page, Sorry!");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%    
    
    CategoryDAO catDao = new CategoryDAO(FactoryProvider.getFactory());
    List<Category> list = catDao.getCategory();
    
    ProductDAO pDao=new ProductDAO(FactoryProvider.getFactory());
    List<Product> pList =pDao.getProducts();
    
    UserDAO uDao=new UserDAO(FactoryProvider.getFactory());
    List<User> uList=uDao.getUsers();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_js_css.jsp"%>

        <title>E-Commerce: Admin Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container container-admin" id="admin">

            <div class="container-fluid mt-2">
                <%@include file="message.jsp" %>
            </div>

            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/users-avatar.png" width="100px" alt="users"/>
                            </div>
                            <h1 class="text text-center text-success"><%= uList.size() %></h1>
                            <a href="user.jsp" style="text-decoration: none;color: #689f38;"><h1 class="text text-center text-uppercase">Users</h1></a>         
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/categories.png" width="100px" alt="users"/>
                            </div>
                            <h1 class="text text-center text-warning"><%= list.size() %></h1>
                            <a href="index.jsp" style="text-decoration: none;color: #689f38;"><h1 class="text text-center text-uppercase">Categories</h1></a>         
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/new-product.png" width="100px" alt="users"/>
                            </div>
                            <h1 class="text text-center text-danger"><%= pList.size() %></h1>
                            <a href="index.jsp" style="text-decoration: none;color: #ef6c00;"><h1 class="text text-center text-uppercase">Products</h1></a>         
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-Modal">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/categories1.png" width="100px" alt="users"/>
                            </div>
                            <p class="text text-center my-3">Click to +</p>
                            <h1 class="text text-center">Add Category</h1>         
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-Modal">
                        <div class="card-body">
                            <div class="container text-center">
                                <img class="img-fluid rounded-circle" src="image/box.png" width="100px" alt="users"/>
                            </div>
                            <p class="text text-center my-3">Click to +</p>
                            <h1 class="text text-center">Add Product</h1>         
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--start cat modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category details:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addCategory" />

                            <div class="form-group">
                                <input class="form-control" type="text" name="catTitle" placeholder="Enter Category Title" required />
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" id="catDescription" name="catDescription" rows="5" placeholder="Enter Category Description" required></textarea>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-outline-primary text-center">Add Category</button>
                                <button type="reset" class="btn btn-outline-success">Reset</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end of cat modal-->

        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--start of product modal-->

        <div class="modal fade" id="add-product-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product details:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addProduct" />

                            <div class="form-group">
                                <input class="form-control" type="text" name="pName" placeholder="Enter Product Name" required />
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" id="pDescription" name="pDescription" rows="5" placeholder="Enter Product Description" required></textarea>
                            </div>

                            <div class="form-group">
                                <input class="form-control" type="number" name="pPrice" placeholder="Enter Product Price" required />
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="number" name="pDiscount" placeholder="Enter Product Discount" required />
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="number" name="pQuantity" placeholder="Enter Product Quantity" required />
                            </div>



                            <div class="form-group">
                                <!--<input class="form-control" type="text" name="pCategory" placeholder="Enter Product Category" required />-->
                                <select class="form-control" name="pCategory">

                                    <%
                                        for (Category c : list) {

                                    %>
                                    <option value="<%=c.getCatId()%>"><%=c.getCatTitle()%></option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>



                            <div class="form-group">
                                <label for="pPhoto">Insert Product image: </label><br>
                                <input class="form-control" id="pPhoto" type="file" name="pPhoto" />
                            </div>
                            <div class="form-group text-center">
                                <button type="submit"  class="btn btn-outline-primary text-center">Add Product</button>
                                <button type="reset" class="btn btn-outline-success">Reset</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end of product modal-->

        <%@include file="cart.jsp" %>

    </body>
    
    <%@include file="footer.jsp" %>
    
</html>
