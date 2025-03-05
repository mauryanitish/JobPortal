  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <%@page isELIgnored = "false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style = "background-color : #f0f1f2;">

<c:if test = "${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp"%>

	<div class="conatiner p-2">
		<div class = "col-md-10 offset-md-1 ">
			<div class = "card">
				<div class = "card-body">
					<div class = "text-center text-success">
						<i class = "fas fa-user-friends fa-3x"></i>
						<c:if test="${not empty succMsg }">
							<div class = "alert alert-success" role = "alert">${succMsg}</div>
							<c:remove var = "succMsg"/>
							</c:if> 
							<h5>Add Jobs</h5>
					</div>
					<form action="addJob" method = "post">
						<div class = "form-group mb-2">
							<lablel class = "form-label">Enter Title</lablel><input type = "text" name = "title" class = "form-control" required >
						</div>
						<div class = "row mb-2">
							<div class="form-group col-md-4">
								<label>Location</label><select name="location"
								class = "form-select" id="inlineFormCustomSelectPref">
									<option selected>choose...</option>
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
							<div class = "form-group col-md-4">
								<label>Category</label><select class = " form-select"
									id = "inlineFormCustomSelectPref" name = "category">
										<option selected>Choose...</option>
										<option value = "IT">IT</option>
										<option value = "Developer">Developer</option>
										<option value = "Banking">Banking</option>
										<option value = "Engineer">Engineer</option>
										<option value = "Teacher">Teacher</option>
								</select>
							</div>
							<div class = "form-group col-md-4">
								<label>Status</label><select class = "form-control" name = "status">
									<option class = "Active">Active</option>
									<option class = "Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class = "form-group mb-2">
							<label>Enter Description</label>
							<textarea required rows="6" cols="" name = "desc" class = "form-control"></textarea>
						</div>
						<button class = "btn btn-success mb-2">Publish Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file = "all_component/footer.jsp" %>
</body>
</html>