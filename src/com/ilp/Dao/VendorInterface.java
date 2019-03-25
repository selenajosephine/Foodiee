package com.ilp.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;

import com.ilp.bean.DeliveryBean;
import com.ilp.bean.OrderTable;
import com.ilp.util.DBUtil;

public class VendorInterface {

	/*
	 * gets the product id and product quantity to display all the items for the
	 * vendor to prepare for each center
	 */
	public static HashMap<String, Integer> displayAllOrders(int centerId) {
		HashMap<String, Integer> orderList = new HashMap<String, Integer>();
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		PreparedStatement st1 = null;
		ResultSet set1 = null;
		con = DBUtil.getConnection();
		try {
			st = con.prepareStatement("select productId,orderedQuantity from productRelationTable where centerId=?");
			st.setInt(1, centerId);
			set = st.executeQuery();
			while (set.next()) {
				st1 = con
						.prepareStatement("select product_name from productTable where product_id=?");
				int productId = set.getInt(1);
				st1.setInt(1, productId);
				set1 = st1.executeQuery();
				while (set1.next()) {
					String productname = set1.getString(1);
					orderList.put(productname, set.getInt(2));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}

	/*
	 * display individual orders of the customer using customer id for delivery
	 * to each customer in the vendor side
	 */
	
	public static ArrayList<DeliveryBean> getAllOrder(long customerId){
		ArrayList<DeliveryBean> deliveryList = new ArrayList<DeliveryBean>(); 
		Connection con = null;
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		PreparedStatement st2 = null;
		ResultSet set = null;
		ResultSet set1 = null;
		ResultSet set2 = null;
		con = DBUtil.getConnection();
		Date date = new Date(System.currentTimeMillis()-24*60*60*1000);
			try {
				st = con.prepareStatement("select orderId,sum(totalAmount) from orderTable where customerId=? and orderDate>? and orderStatus='accepted' group by orderId");
				st.setLong(1, customerId);
				st.setDate(2, date);
				set = st.executeQuery();
				
				while(set.next()){
					String orderId = set.getString(1);
					double price = set.getDouble(2); 
					st1 = con.prepareStatement("select productId,sum(orderQuantity) from itemTable where orderId=? group by productId");
					st1.setString(1,orderId);
					set1=st1.executeQuery();
					while(set1.next()){
						int productid = set1.getInt(1);
						int quantity = set1.getInt(2);
						st2=con.prepareStatement("select product_name from productTable where product_id=?");
						st2.setInt(1,productid);
						set2 = st2.executeQuery();
						while(set2.next()){
							String productName = set2.getString(1);
							DeliveryBean bean = new DeliveryBean(orderId, productName, customerId, price , quantity);
							deliveryList.add(bean);
						}
					}
				}
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return deliveryList;
	}
	
	


	/*
	 * updates the item status of each center by the vendor after displaying the
	 * order to each centers
	 */
	public void setProductStatusVendor(int productId, int centerId) {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		ArrayList<String> orderList = OrderFunctions.getOrderIdList(productId);
		int i = 0;
		for (String order : orderList) {
			try {
				st = con.prepareStatement("update orderTable set orderStatus=? where centerId=? and orderId=? ");
				st.setString(1, "prepared");
				st.setInt(2, centerId);
				st.setString(3, order);
				i = st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/*
	 * updates the item status of each order by the vendor after delivering the
	 * order to each customers order
	 */

	public static boolean deliveredStatusUpdate(String orderId) {
		boolean flag=false;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();

		try {
			st = con.prepareStatement("update orderTable set orderStatus=? where orderId='"+orderId+"'");
			st.setString(1, "delivered");
	
			int i = st.executeUpdate();
			i = st.executeUpdate();
			if (i > 0) {
				 flag=true;
			} else {
				 flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	public static int getCenterId(Long userId) {
		int centerId = 0;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		try {
			st = con.prepareStatement("select center_id from userTable where user_id=?");
			st.setLong(1, userId);

			set = st.executeQuery();
			while (set.next()) {
				centerId = set.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return centerId;

	}
}
