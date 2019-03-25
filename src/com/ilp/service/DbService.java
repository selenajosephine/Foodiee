package com.ilp.service;

import java.util.HashMap;

import com.ilp.Dao.OrderDbManage;



public class DbService {

	

	public boolean placeOrderDb(
			HashMap<Integer, Integer> productMap, int centerId,long customerId,String paymentType) {
		OrderDbManage orderManage = new OrderDbManage();
		boolean flag = orderManage.placeOrder(productMap,centerId,customerId, paymentType);
		return flag;
		
	}

}
