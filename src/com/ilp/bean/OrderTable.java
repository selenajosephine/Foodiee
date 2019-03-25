package com.ilp.bean;

import java.util.Date;

public class OrderTable {

	private String orderId;
	private int customerId;
	private String paymentType;
	private Date orderDate;
	private String orderStatus;
	private double totalAmount;
	private int centerId;

	public String getOrderId() {
		return orderId;
	}

	

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public int getCenterId() {
		return centerId;
	}

	public void setCenterId(int centerId) {
		this.centerId = centerId;
	}
	
	public OrderTable(String orderId, int customerId, String paymentType,
			Date orderDate, String orderStatus, double totalAmount, int centerId) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.paymentType = paymentType;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.totalAmount = totalAmount;
		this.centerId = centerId;
	}
}
