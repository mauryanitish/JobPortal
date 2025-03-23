<%@page import="com.entity.Jobs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import = "com.DB.DBConnect" %>
<%@page import = "com.dao.JobDAO" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : View Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style = "background-color: #f0f1f2;">
<c:if test = "${empty userobj }">
	<c:redirect url = "login.jsp"/>
</c:if>
<%@include file="all_component/navbar.jsp" %>
<div class = "container">
	<div class = "row">
		<div class = "col-md-12">
			<h5 class = "text-center text-primary">All Jobs</h5>
		
			<c:if test = "${not empty succMsg }">
				<h4 class = "text-center text-danger">${succMsg }</h4>
				<c:remove var = "succMsg"/>
			</c:if>
		
			<div class = "card">
				<div class = "card-body">
					
						<form class = "d-flex flex-row align-items-center flex-wrap" action="moreView.jsp" method = "get">
							<div class = "mb-3 col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							<div class = "mb-3 col-md-6 mt-1 ms-5">
								<h5>Category</h5>
							</div>
							
							<div class = "mb-3 col-md-5">
								<select name = "loc" class = "form-select" id = "inlineFormCustomSelectPref">
									<option selected value = "lo">choose...</option>
									<option value = "Odisha">Odisha</option>
									<option value = "Jharkhand">Jharkhand</option>
									<option value = "Gujrat">Gujrat</option>
									<option value = "Bhubaneswar">Bhubaneswar</option>
									<option value = "Delhi">Delhi</option>
									<option value = "Banglore">Banglore</option>
									<option value = "Chennai">Chennai</option>
									<option value = "Hydrabad">Hydrabad</option>
								</select>
							</div>
							
							<div class = "mb-3 col-md-5  ms-5">
								<select class = " form-select"
									id = "inlineFormCustomSelectPref" name = "cat">
										<option selected value = "ca">Choose...</option>
										<option value = "IT">IT</option>
										<option value = "Developer">Developer</option>
										<option value = "Banking">Banking</option>
										<option value = "Engineer">Engineer</option>
										<option value = "Teacher">Teacher</option>
								</select>
							</div>
							
							<button class = "mb-3 btn btn-success  ms-5" >Submit</button>
						</form>
				</div>
			</div>
			
			<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
			List<Jobs> list = dao.getAllJobsForUser();
			for(Jobs j : list){
			%>
			<div class = "card mt-2">
				<div class = "card-body">
					<div class = "text-center text-primary">
						<i class = "far fa-clipboard fa-2x"></i>
					</div>
					
					<h6><%=j.getTitle() %></h6>
					
					<%
						if(j.getDescription().length()>0 && j.getDescription().length()<120){
					%>
					<p><%=j.getDescription() %></p>
					<%
						}else{
					%>
					<p><%=j.getDescription().substring(0,120) %>...</p>
					<%
						}
					%>
					
					<br>
					<div class="row">
						<div class = "mb-3 col-md-3">
							<input type = "text" class = "form-control form-control-sm bg-body-secondary" value = "Location: <%=j.getLocation() %>" readonly>
						</div>
						<div class = "mb-3 col-md-3">
							<input type = "text" class = "form-control form-control-sm bg-body-secondary" value = "Category: <%=j.getCategory() %>" readonly>
						</div>
					</div>
					<h6>
						Publish Date:
						<%=j.getPdate().toString() %>
					</h6>
					<div class = "text-center">
						<a href = "oneView.jsp?id=<%=j.getId() %>" class = "btn btn-sm bg-success text-white">View More</a>
					</div>
				</div>
			</div>
			<%} %>
		</div>
	</div>
</div>
</body>
</html>