<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.foodhub1.model.*, com.foodhub1.dao.*" %>
<%
    int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
    MenuItemDAO menuItemDAO = new MenuItemDAO();
    RestaurantDAO restaurantDAO = new RestaurantDAO();
    
    List<MenuItem> menuItems = menuItemDAO.getMenuItemsByRestaurantId(restaurantId);
    Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
    
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
    <title><%= restaurant.getName() %> Menu - FoodHub</title>
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
        <div class="restaurant-header">
            <h1><%= restaurant.getName() %></h1>
            <p><%= restaurant.getDescription() %></p>
            <div class="restaurant-rating">★ <%= String.format("%.1f", restaurant.getRating()) %></div>
        </div>

        <section class="menu-grid">
            <% for (MenuItem item : menuItems) { %>
                <div class="menu-card">
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>" class="menu-image">
                    <div class="menu-info">
                        <h2 class="menu-name"><%= item.getName() %></h2>
                        <p class="menu-description"><%= item.getDescription() %></p>
                        <p class="menu-price">$<%= String.format("%.2f", item.getPrice()) %></p>
                        <div class="menu-rating">★ <%= String.format("%.1f", item.getRating()) %></div>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <input type="hidden" name="quantity" value="1">
                            <button type="submit" class="btn">Add to Cart</button>
                        </form>
                    </div>
                </div>
            <% } %>
        </section>
    </main>
</body>
</html>