package com.servlet;

import java.io.IOException;
import java.nio.file.attribute.UserDefinedFileAttributeView;

import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("email");
			String pw = req.getParameter("password");
			HttpSession session = req.getSession();
			
			 User u = new User();
			
			if ("admin@gmail.com".equals(em) && "admin@123".equals(pw)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}else {
				
			}
			
	} catch (Exception e) {
		e.printStackTrace();
		}
	}

}
