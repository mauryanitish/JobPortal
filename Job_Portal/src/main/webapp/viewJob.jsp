<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Jobs"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <%@page isELIgnored = "false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : View Job</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style = "background-color : #f0f1f2;">

<c:if test = "${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp"%>

	<div class = "container">
		<div class = "row">
			<div class = col-md-12>
				<h5 class = "text-center text-primary">All Jobs</h5>
				
				<c:if test="${not empty succMsg }">
							<div class = "alert alert-success" role = "alert">${succMsg}</div>
							<c:remove var = "succMsg"/>
							</c:if> 
				
					<% JobDAO dao = new JobDAO(DBConnect.getConn());
							List<Jobs> list = dao.getAllJobs();
							for(Jobs j : list){%>
							<div class = "card mt-2 mb-2">
					<div class = "card-body">
						<div class = "text-center text-primary">
							<i class = "far fa-clipboard fa-2x"></i>
							
						</div>
						
					
						<h6><%=j.getTitle() %></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class = "row">
							<div class = "form-group col-md-3">
								<input type="text" class = "form-control form-control-sm" value = "location :<%=j.getLocation() %>" readonly>
							</div>
							<div class = "form-group col-md-3">
								<input type="text" class = "form-control form-control-sm" value = "Category :<%=j.getCategory() %>" readonly>
							</div>
							<div class = "form-group col-md-3">
								<input type="text" class = "form-control form-control-sm" value = "Status :<%=j.getStatus()%>" readonly>
							</div>
						</div>
						<h6 class = "mt-2">Publish Date: <%=j.getPdate() %></h6>
						<div class = "text-center mt-2">
							<a href="edit_job.jsp?id=<%=j.getId() %>" class = "btn btn-sm bg-success text-white">Edit</a>
							<a href = "delete?id=<%=j.getId() %>" class = "btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
							<%}
						%>
						
				
		</div>
	</div>

<%@include file = "all_component/footer.jsp" %>
</body>
</html>