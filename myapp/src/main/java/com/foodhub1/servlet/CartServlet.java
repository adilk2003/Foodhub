package com.foodhub1.servlet;

import java.io.IOException;

import com.foodhub1.dao.CartDAO;
import com.foodhub1.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int userId = user.getId();
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String action = request.getParameter("action");
        CartDAO cartDAO = new CartDAO();
        
        if ("add".equals(action)) {
            cartDAO.addToCart(userId, itemId, 1);
        } else if ("update".equals(action)) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cartDAO.updateCartItem(userId, itemId, quantity);
        } else if ("remove".equals(action)) {
            cartDAO.removeCartItem(userId, itemId);
        }
        
        response.sendRedirect("cart.jsp");
    }
}
