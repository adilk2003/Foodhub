package com.foodhub1.servlet;

import java.io.IOException;

import com.foodhub1.dao.UserDAO;
import com.foodhub1.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmpassword");

		// Check if passwords match
		if (!password.equals(confirmPassword)) {
			response.sendRedirect("passwordmismatch.html");
			return;
		}

		// Create User Object
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPassword(password);

		// Register User
		if (userDAO.registerUser(user)!=0) {
			response.sendRedirect("login.jsp?registered=true");
		} else {
			response.sendRedirect("registrer.jsp?error=true");
		}
	}
}
