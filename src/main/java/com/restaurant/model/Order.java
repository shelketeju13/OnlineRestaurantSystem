package com.restaurant.model;

public class Order {
	private int id;
	private String username;
    private String itemName;
    private int quantity;
    private String address;
    private double price;
    private String status;
    
	public Order(String username, String itemName, int quantity, String address) {
		super();
		this.username = username;
		this.itemName = itemName;
		this.quantity = quantity;
		this.address = address;
	}


	public Order(String username, String itemName, int quantity, String address, double price) {
		super();
		this.username = username;
		this.itemName = itemName;
		this.quantity = quantity;
		this.address = address;
		this.price = price;
	}


	public Order(int id, String username, String itemName, int quantity, String address, double totalPrice, String status) {
        this.id = id;
        this.username = username;
        this.itemName = itemName;
        this.quantity = quantity;
        this.address = address;
        this.price = totalPrice;
        this.status = status;
    }
	
	public int getId() {
		return id; 
	}
	
	
    public void setId(int id) {
    	this.id = id; 
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


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}
	
    
	public String getStatus() { 
		return status;
	}
	
	
    public void setStatus(String status) { 
    	this.status = status; 
    }
}