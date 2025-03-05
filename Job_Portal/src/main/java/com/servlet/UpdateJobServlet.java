package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");
			
			Jobs jobs = new Jobs();
			
			jobs.setId(id);
			jobs.setTitle(title);
			jobs.setCategory(category);
			jobs.setDescription(description);
			jobs.setLocation(location);
			jobs.setStatus(status);
			
			HttpSession session = req.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.updateJob(jobs);
			if (f) {
				session.setAttribute("succMsg", "Job Update Successfully...");
				resp.sendRedirect("viewJob.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something Wrong on Server...");
				resp.sendRedirect("viewJob.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
