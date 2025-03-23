<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style = "background-color : #f0f1f2;">
<%@include file="all_component/navbar.jsp"%>

	<div class="container-fuild">
		<div class = "row p-5">
			<div class = "col-md-4 offset-md-4">
				<div class = "card">
					<div class = "card-body">
						<div class = "text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden = "true"></i>
							<h5>Registration</h5>
						</div>
						<c:if test="${not empty succMsg }">
							<h4 class = "text-center text-success">${succMsg}</h4>
						</c:if>
						<form action="addUser" method = "post">
						<div class = "form-group">
								<label>Enter Full Name</label><input type="text" required="required" class ="form-control mt-2" id="exampleInputName" aria-describedby ="nameHelp" name="fn">
							</div>
							<div class = "form-group">
								<label>Enter Qualification</label><input type="text" required="required" class ="form-control mt-2" id="exampleInputQualification" name = "qua">
							</div>
							<div class = "form-group">
								<label>Enter Email</label><input type="email" required="required" class ="form-control mt-2" id="exampleInputEmail1" aria-describedby ="emailHelp" name="em">
							</div>
							<div class = "form-group mt-2">
							<label for = "exampleInputPassword1">Enter Password</label>
							<input required = "required" type="password" class="form-control mt-2"
							id="exampleInputPassword1" name="ps">
							</div>
							<div class = "d-grid form-group mt-2">
							<button type="submit" class="btn btn-primary .col-6">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>

<%@include file = "all_component/footer.jsp" %>
</body>
</html>