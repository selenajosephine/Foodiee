package com.ilp.bean;

public class CartItem {

	private int productId;
	private int quantity;
	private long customerId;
	private String productName;
	private double price;

	public CartItem() {
		super();
	}

	public CartItem(int productId, int quantity, long customerId, String productName) {
		super();
		this.productId = productId;
		this.quantity = quantity;
		this.customerId = customerId;
		this.productName = productName;
	}

	public CartItem(int productId, int quantity, long customerId, String productName, double price) {
		super();
		this.productId = productId;
		this.quantity = quantity;
		this.customerId = customerId;
		this.productName = productName;
		this.price = price;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public void setquantity(int quantity) {
		this.quantity = quantity;
	}

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartItem [productId=" + productId + ", quantity=" + quantity + ", customerId=" + customerId
				+ ", productName=" + productName + "]";
	}

}
