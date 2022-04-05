package com.ecommerce.servlet;

import com.ecommerce.entity.User;
import com.ecommerce.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author arif
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                
                String userName=request.getParameter("userName");
                String userEmail=request.getParameter("userEmail");
                String userPassword=request.getParameter("userPassword");
                String userPhone=request.getParameter("userPhone");
                String userAddress=request.getParameter("userAddress");
                
                User user = new User(userName, userEmail, userPassword, userPhone, "default.png", userAddress, "normal");
                
                Session s=FactoryProvider.getFactory().openSession();
                Transaction t = s.beginTransaction();
                
                int userId=(int) s.save(user);
                
                t.commit();
                s.close();
                
//                out.println("Successfully saved....");
//                out.println(userId);
                
                HttpSession hs=request.getSession();
                hs.setAttribute("message", "User Registration successful.");
                
                response.sendRedirect("register.jsp");
                return;

                
            } catch (Exception e) {
                e.printStackTrace();
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
