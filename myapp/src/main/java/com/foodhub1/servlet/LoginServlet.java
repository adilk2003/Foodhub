package com.foodhub1.servlet;

import java.io.IOException;

import com.foodhub1.dao.UserDAO;
import com.foodhub1.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.authenticate(email);
        
 
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            System.out.println(user.getPassword());
            if(password.equals(user.getPassword())) {
            	response.sendRedirect("home.jsp");
            }else {
            	response.sendRedirect("incorrect-password.jsp");
            }
        } else {
            	response.sendRedirect("user-not-found.jsp");
            }
        }
    }

