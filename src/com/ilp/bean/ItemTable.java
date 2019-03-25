package com.ilp.bean;

public class ItemTable {
	

private String orderId;
private int productId;
private int orderQuantity;

public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public int getProductId() {
	return productId;
}
public void setProductId(int productId) {
	this.productId = productId;
}
public int getOrderQuantity() {
	return orderQuantity;
}
public void setOrderQuantity(int orderQuantity) {
	this.orderQuantity = orderQuantity;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
private int quantity;
public ItemTable(String orderId, int productId, int orderQuantity, int quantity) {
	super();
	this.orderId = orderId;
	this.productId = productId;
	this.orderQuantity = orderQuantity;
	this.quantity = quantity;
}





}
