package com.ilp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ilp.Dao.VendorInterface;
import com.ilp.bean.DeliveryBean;

/**
 * Servlet implementation class VendorServlet
 */
@WebServlet(name = "vendorservlet", urlPatterns = { "/VendorServlet" })
public class VendorServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String s = request.getParameter("action");
		if ("view".equals(s)) {
			HashMap<String, Integer> orderList = new HashMap<String, Integer>();
			HttpSession session = request.getSession(false);
			long customerId = (Long) session.getAttribute("userId");
			int centerId = VendorInterface.getCenterId(customerId);
			orderList = VendorInterface.displayAllOrders(centerId);

			RequestDispatcher rd = request.getRequestDispatcher("ViewOrders.jsp");
			request.setAttribute("orderList", orderList);
			rd.forward(request, response);

		}
		if ("update".equals(s)) {
			ArrayList<DeliveryBean> deliveryList = new ArrayList<DeliveryBean>();
			HttpSession session = request.getSession(false);

			// long customerId = (Long) session.getAttribute("userId");
			long userId = Long.parseLong(request.getParameter("customerId"));
			deliveryList = VendorInterface.getAllOrder(userId);

			RequestDispatcher rd = request.getRequestDispatcher("updateOrder.jsp");
			request.setAttribute("deliverylist", deliveryList);
			rd.forward(request, response);

		}
		if ("deliver".equals(s)) {
			String orderId = request.getParameter("orderId");
			long userId = Long.parseLong(request.getParameter("customerId"));
			boolean flag = VendorInterface.deliveredStatusUpdate(orderId);
			if (flag) {

				ArrayList<DeliveryBean> deliveryList = new ArrayList<DeliveryBean>();
				HttpSession session = request.getSession(false);
				deliveryList = VendorInterface.getAllOrder(userId);
				RequestDispatcher rd = request.getRequestDispatcher("updateOrder.jsp");
				request.setAttribute("deliverylist", deliveryList);
				rd.forward(request, response);
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
