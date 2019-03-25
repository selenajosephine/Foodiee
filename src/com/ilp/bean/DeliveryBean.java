package com.ilp.bean;

public class DeliveryBean {
private String orderId;
private String productName;
private long customerId;
private double price;
private int quantity;
public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public long getCustomerId() {
	return customerId;
}
public void setCustomerId(long customerId) {
	this.customerId = customerId;
}
@Override
public String toString() {
	return "DeliveryBean [orderId=" + orderId + ", productName=" + productName
			+ ", customerId=" + customerId + ", price=" + price + ", quantity="
			+ quantity + "]";
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public DeliveryBean(String orderId, String productName, long customerId,
		double price, int quantity) {
	super();
	this.orderId = orderId;
	this.productName = productName;
	this.customerId = customerId;
	this.price = price;
	this.quantity = quantity;
}



}
