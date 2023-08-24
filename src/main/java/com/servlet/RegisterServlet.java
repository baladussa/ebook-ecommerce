package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("fname");
		String email = req.getParameter("email");
		String phnno = req.getParameter("phnno");
		String password = req.getParameter("password");
		String check = req.getParameter("check");

		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phnno);
		us.setPassword(password);

		HttpSession session = req.getSession();

		if (check != null) {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f2=dao.checkUser(email);
			if(f2) {
				
				boolean f = dao.UserRegister(us);

				if (f) {

					session.setAttribute("succMsg", "Register Successfully...");
					resp.sendRedirect("register.jsp");
				} else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("register.jsp");
				}

				
			}else {
				session.setAttribute("failedMsg", "User Already Exists Try Another Email Id");
				resp.sendRedirect("register.jsp");
			}
			
		} else {
			session.setAttribute("failedMsg", "please check Agree & Terms Conditions");
			resp.sendRedirect("register.jsp");
		}

	}

}
