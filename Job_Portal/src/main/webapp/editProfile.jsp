<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color:#f7f7f7;">

	<c:if test = "${empty userobj }">
		<c:redirect url = "login.jsp"/>
		</c:if>
		
		<%@include file="all_component/navbar.jsp" %>
		<div class = "container-fluid">
			<div class = "row p-4">
				<div class = "col-md-4 offset-md-4">
					<div class = "card">
						<div class = "card-body">
							<div class = "text-center">
								<i class = "fa fa-user-plus fa-2x" aria-hidden="true"></i>
								
								<h5>Edit Profile</h5>
							</div>
							
							<form action = "updateProfile" method = "post">
							
								<input type = "hidden" name="id" value = "${userobj.id }">
								<div class = "mb-3">
									<label>Enter Full Name</label><input type="text" required = "required" class ="form-control" id = "exampleInputEmail1" aria-describedby="emailHelp" name = "name" value = "${userobj.name }">
								</div>
								
								<div class = "mb-3">
									<label>Enter Qualification</label><input type="text" required = "required" class ="form-control" id = "exampleInputEmail1" aria-describedby="emailHelp" name = "qua" value = "${userobj.qualification }">
								</div>
							
							<div class = "mb-3">
									<label>Enter Email</label><input type="text" required = "required" class ="form-control" id = "exampleInputEmail1" aria-describedby="emailHelp" name = "email" value = "${userobj.email }">
								</div>
								
								<div class = "mb-3">
									<label>Enter Password</label><input type="text" required = "required" class ="form-control" id = "exampleInputEmail1" aria-describedby="emailHelp" name = "ps" value = "${userobj.password }">
								</div>
								
								<button type = "submit" class = "btn btn-primary badge-pill btn-block">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>