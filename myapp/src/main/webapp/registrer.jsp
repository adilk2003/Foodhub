<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodHub - Create Account</title>
<link rel="stylesheet" href="register.css">
</head>
<body>
	<div class="container">
		<div class="form-side">
			<div class="form-container">
				<div class="logo">
					<img src="logo.png" alt="FoodHub Logo"> <span>FoodHub</span>
				</div>

				<h1>Create an account</h1>
				<p class="subtitle">Get started with FoodHub today</p>

				<form action="register" method="post">
					<div class="name-fields">
						<div class="form-group">
							<label for="firstname">First name</label> <input type="text"
								id="firstname" placeholder="Adil" name="firstname">
						</div>
						<div class="form-group">
							<label for="lastname">Last name</label> <input type="text"
								id="lastname" placeholder="k" name="lastname">
						</div>
					</div>

					<div class="form-group">
						<label for="email">Email address</label> <input type="email"
							id="email" placeholder="adil@gmail.com" name="email">
					</div>

					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							id="password" placeholder="Create a password" name="password">
					</div>

					<div class="form-group">
						<label for="confirm-password">Confirm Password</label> <input
							type="password" id="confirm-password"
							placeholder="Confirm your password" name="confirmpassword">
					</div>
					<button type="submit">Create account</button>
				</form>

				<p class="sign-in">
					Already have an account? <a href="login.jsp">Sign in</a>
				</p>
			</div>
		</div>
		<div class="image-side"></div>
	</div>
</body>
</html>