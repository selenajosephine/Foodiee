package com.ilp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProfileControl
 */

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

	import com.ilp.Dao.FoodieeDao;
	import com.ilp.bean.User;

	/**
	 * Servlet implementation class ProfileControl
	 */
	@WebServlet("/ProfileControl")
	public class ProfileControl extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	   
	    public ProfileControl() {
	        super();
	    }

		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action=request.getParameter("actions");
			RequestDispatcher rd=null;
			String s = request.getParameter("action");
			if("list".equals(s)){
				HttpSession session = request.getSession(false);
				long userId = Long.parseLong(session.getAttribute("userId").toString());
				FoodieeDao dao=new FoodieeDao();
				User u= dao.searchUser(userId);
				rd=request.getRequestDispatcher("list.jsp");
				request.setAttribute("List", u);
				rd.forward(request,response);		
									
		    }
			else if("Edit".equals(action))
			{
				long userId = Long.parseLong(request.getParameter("userId"));
				String name=request.getParameter("name");
				String email=request.getParameter("Email");
				long phone=Long.parseLong(request.getParameter("Phone No"));
				FoodieeDao dao=new FoodieeDao();
				int u= dao.updateUser(userId,name,email,phone);
				if(u>0){
					
				rd=request.getRequestDispatcher("success.jsp");
				request.setAttribute("message", "Your profile is updated successfully");
				rd.forward(request,response);	
				}
				else
				{
					rd=request.getRequestDispatcher("failure.jsp");
					request.setAttribute("message", "Profile is not updated");
					rd.forward(request,response);		
				}
			}
						
		}

		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		}

	}



