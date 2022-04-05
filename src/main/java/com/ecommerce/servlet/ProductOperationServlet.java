package com.ecommerce.servlet;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Product;
import com.ecommerce.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");

            if (op.trim().equals("addCategory")) {
                //add category
                String catTitle = request.getParameter("catTitle");
                String catDescription = request.getParameter("catDescription");

                Category cat = new Category();
                cat.setCatTitle(catTitle);
                cat.setCatDescription(catDescription);

                //category databse save
                CategoryDAO categoryDao = new CategoryDAO(FactoryProvider.getFactory());

                int catId = categoryDao.saveCategory(cat);
//                out.println("Saved.....");
                HttpSession session = request.getSession();
                session.setAttribute("message", "A New Category has been saved with category Id: " + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addProduct")) {
                //add Product
                String pName = request.getParameter("pName");
                String pDescription = request.getParameter("pDescription");
                double pPrice = Double.valueOf(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int cId = Integer.parseInt(request.getParameter("pCategory"));

                Part part = request.getPart("pPhoto");

                Product product = new Product();
                product.setpName(pName);
                product.setpDescription(pDescription);
                product.setpPrice(pPrice);
                product.setpDiscount(pDiscount);
                product.setpQuantity(pQuantity);
                product.setpPhoto(part.getSubmittedFileName());

                CategoryDAO cDao = new CategoryDAO(FactoryProvider.getFactory());

                Category categoryById = cDao.getCategoryById(cId);

                product.setpCategory(categoryById);

                ProductDAO pDao = new ProductDAO(FactoryProvider.getFactory());
                int pId = pDao.saveProduct(product);

//                pic upload
//                1. pic path
                String path = request.getRealPath("/") + "image" + File.separator + "products" + File.separator + part.getSubmittedFileName();

//                System.out.println(path);
                try {

//                  2. file output stream
                    FileOutputStream fos = new FileOutputStream(path);

//                3. data read from file input stream:
                    InputStream inputStream = part.getInputStream();

//                4. reading data:
                    byte[] data = new byte[inputStream.available()];

                    inputStream.read(data);

//                5. write data:
                    fos.write(data);

//                6. close file output and input stream: 
                    fos.close();
//                    inputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }

//                out.println("product saved.....");
                HttpSession session = request.getSession();
                session.setAttribute("message", "A New Product has been saved with product Id: " + pId);
                response.sendRedirect("admin.jsp");
                return;

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
