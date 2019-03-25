package com.ilp.service;

import java.util.ArrayList;

import com.ilp.Dao.AdminDao;
import com.ilp.bean.Admin;



public class AdminService {
	AdminDao dao=new AdminDao();
	public int addVendor(Admin admin){
		return dao.addVendor(admin);
	}
	public ArrayList<Admin> viewvendor()
	{
		return dao.viewvendor();
	}
	public  int deletevendor(int user_id)
	{
		return dao.deletevendor(user_id);
	}
}
