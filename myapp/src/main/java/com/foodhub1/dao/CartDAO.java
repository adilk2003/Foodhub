package com.foodhub1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodhub1.model.CartItem;
import com.foodhub1.util.DatabaseUtil;

public class CartDAO {
    public void addToCart(int userId, int itemId, int quantity) {
        try (Connection con = DatabaseUtil.getConnection()) {
            String query = "INSERT INTO cart (user_id, item_id, quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantity = quantity + ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, userId);
                ps.setInt(2, itemId);
                ps.setInt(3, quantity);
                ps.setInt(4, quantity);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<CartItem> getCartItems(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        try (Connection con = DatabaseUtil.getConnection()) {
            String query = "SELECT c.cart_id, c.user_id, c.item_id, c.quantity, m.name, m.price FROM cart c JOIN menu_items m ON c.item_id = m.item_id WHERE c.user_id = ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        cartItems.add(new CartItem(rs.getInt("cart_id"), rs.getInt("user_id"), rs.getInt("item_id"), rs.getInt("quantity"), rs.getString("name"), rs.getDouble("price")));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public void updateCartItem(int userId, int itemId, int quantity) {
        try (Connection con = DatabaseUtil.getConnection()) {
            String query = "UPDATE cart SET quantity = ? WHERE user_id = ? AND item_id = ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, quantity);
                ps.setInt(2, userId);
                ps.setInt(3, itemId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeCartItem(int userId, int itemId) {
        try (Connection con = DatabaseUtil.getConnection()) {
            String query = "DELETE FROM cart WHERE user_id = ? AND item_id = ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, userId);
                ps.setInt(2, itemId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
