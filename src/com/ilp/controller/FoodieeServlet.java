package com.ilp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.ilp.Dao.FoodieeDao;
import com.ilp.bean.CartItem;
import com.ilp.bean.Product;
import com.ilp.bean.User;

/**
 * Servlet implementation class FoodieeServlet
 */
//@WebServlet("/FoodieeServlet")
public class FoodieeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodieeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action"); 
		RequestDispatcher requestDispatcher = null;
		if(action.equals("centerList")) {
				String city = request.getParameter("city");
				FoodieeDao dao = new FoodieeDao();
				ArrayList<String> centers = dao.getCenters(city);
				JSONArray array = new JSONArray(centers);
				PrintWriter out = response.getWriter();
				out.println(array);
		} else if(action.equals("cityList")) {
				FoodieeDao dao = new FoodieeDao();
				ArrayList<String> cities = dao.getCity();
				JSONArray array = new JSONArray(cities);
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.println(array);
		} else if(action.equals("logout")){
			HttpSession session = request.getSession(false);
    		if(session != null && session.getAttribute("userId") != null){
    			session.setAttribute("userId", null);
    			session.setMaxInactiveInterval(0);
    		}
    		response.sendRedirect("login.jsp");
		} else if(action.equals("addItem")) {
			HttpSession session = request.getSession(false);
			long customerId = (Long) session.getAttribute("userId"); 
			int productId = Integer.parseInt(request.getParameter("productId"));
			String productName = request.getParameter("productName");
			FoodieeDao dao = new FoodieeDao();
			int quantity = dao.getQuantity(customerId, productId);
			CartItem cartItem = new CartItem(productId, ++quantity, customerId, productName);
			boolean result = dao.addCart(cartItem);
			if(result == true) {
				JSONObject resultJson = new JSONObject(result);
				PrintWriter out = response.getWriter();
				out.print(resultJson);
			}
		} else if(action.equals("viewCart")) {
			HttpSession session = request.getSession(false);
			long customerId = Long.parseLong(session.getAttribute("userId").toString());
			ArrayList<CartItem> cartItems = new ArrayList<CartItem>();
			FoodieeDao dao = new FoodieeDao();
			cartItems = dao.getCartProducts(customerId);
			requestDispatcher = request.getRequestDispatcher("cart.jsp");
			request.setAttribute("cartItems", cartItems);
			requestDispatcher.forward(request, response);
		} else if(action.equals("product")) {
			HttpSession session = request.getSession(false);
			int centerId = Integer.parseInt(session.getAttribute("centerId").toString());
			ArrayList<Product> productList = new ArrayList<Product>();
			productList = FoodieeDao.getProducts(centerId);
			requestDispatcher = request.getRequestDispatcher("product.jsp");
			request.setAttribute("productList", productList);
			requestDispatcher.forward(request, response);
		} else if(action.equals("delete")) {
			HttpSession session = request.getSession(false);
			long customerId = Long.parseLong(session.getAttribute("userId").toString());
			int productId = Integer.parseInt(request.getParameter("productId"));
			FoodieeDao dao = new FoodieeDao();
			boolean result = dao.deleteCart(customerId, productId);
			if(result) {
			ArrayList<CartItem> cartItems = new ArrayList<CartItem>();
				cartItems = dao.getCartProducts(customerId);
				requestDispatcher = request.getRequestDispatcher("cart.jsp");
				request.setAttribute("cartItems", cartItems);
				requestDispatcher.forward(request, response);
			}
		} else if(action.equals("search")) {
			HttpSession session = request.getSession(false);
			int centerId = Integer.parseInt(session.getAttribute("centerId").toString());
			String productName = request.getParameter("search");
			ArrayList<Product> productList = new ArrayList<Product>();
			productList = FoodieeDao.getProducts(centerId);
			ArrayList<Product> searchProductList = new ArrayList<Product>();
			for(Product itr:productList) {	
				if(itr.getProductName().equalsIgnoreCase(productName)) {
					searchProductList.add(itr);
				}
			}
			requestDispatcher = request.getRequestDispatcher("product.jsp");
			request.setAttribute("productList", searchProductList);
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		RequestDispatcher requestDispatcher = null;
		if(action.equals("login")) {
			Long userId = Long.parseLong(request.getParameter("userId"));
			String password = request.getParameter("password");
			FoodieeDao dao = new FoodieeDao();
			User user = dao.login(userId, password);
			if(user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				session.setAttribute("centerId", user.getCenterId());
				//setting session to expiry in 5 mins
				session.setMaxInactiveInterval(5*60);
				ArrayList<Product> productList = new ArrayList<Product>();
			productList = dao.getProducts(user.getCenterId());
			String category = FoodieeDao.getUserCategory(userId);
				if("Customer".equals(category)){
				requestDispatcher = request.getRequestDispatcher("product.jsp");
				request.setAttribute("productList", productList);
				requestDispatcher.forward(request, response);
				}else if("Admin".equals(category)){
					requestDispatcher = request.getRequestDispatcher("AdminHome.jsp");
					requestDispatcher.forward(request, response);
				}else if("Vendor".equals(category)){
					requestDispatcher = request.getRequestDispatcher("VendorHome.jsp");
					requestDispatcher.forward(request, response);
				}
			} else {
				requestDispatcher = request.getRequestDispatcher("login.jsp");
				request.setAttribute("message", "Invalid ID or password");
				requestDispatcher.forward(request, response);
			}
		} else if(action.equals("signup")) {
			long userId = Long.parseLong(request.getParameter("userId"));
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			long phone = Long.parseLong(request.getParameter("phone"));
			String center = request.getParameter("center");
			FoodieeDao dao = new FoodieeDao();
			int centerId = dao.getCenterId(center);
			User user = new User(userId, username, email, phone, password, "Customer", centerId);
			boolean result = dao.addUser(user);
			if(result == true) {
				requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			}
		}
	}
	

}
