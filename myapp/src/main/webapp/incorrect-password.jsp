<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodHub Login</title>
<link rel="stylesheet" href="incorrectpassword.css">
</head>
<body>
	<div class="container">
		<div class="left">
			<div class="logo">
				<img src="logo.png" alt="Logo"> FoodHub
			</div>
			<div class="welcome-text">Welcome back</div>
			<div class="subtitle">Sign in to your account to continue</div>
			<form action="login" method="post">
				<label for="email">Email address</label> <input type="email"
					id="email" placeholder="Enter your email" name="email"> <label
					for="password">Password</label> <input type="password"
					id="password" placeholder="Enter your password" name="password">
				<p class="error-message">Incorrect password. Please try again.</p>
				<div class="actions">
					<button class="sign-in-button">Sign in</button>
					<a href="forgetpassword.html">Forgot password?</a>
				</div>

				<div class="sign-up-link">
					Don't have an account? <a href="registrer.jsp">Sign up</a>
				</div>
			</form>
		</div>
		<div class="right"></div>
	</div>
</body>
</html>
