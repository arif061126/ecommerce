package com.ecommerce.servlet;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.entity.User;
import com.ecommerce.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String userEmail = request.getParameter("userEmail");
            String userPassword = request.getParameter("userPassword");

            //authencating user:
            UserDAO userDAO = new UserDAO(FactoryProvider.getFactory());
            User user = userDAO.getUserByEmailAndPassword(userEmail, userPassword);

//            System.out.println(user);
            HttpSession hs = request.getSession();

            if (user == null) {
//                out.println("<h3>Invalid User Name or Password!!!</h3>");
                hs.setAttribute("message", "Invalid User Name or Password!!!");
                response.sendRedirect("login.jsp");
                return;
            } else {
                hs.setAttribute("current-user", user);
                
                if(user.getUserType().equals("admin")){
                    response.sendRedirect("admin.jsp");
                    
                }else if(user.getUserType().equals("normal")){
                    response.sendRedirect("normal.jsp");
                    
                }else{
                    out.println("<h1>You are not admin or normal user!</h1>");
                }
                
//                out.println("<h2>Welcome " + user.getUserName() + " to E-Commerse World.</h2>");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
