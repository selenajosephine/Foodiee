package com.ilp.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ilp.bean.CartItem;
import com.ilp.bean.CartOrder;
import com.ilp.bean.Product;
import com.ilp.bean.User;
import com.ilp.util.DBUtil;

public class FoodieeDao {

	public ArrayList<String> getCenters(String city) {
		ArrayList<String> centers = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("select center_name from center where city_id = (select city_id from city where city_name='"
							+ city + "')");
			rs = ps.executeQuery();
			while (rs.next()) {
				if (centers == null) {
					centers = new ArrayList<String>();
				}
				centers.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return centers;
	}

	public ArrayList<String> getCity() {
		ArrayList<String> cities = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select city_name from city");
			rs = ps.executeQuery();
			while (rs.next()) {
				if (cities == null) {
					cities = new ArrayList<String>();
				}
				cities.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return cities;
	}

	public int getCenterId(String center) {
		int centerId = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("select center_id from center where center_name = '"
							+ center + "'");
			rs = ps.executeQuery();
			while (rs.next()) {
				centerId = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return centerId;
	}

	public User login(long userId, String password) {
		User user = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("select * from userTable where user_id = "
							+ userId + " and password = '" + password + "'");
			rs = ps.executeQuery();
			while (rs.next()) {
				if (user == null) {
					user = new User(rs.getLong(1), rs.getString(2),
							rs.getString(4), rs.getLong(3), rs.getString(6),
							rs.getString(5), rs.getInt(7));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return user;
	}

	public boolean addUser(User user) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("insert into userTable values (?, ?, ?, ?, ?, ?, ?)");
			ps.setLong(1, user.getUserId());
			ps.setString(2, user.getUsername());
			ps.setLong(3, user.getPhone());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getUserType());
			ps.setString(6, user.getPassword());
			ps.setInt(7, user.getCenterId());
			int noOfRows = ps.executeUpdate();
			if (noOfRows > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return result;
	}

	public static ArrayList<Product> getProducts(int centerId) {
		ArrayList<Product> productList = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("select PRODUCTTABLE.*, centerProductTable.quantity from PRODUCTTABLE "
							+ "inner join centerproducttable on PRODUCTTABLE.product_id = centerProductTable.product_id and centerProductTable.center_id ="
							+ centerId);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (productList == null) {
					productList = new ArrayList<Product>();
				}
				productList.add(new Product(rs.getInt(1), rs.getString(2), rs
						.getDouble(3), rs.getString(4), rs.getInt(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return productList;
	}

	public boolean addCart(CartItem cartItem) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			if (cartItem.getQuantity() == 1) {
				ps = conn
						.prepareStatement("insert into cartTable values (?, ?, ?, ?)");
				ps.setLong(1, cartItem.getCustomerId());
				ps.setInt(2, cartItem.getProductId());
				ps.setString(3, cartItem.getProductName());
				ps.setInt(4, cartItem.getQuantity());
			} else {
				ps = conn.prepareStatement("update cartTable set quantity="
						+ cartItem.getQuantity() + " where customer_id="
						+ cartItem.getCustomerId() + " and product_id="
						+ cartItem.getProductId());
			}
			int noOfRows = ps.executeUpdate();
			if (noOfRows > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return result;
	}

	public boolean deleteCart(long customerId, int productId) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("delete from cartTable where customer_id="
							+ customerId + " and product_id=" + productId);
			int noOfRows = ps.executeUpdate();
			if (noOfRows > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return result;
	}

	public int getQuantity(long userId, int productId) {
		int quantity = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("select quantity from cartTable where customer_id="
							+ userId + " and product_id=" + productId);
			rs = ps.executeQuery();
			while (rs.next()) {
				quantity = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return quantity;
	}

	public ArrayList<CartItem> getCartProducts(long customerId) {
		ArrayList<CartItem> itemList = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			System.out.println(customerId);
			conn = DBUtil.getConnection();
			ps = conn
					.prepareStatement("select CARTTABLE.PRODUCT_ID, CARTTABLE.PRODUCT_NAME, PRODUCTTABLE.PRICE, CARTTABLE.QUANTITY from CARTTABLE "
							+ "inner join PRODUCTTABLE "
							+ "on PRODUCTTABLE.PRODUCT_ID = CARTTABLE.PRODUCT_ID and CARTTABLE.CUSTOMER_ID="
							+ customerId);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (itemList == null) {
					itemList = new ArrayList<CartItem>();
				}
				itemList.add(new CartItem(rs.getInt(1), rs.getInt(4),
						customerId, rs.getString(2), rs.getDouble(3)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeConnection(conn);
		}
		return itemList;
	}

	public CartOrder getCartOrderObject(long customerId) {
		HashMap<Integer, Integer> productQuantity = new HashMap<Integer, Integer>();
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		conn = DBUtil.getConnection();
		int centerId = 0;
		try {
			ps = conn
					.prepareStatement("select product_id,quantity from cartTable where customer_id=?");
			ps.setLong(1, customerId);
			rs = ps.executeQuery();
			while (rs.next()) {
				productQuantity.put(rs.getInt(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ps1 = conn
					.prepareStatement("select center_id from userTable where user_id=?");
			ps1.setLong(1, customerId);
			rs1 = ps1.executeQuery();
			while (rs1.next()) {
				centerId = rs1.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		CartOrder orderObj = new CartOrder(customerId, productQuantity,
				centerId);
		return orderObj;

	}

	public static String getUserCategory(long userId) {
		String category = " ";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = DBUtil.getConnection();
		try {
			ps = conn
					.prepareStatement("select user_type from userTable where user_id=?");
			ps.setLong(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				category = rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;

	}

	public User searchUser(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User u = new User();
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement pst = null;
			String query = "select * from userTable where user_id=?";
			pst = con.prepareStatement(query);
			pst.setLong(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				u.setUserId(rs.getLong("user_id"));
				u.setUsername(rs.getString("user_name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closePreparedStatement(ps);
		DBUtil.closeConnection(conn);
		return u;
	}

	public int updateUser(long id, String name, String email, long phone) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User u = new User();
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement pst = null;
			pst = con
					.prepareStatement("update userTable set user_name=?,email=?,phone=? where user_id=?");
			pst.setLong(4, id);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setLong(3, phone);
			i = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closePreparedStatement(ps);
		DBUtil.closeConnection(conn);
		return i;
	}

}
