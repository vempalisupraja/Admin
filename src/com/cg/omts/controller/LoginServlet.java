package com.cg.omts.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.omts.dto.Customer;
import com.cg.omts.exceptions.OMTSException;
import com.cg.omts.service.AdminServiceImpl;
import com.cg.omts.service.IAdminService;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int userId=Integer.parseInt(request.getParameter("user"));
		String password=request.getParameter("pass");
		IAdminService admin = new AdminServiceImpl();
		Customer customer = new Customer(userId, password);
		RequestDispatcher dispatcher =null;
		try {
			if(admin.validateLogin(customer).equals("adm"))
			{
				HttpSession session = request.getSession(true);
				session.setAttribute("username", customer.getCustomerId());
				session.setAttribute("rolecode", "adm");
				System.out.println("Admin");
				response.sendRedirect("adminHomePage.jsp");
			
			}
			else if(admin.validateLogin(customer).equals("usr"))
			{
				HttpSession session = request.getSession(true);
				session.setAttribute("username", customer.getCustomerId());
				session.setAttribute("rolecode", "usr");
				dispatcher= request.getRequestDispatcher("userhome.jsp");
				dispatcher.forward(request, response);
				System.out.println("User");
			} else  {
				request.setAttribute("errormessage", "Invalid Credentials!!");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		        rd.forward(request, response);
			}
		} catch (OMTSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}