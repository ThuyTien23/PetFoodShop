/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PetFoodDAO;
import dto.PetFood;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author min
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         try {
            String id = request.getParameter("FID");
            String name = request.getParameter("name");
            String des = request.getParameter("des");
            Float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            PetFoodDAO dao = new PetFoodDAO();
            PetFood FName = dao.checkPetFoodByName(name);

            if(!id.matches("^F-\\d{3}$")){
                request.setAttribute("errorAdd", "Invalid ID format. Please use F-xxx format");
                request.getRequestDispatcher("addlist.jsp").forward(request, response);
            }
            
            if (FName != null) {
                request.setAttribute("errorAdd", "Name is duplicated");
                request.getRequestDispatcher("addlist.jsp").forward(request, response);
            } else {
                PetFood FID = dao.checkPetFoodByID(id);
                if (FID != null) {
                    request.setAttribute("errorAdd", "ID is duplicated");
                    request.getRequestDispatcher("addlist.jsp").forward(request, response);
                } else {
                    PetFoodDAO d = new PetFoodDAO();
                    d.InsertPetFood(id, name, des, price, quantity);
                    response.sendRedirect("admin.jsp");
                }
            }
        } catch (Exception e) {
        }
//        request.setCharacterEncoding("UTF-8");
//        String id = request.getParameter("id");
//        String name = request.getParameter("name");
//        String description = request.getParameter("description");
//        String price_raw = request.getParameter("price");
//        String quantity_raw = request.getParameter("quantity");
//        
//        float price;
//        int quantity;
//        PetFoodDAO d = new PetFoodDAO();
//        try {
//            price = Float.parseFloat(price_raw);
//            quantity = Integer.parseInt(quantity_raw);            
//            PetFood c = d.checkPetFoodByID(id);
//            if (c == null) {
//                PetFood ca = new PetFood(id, name, description, price, quantity);
//                d.InsertPetFood(id, name, description, price, quantity);
//                request.getRequestDispatcher("Foodlist.jsp").forward(request, response);
//            } else {
//                request.setAttribute("error", "ID EXISTED!!!");
//                request.getRequestDispatcher("Foodlist.jsp").forward(request, response);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
        
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
