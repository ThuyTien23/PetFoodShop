/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author min
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SIGNUP = "Signup";
    private static final String SIGNUP_CONTROLLER = "RegistrationController"; 
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";    
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController"; 
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH_USER = "Search_Food";
    private static final String SEARCH_CONTROLLER_USER = "SearchControllerForUser";
    private static final String ADD_CART = "Add to your cart";
    private static final String ADD_CART_CONTROLLER = "AddCartController";
 //   private static final String VIEW = "ViewCart";
    private static final String VIEW_PAGE = "viewCart.jsp";
    private static final String SEARCH_ACC = "Search_acc";
    private static final String SEARCH_ACC_PAGE = "SearchUser";
 
 //   private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveItem";
//    private static final String CHANGE = "Change";
//    private static final String CHANGE_CONTROLLER = "ChangeItem";
//    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCH_CONTROLLER_USER;
            } else if (ADD_CART.equals(action)) {
                url = ADD_CART_CONTROLLER;
            } else if (action.equals("View Cart")) {
                url = VIEW_PAGE;
            } else if (SEARCH_ACC.equals(action)) {
                url = SEARCH_ACC_PAGE;
//            } else if (CHANGE.equals(action)) {
//                url = CHANGE_CONTROLLER;
            } else if (action.equals("Remove")) {
                url = REMOVE_CONTROLLER;
            } else {
                request.setAttribute("ERROR", "Your action is not supported!");
            }
        } catch (Exception ex) {
            log("Error at: MainController" + ex.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
