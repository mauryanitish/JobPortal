package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addUser")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String nameString = req.getParameter("fn");
			String quaString = req.getParameter("qua");
			String emaiString = req.getParameter("em");
			String pString = req.getParameter("ps");
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			
			User u = new User(nameString,emaiString,pString,quaString,"user");
			boolean f = dao.addUser(u);
			
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("succMsg", "Registration Sucessfully");
				resp.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("succMsg", "Something wrong on Server");
				resp.sendRedirect("signup.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
