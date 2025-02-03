<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.foodhub1.model.*, com.foodhub1.dao.*" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    CartDAO cartDAO = new CartDAO();
    List<CartItem> cartItems = cartDAO.getCartItems(user.getId());
    double totalAmount = 0.0;
    for (CartItem item : cartItems) {
        totalAmount += item.getPrice() * item.getQuantity();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart - FoodHub</title>
    <link rel="stylesheet" href="cart.css">
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

    <main>
        <h1>Your Cart</h1>
        <table>
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <% for (CartItem item : cartItems) { %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td>$<%= String.format("%.2f", item.getPrice()) %></td>
                    <td>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
                            <button type="submit">Update</button>
                        </form>
                    </td>
                    <td>$<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></td>
                    <td>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <button type="submit">Remove</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
        <h2>Total: $<%= String.format("%.2f", totalAmount) %></h2>
        <form action="Form.jsp" method="post">
            <button type="submit">Checkout</button>
        </form>
    </main>
</body>
</html>
