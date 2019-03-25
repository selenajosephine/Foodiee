package com.ilp.Dao;

import java.rmi.server.UID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.ilp.util.DBUtil;

public class OrderDbManage {

	/*
	 * place order based gets hashmap of product id and quantity and
	 * centerid,customer id and payment type
	 */

	static String s;

	public void setOrderId(String s) {
		this.s = s;

	}

	public String getOrderId() {
		return this.s;
	}

	public boolean placeOrder(HashMap<Integer, Integer> productMap, int centerId, long customerId, String paymentType) {
		int i = 0;
		UID Id = new UID();// unique order Id for orders
		String orderId = Id.toString();
		setOrderId(orderId);

		double totalAmount = 0;
		boolean flag = false;

		Connection con = DBUtil.getConnection();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		PreparedStatement st2 = null;
		PreparedStatement st3 = null;
		for (Map.Entry<Integer, Integer> products : productMap.entrySet()) {
			double productPrice = OrderFunctions.getProductPrice(products.getKey());
			totalAmount = (productPrice * products.getValue()) + totalAmount;
			try {
				/*
				 * inserting into item table (with order id as identifier to each product added)
				 */
				st = con.prepareStatement("insert into itemTable values(?,?,?)");
				st.setString(1, orderId);
				st.setInt(2, products.getKey());
				st.setInt(3, products.getValue());
				boolean f = st.execute();
				if (f) {
					flag = false;
				} else {
					flag = true;
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
			try {

				/*
				 * updating productquantity and orderquantity in product relation table using
				 * product id and center id
				 */
				st1 = con.prepareStatement(
						"update productRelationTable set orderedQuantity=? where productId=? and centerId=?");
				int orderedQuantity = OrderFunctions.getOrderedQuantity(products.getKey(), centerId);

				st1.setInt(1, (orderedQuantity + products.getValue()));
				st1.setInt(2, products.getKey());
				st1.setInt(3, centerId);

				boolean f = st1.execute();
				if (f) {
					flag = false;
				} else {
					flag = true;
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		try {

			/*
			 * inserting into order table (new order placing)
			 */
			Date date = new Date();
			st2 = con.prepareStatement("insert into orderTable values(?,?,?,?,?,?,?)");
			st2.setString(1, orderId);
			st2.setLong(2, customerId);
			st2.setString(3, paymentType);
			st2.setTimestamp(4, new Timestamp(date.getTime()));
			st2.setString(5, "accepted");
			st2.setDouble(6, totalAmount);
			st2.setInt(7, centerId);
			boolean f = st2.execute();
			if (f) {
				flag = false;
			} else {
				flag = true;
			}

		} catch (SQLException e) {

			System.out.println(e);
		}
		try {
			st3 = con.prepareStatement("delete from CARTTABLE");
			boolean f = st3.execute();
			if (f) {
				flag = false;
			} else {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	/*
	 * delete order based on orderid in order table and item table and update the
	 * product relation table
	 */
	public boolean orderDelete(String orderId) {

		Connection con = null;
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		PreparedStatement st2 = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		HashMap<Integer, Integer> productMapTwo = new HashMap<Integer, Integer>();
		String status = OrderFunctions.getOrderStatus(orderId);
		if (status.equals("accepted")) {
			int centerId = OrderFunctions.getCenterId(orderId);
			productMapTwo = OrderFunctions.getProductMapItemTable(orderId);
			for (Map.Entry<Integer, Integer> products : productMapTwo.entrySet()) {
				try {
					st = con.prepareStatement(
							"update productRelationTable set orderedQuantity=? where productId=? and centerId=?");
					int orderedQuantity = OrderFunctions.getOrderedQuantity(products.getKey(), centerId);
					st.setInt(1, (orderedQuantity - products.getValue()));
					st.setInt(2, products.getKey());
					st.setInt(3, centerId);
					int flag = st.executeUpdate();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}

			try {
				st1 = con.prepareStatement("delete from orderTable where orderId=?");
				st1.setString(1, orderId);
				int flag = st1.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e);
			}

			try {
				st2 = con.prepareStatement("delete from itemTable where orderId=?");
				st2.setString(1, orderId);
				int flag = st2.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e);
			}

		}

		return false;

	}

}
