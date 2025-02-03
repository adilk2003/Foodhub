package com.foodhub1.model;

public class CartItem {
    private int cartId;
    private int userId;
    private int itemId;
    private int quantity;
    private String name;
    private double price;
    
    public CartItem(int cartId, int userId, int itemId, int quantity, String name, double price) {
        this.cartId = cartId;
        this.userId = userId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.name = name;
        this.price = price;
    }

    public int getCartId() { return cartId; }
    public int getUserId() { return userId; }
    public int getItemId() { return itemId; }
    public int getQuantity() { return quantity; }
    public String getName() { return name; }
    public double getPrice() { return price; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
}