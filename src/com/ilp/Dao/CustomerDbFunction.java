package com.ilp.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ilp.bean.OrderTable;
import com.ilp.bean.Product;
import com.ilp.util.DBUtil;

public class CustomerDbFunction {

	/*
	 * display all orders of the customer for the vendor to deliver it
	 * 
	 */
	public ArrayList<OrderTable> getAllOrders(Long customerId) {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		ArrayList<OrderTable> customerOrderList = new ArrayList<OrderTable>();

		try {
			st = con.prepareStatement("select * from orderTable where customerId=? order by orderDate desc");
			st.setLong(1, customerId);
			set = st.executeQuery();
			while (set.next()) {
				OrderTable order = new OrderTable(set.getString(1), set.getInt(2), set.getString(3),
						set.getTimestamp(4), set.getString(5), set.getInt(6), set.getInt(7));
				customerOrderList.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return customerOrderList;
	}

	public ArrayList<Product> viewOrder(String orderId) {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		ArrayList<Product> viewOrderList = new ArrayList<Product>();

		try {
			st = con.prepareStatement(
					"select p.*,i.orderQuantity from productTable p, itemTable i where i.orderId=? and i.productId=p.product_id ");
			st.setString(1, orderId);
			set = st.executeQuery();
			while (set.next()) {
				Product p = new Product();
				p.setProductId(set.getInt("product_id"));
				p.setProductName(set.getString("product_name"));
				p.setPrice(set.getDouble("PRICE"));
				p.setCategory(set.getString("category"));
				p.setQuantity(set.getInt("orderQuantity"));
				viewOrderList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewOrderList;
	}

}
