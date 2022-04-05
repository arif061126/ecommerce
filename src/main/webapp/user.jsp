<%-- 
    Document   : user
    Created on : 26 Feb 2022, 14:22:00
    Author     : arif
--%>

<%@page import="com.ecommerce.dao.UserDAO"%>

<%

    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "Please login first!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You can not access this page!<br>Only Admin has right to access this page, Sorry!");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%

    UserDAO uDao = new UserDAO(FactoryProvider.getFactory());
    List<User> uList = uDao.getUsers();


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_js_css.jsp"%>
        <title>E-Commerce: Users</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>


        <div class="row m-5">
            
            <div class="col-md-12">      
            <div class="card-columns">        
                    
                    <%                
                        
                        for (User u : uList) {
                            
                    %>
                    
                    <div class="container">
                    
                    <div id="accordion">

                    <div class="card m-2">

                        <div class="card-header head bg-info text-white" id="headingOne">
                            <h5 class="mb-0 text-center font-weight-bold">
                                <button class="btn text-white bg-info text-center font-weight-bold" data-toggle="collapse" data-target="#collapse<%= u.getUserid()%>" aria-expanded="true" aria-controls="collapseOne">
                                    User <%= u.getUserid()%>: <span><%= u.getUserName()%></span>
                                </button>
                            </h5>
                        </div>

                        <div id="collapse<%= u.getUserid()%>" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">

                                <form>
                                    
                                    <div class="form-group text-center">
                                        <h3>User Type: <%= u.getUserType() %></h3>
                                    </div>
                                    
                                    <div class="form-group text-center">
                                        <img src="image/<%= u.getUserPic() %>" width="auto" height="70px" alt="User photo"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">User E-mail</label>
                                        <input value="<%= u.getUserEmail()%>" type="email" class="form-control bg-dark text-warning" id="email" name="userEmail" disabled />
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">Telephone</label>
                                        <input value="<%= u.getUserPhone()%>" type="number" class="form-control bg-dark text-warning" id="phone" name="userPhone" disabled />
                                    </div>

                                    <div class="form-group">
                                        <label for="address">User Address</label>
                                        <input value="<%= u.getUserAddress()%>" type="text" class="form-control bg-dark text-warning" id="address" name="userAddress" disabled />
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <%
                }
            %>

        </div>
        </div>
        </div>

        <%@include file="cart.jsp" %>
    </body>
    
    <%@include file="footer.jsp" %>
    
</html>
