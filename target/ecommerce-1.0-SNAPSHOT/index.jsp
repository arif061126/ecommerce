<%-- 
    Document   : index
    Created on : 21 Feb 2022, 12:12:56
    Author     : arif
--%>

<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entity.Category"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entity.Product"%>
<%@page import="com.ecommerce.dao.ProductDAO"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="all_js_css.jsp"%>


        <title>E-Commerce: Home</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="row mt-3 mx-2">
            <div class="col-md-2">

                <%                    
                    Category category = new Category();

                    String cat = request.getParameter("category");
                    CategoryDAO cDao = new CategoryDAO(FactoryProvider.getFactory());

                    List<Category> cList = cDao.getCategory();

                    ProductDAO pDao = new ProductDAO(FactoryProvider.getFactory());
                    List<Product> list = pDao.getProducts();

                    if (cat == null || cat.trim().equals("all")) {
                        list = pDao.getProducts();

                    } else {
                        int catId = Integer.parseInt(cat.trim());
                        list = pDao.getProductsByCategory(catId);
                    }


                %>

                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center active">
                        <a href="index.jsp?category=all" style="text-decoration: none; color: white;">
                            Product Category 
                            <span class="badge badge-primary badge-pill active"><%= pDao.getProducts().size()%></span>
                        </a>
                    </li>

                    <%
                        for (Category c : cList) {
                    %>

                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="index.jsp?category=<%= c.getCatId()%>" style="text-decoration: none; color: #689f38;"><%= c.getCatTitle()%>

                            <span class="badge ml-5 badge-primary badge-pill"> <%=pDao.getProductsByCategory(c.getCatId()).size()%> </span>

                        </a>
                    </li>


                    <%
                        }


                    %>



                </ul>

            </div>

            <div class="col-md-10">

                <%
                %>

                <h1>Number of Products: <%=list.size()%></h1>

                <div class="card-columns mt-5">

                    <%
                        for (Product p : list) {
                    %>


                    <div class="card product-card">
                        <div class="container text-center">
                            <img class="card-img-top p-2" style="max-height: 250px; max-width: 100%; width: auto;" src="image/products/<%=p.getpPhoto()%>" alt="Card image cap">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title"><%=p.getpName()%></h6>
                            <p class="card-content"><%=Helper.get10Words(p.getpDescription())%></p>
                        </div>
                        <div class="card-footer text-center">
                            <button class="btn custom-bg text-white" onclick="addToCart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterDiscount()%>, <%= p.getpQuantity()%>)">Add to Cart</button>
                            <button class="btn btn-info text-white">&#2547;&nbsp;<%= p.getPriceAfterDiscount()%>/- <span class="text-warning discount-lebel">&#2547;<%= p.getpPrice()%> &#2547; <%= p.getpDiscount()%> off</span></button>
                        </div>

                    </div>



                    <%
                        }

                        if (list.size() == 0) {

                            out.println("<h4>Sorry! No Item in this Category.</h4>");

                        }
                    %>

                </div>
            </div>

        </div>
                    
        <%@include file="cart.jsp" %>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
