<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.foodhub1.model.*, com.foodhub1.dao.*" %>
<%
    RestaurantDAO restaurantDAO = new RestaurantDAO();
    List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - FoodHub</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo-container">
                    <img src="logo.png" alt="FoodHub Logo" class="logo">
                    <h1>FoodHub</h1>
                </div>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="login.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="container">
        <section class="restaurant-grid">
            <% for (Restaurant restaurant : restaurants) { %>
                <div class="restaurant-card">
                    <img src="<%= restaurant.getImageUrl() %>" alt="<%= restaurant.getName() %>" class="restaurant-image">
                    <div class="restaurant-info">
                        <h2 class="restaurant-name"><%= restaurant.getName() %></h2>
                        <p class="restaurant-description"><%= restaurant.getDescription() %></p>
                        <p class="restaurant-address"><%= restaurant.getAddress() %></p>
                        <div class="restaurant-rating">★ <%= String.format("%.1f", restaurant.getRating()) %></div>
                        <a href="menu.jsp?restaurantId=<%= restaurant.getRestaurantId() %>" class="btn">View Menu</a>
                    </div>
                </div>
            <% } %>
        </section>
    </main>
</body>
</html>