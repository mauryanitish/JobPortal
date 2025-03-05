package com.servlet;

import java.awt.JobAttributes;
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

@WebServlet("/addJob")
public class AddPostServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");
			
			Jobs jobs = new Jobs();
			jobs.setTitle(title);
			jobs.setCategory(category);
			jobs.setDescription(description);
			jobs.setLocation(location);
			jobs.setStatus(status);
			
			HttpSession session = req.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.addJobs(jobs);
			if (f) {
				session.setAttribute("succMsg", "Job Post Successfully...");
				resp.sendRedirect("add_job.jsp");
			}else {
				session.setAttribute("succMsg", "Something Wrong on server");
				resp.sendRedirect("add_job.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
