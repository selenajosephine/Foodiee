package com.ilp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ilp.Dao.AdminDao;
import com.ilp.bean.Admin;
import com.ilp.service.AdminService;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet(name = "add", urlPatterns = { "/AddServlet" })
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminDao dao = new AdminDao();
		AdminService service = new AdminService();
		RequestDispatcher rd = null;
		String action = request.getParameter("action");
		if (action.equals("Add")) {
			int id = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");
			String name = request.getParameter("user_name");
			int centerid = Integer.parseInt(request.getParameter("center_id"));
			String email = request.getParameter("email");
			Long phonenumber = Long.parseLong(request.getParameter("phone"));
			Admin admin = new Admin();
			admin.setUserId(id);
			admin.setUsername(name);
			admin.setPhone(phonenumber);
			admin.setEmail(email);
			admin.setUserType("Vendor");
			admin.setPassword(password);
			admin.setCenterId(centerid);
			int result = service.addVendor(admin);
			if (result > 0) {
				rd = request.getRequestDispatcher("success.jsp");
				request.setAttribute("message", "Successfully added your vendor! ");
				rd.forward(request, response);
			}

		}
		if (action.equals("view")) {
			ArrayList<Admin> vendorList = new ArrayList<Admin>();
			vendorList = service.viewvendor();
			rd = request.getRequestDispatcher("viewvendor.jsp");
			request.setAttribute("vendorList", vendorList);
			rd.forward(request, response);
		}
		if (action.equals("Delete")) {
			int result1 = 0;
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			result1 = service.deletevendor(user_id);
			if (result1 > 0) {
				rd = request.getRequestDispatcher("success.jsp");
				request.setAttribute("message", "deleted the vendor successfully");
			} else {
				{
					rd = request.getRequestDispatcher("success.jsp");
					request.setAttribute("message", "failed to delete");
				}
			}
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
