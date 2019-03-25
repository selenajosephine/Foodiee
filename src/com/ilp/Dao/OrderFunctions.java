package com.ilp.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ilp.util.DBUtil;

public class OrderFunctions {
	/*
	 * gets product price form product table using product id
	 */

	public static double getProductPrice(int productId) {
		double productPrice = 0;
		Connection con = null;
		PreparedStatement st4 = null;
		ResultSet set1 = null;

		try {

			con = DBUtil.getConnection();
			st4 = con
					.prepareStatement("select price from productTable where product_id=?");
			st4.setInt(1, productId);
			set1 = st4.executeQuery();
			while (set1.next()) {
				productPrice = set1.getDouble("price");
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

		return productPrice;
	}

	/*
	 * get product quantity form product relation table using product id and
	 * center id
	 */

	public static int getProductQuantity(int productId, int centerId) {
		int quantity = 0;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		try {
			con = DBUtil.getConnection();
			st = con.prepareStatement("select productQuantity from productRelationTable where productId=? and centerId=?");
			st.setInt(1, productId);
			st.setInt(2, centerId);
			set = st.executeQuery();
			while (set.next()) {
				quantity = set.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return quantity;
	}

	/*
	 * get orderquantity form product relation table using product id and center
	 * id
	 */

	public static int getOrderedQuantity(int productId, int centerId) {
		int quantity = 0;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		try {
			con = DBUtil.getConnection();
			st = con.prepareStatement("select OrderedQuantity from productRelationTable where productId=? and centerId=?");
			st.setInt(1, productId);
			st.setInt(2, centerId);
			set = st.executeQuery();
			while (set.next()) {
				quantity = set.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return quantity;
	}

	public static String getOrderStatus(String orderId) {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		String id = "" ;
		try {
			con = DBUtil.getConnection();
			st = con.prepareStatement("select orderStatus from orderTable where orderId='"+orderId+"'");
			set = st.executeQuery();
			while (set.next()) {
				id = set.getString(1);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return id;
	}

	/*
	 * gets center id form order table using orderid
	 */
	public static int getCenterId(String orderId) {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		int id = 0;

		try {
			con = DBUtil.getConnection();
			st = con.prepareStatement("select centerId from orderTable where orderId=?");
			st.setString(1, orderId);
			set = st.executeQuery();
			while (set.next()) {
				id = set.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return id;
	}
	
	
	public static HashMap<Integer,Integer> getProductMapItemTable(String orderId){
		HashMap<Integer,Integer> productMapTwo = new HashMap<Integer,Integer>();
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		try {
			con = DBUtil.getConnection();
			st = con.prepareStatement("select productId,orderQuantity from itemTable where orderId=?");
			st.setString(1, orderId);
			set = st.executeQuery();
			while(set.next()){
				productMapTwo.put(set.getInt(1), set.getInt(2));
				
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		return productMapTwo;
		
	}
	
	public static ArrayList<Integer> getListOfProductId(String orderId){
		ArrayList<Integer>  productList = new ArrayList<Integer>();
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		try {
			st=con.prepareStatement("select productId from itemTable where orderId='"+orderId+"'");
			set = st.executeQuery();
			while(set.next()){
				productList.add(set.getInt(1));
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	/*
	 * gets order id from item table using product id
	 */
	public static ArrayList<String> getOrderIdList(int productId){
		 ArrayList<String> orderList = new ArrayList<String>();
		Connection con = null;
		PreparedStatement st = null;
		ResultSet set = null;
		con = DBUtil.getConnection();
		try {
			st = con.prepareStatement("select orderId from itemTable where productId=? group by orderid");
			st.setInt(1, productId);
			set = st.executeQuery();
			while(set.next()){
				orderList.add(set.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return orderList;}
	
}
