<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivery Information</title>
    <link rel="stylesheet" href="Form.css">
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
            <h1>Delivery Information</h1>
        <form action="order_complete.jsp" method="POST" class="delivery-form">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required placeholder="Enter your full name">
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number:</label>
                <input type="text" id="mobile" name="mobile" required placeholder="Enter your mobile number">
            </div>

            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email address">
            </div>

            <div class="form-group">
                <label for="address">Delivery Address:</label>
                <textarea id="address" name="address" required placeholder="Enter your delivery address"></textarea>
            </div>

            <div class="form-group">
                <label for="paymentType">Payment Type:</label>
                <select id="paymentType" name="paymentType" required>
                    <option value="creditCard">Credit Card</option>
                    <option value="paypal">PayPal</option>
                    <option value="cashOnDelivery">Cash on Delivery</option>
                </select>
            </div>


            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </main>
</body>
</html>
