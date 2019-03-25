package com.ilp.Dao;

import java.sql.*;
import java.util.ArrayList;

import com.ilp.bean.Admin;
import com.ilp.util.DBUtil;

public class AdminDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public int addVendor(Admin admin) {
		int result = 0;
		con = DBUtil.getConnection();
		try {
			ps = con.prepareStatement("insert into userTable values(?,?,?,?,?,?,?)");
			ps.setLong(1, admin.getUserId());
			ps.setString(2, admin.getUsername());
			ps.setLong(3, admin.getPhone());
			ps.setString(4, admin.getEmail());
			ps.setString(5, "Vendor");
			ps.setString(6, admin.getPassword());
			ps.setInt(7, admin.getCenterId());
			result = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}

	public ArrayList<Admin> viewvendor() {
		ArrayList<Admin> vendorList = new ArrayList<Admin>();
		con = DBUtil.getConnection();
		try {
			ps = con.prepareStatement(
					"select user_id,user_name,phone,email,center_id from userTable where user_type='Vendor'");
			rs = ps.executeQuery();
			while (rs.next()) {
				Admin admin = new Admin();
				admin.setUserId(rs.getInt(1));
				// admin.setPassword(rs.getString(2));
				admin.setUsername(rs.getString(2));
				admin.setPhone(rs.getLong(3));
				admin.setEmail(rs.getString(4));
				admin.setCenterId(rs.getInt(5));
				vendorList.add(admin);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vendorList;
	}

	public int deletevendor(int user_id) {
		int flag = 0;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement("delete from  userTable where user_id=? ");
			ps.setInt(1, user_id);
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = i;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
