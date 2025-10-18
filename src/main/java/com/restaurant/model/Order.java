package com.restaurant.model;

public class Order {
	private String username;
    private String itemName;
    private int quantity;
    private String address;
    
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String username, String itemName, int quantity, String address) {
		super();
		this.username = username;
		this.itemName = itemName;
		this.quantity = quantity;
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
    
}
