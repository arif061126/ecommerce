<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entity.Category"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDAO"%>
<%@page import="com.ecommerce.entity.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
//    User user2 = (User) session.getAttribute("admin");
    
    CategoryDAO cDao2=new CategoryDAO(FactoryProvider.getFactory());
    List<Category> list3=cDao2.getCategory();
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-light custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">E-Commerce</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Category
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                        
                        for(Category c:list3){
                            
                        %>
                        
                        <a href="index.jsp?category=<%= c.getCatId()%>" class="dropdown-item" style="text-decoration: none; color: #689f38;"><%= c.getCatTitle()%></a>
                        <!--<a class="dropdown-item" href="#"><%= c.getCatTitle() %></a>-->
                        <!--<div class="dropdown-divider"></div>-->
                        
                        <%
                            }
                        %>
                        
                    </div>
                </li>
                
            </ul>
            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" data-toggle="modal" data-target="#cart" href="#"><i class="fa fa-cart-arrow-down" style="font-size: 20px;"></i><span class="cart-items" style="color: #ffab00;"> (0)</span></a>
                </li>

                <%
                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%
                } else if (user1.getUserType().trim().equals("admin")){
                %>
                <li class="nav-item active">
                    <div class="container text-center">
                        <img src="image/<%= user1.getUserPic()%>" class="img img-fluid text-center" style="height: 30px; width: auto;"/>
                        <a class="nav-link" href="admin.jsp"><%= user1.getUserName()%></a>
                    </div>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <%

                    } else {
                %>
                
                <li class="nav-item active">
                    <div class="container text-center">
                        <img src="image/<%= user1.getUserPic()%>" class="img img-fluid text-center" style="height: 30px; width: auto;"/>
                        <a class="nav-link" href="normal.jsp"><%= user1.getUserName()%></a>
                    </div>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                
                <%
                    }
                %>
                
            </ul>


        </div>
    </div>
</nav>