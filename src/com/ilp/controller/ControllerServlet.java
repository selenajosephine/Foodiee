package com.ilp.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ilp.Dao.FoodieeDao;
import com.ilp.Dao.OrderDbManage;
import com.ilp.bean.CartOrder;
import com.ilp.bean.OrderTable;
import com.ilp.service.DbService;



/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ControllerServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s = request.getParameter("action");
		if("placeorder".equals(s)){
			HttpSession session = request.getSession(false);
			String paymentType = request.getParameter("type");
			DbService service = new DbService();
			FoodieeDao obj = new FoodieeDao();
			long customerId = (Long) session.getAttribute("userId");
			CartOrder order = obj.getCartOrderObject(customerId);
			boolean flag = service.placeOrderDb(order.getProductQuantity(), order.getCenterId(),customerId, paymentType);
			RequestDispatcher rd = request.getRequestDispatcher("payMessage.jsp");
			if(flag){
				request.setAttribute("message","your order has been placed successfully");
				rd.forward(request, response);
			}else{
				request.setAttribute("message","order placing failed");
				rd.forward(request, response);
			}
			
		}
		if("delete".equals(s)){
			String a = request.getParameter("order");
			OrderDbManage manage = new OrderDbManage();
			manage.orderDelete(a);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
