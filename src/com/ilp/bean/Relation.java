package com.ilp.bean;

public class Relation {
	
private int productId;
private int centerId;
private int productQuantity;
private int orderedQuantity;

public int getProductId() {
	return productId;
}
public void setProductId(int productId) {
	this.productId = productId;
}
public int getCenterId() {
	return centerId;
}
public void setCenterId(int centerId) {
	this.centerId = centerId;
}
public int getProductQuantity() {
	return productQuantity;
}
public void setProductQuantity(int productQuantity) {
	this.productQuantity = productQuantity;
}
public int getOrderedQuantity() {
	return orderedQuantity;
}
public void setOrderedQuantity(int orderedQuantity) {
	this.orderedQuantity = orderedQuantity;
}
public Relation(int productId, int centerId, int productQuantity,
		int orderedQuantity) {
	super();
	this.productId = productId;
	this.centerId = centerId;
	this.productQuantity = productQuantity;
	this.orderedQuantity = orderedQuantity;
}


}
