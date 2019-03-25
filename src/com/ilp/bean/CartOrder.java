package com.ilp.bean;

import java.util.HashMap;

public class CartOrder {
private long customerId;
private HashMap<Integer,Integer> productQuantity;
private int centerId;
public long getCustomerId() {
	return customerId;
}
public void setCustomerId(int customerId) {
	this.customerId = customerId;
}
public HashMap<Integer, Integer> getProductQuantity() {
	return productQuantity;
}
public void setProductQuantity(HashMap<Integer, Integer> productQuantity) {
	this.productQuantity = productQuantity;
}
public int getCenterId() {
	return centerId;
}
public void setCenterId(int centerId) {
	this.centerId = centerId;
}
public CartOrder(long customerId, HashMap<Integer, Integer> productQuantity,
		int centerId) {
	super();
	this.customerId = customerId;
	this.productQuantity = productQuantity;
	this.centerId = centerId;
}
@Override
public String toString() {
	return "CartOrder [customerId=" + customerId + ", productQuantity="
			+ productQuantity + ", centerId=" + centerId + "]";
}
}
