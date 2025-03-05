  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
  <%@page isELIgnored = "false" %>
 <nav class="navbar navbar-expand-lg bg-custom">
      <div class="container-fluid">
        <a class="navbar-brand" style = "color:white;" href="#">Navbar</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home
              	<span class = "sr-only">(current)</span>
              </a>
            </li>
            
            <c:if test = "${userobj.role eq 'admin' }">
             <li class="nav-item">
              <a class="nav-link" href="add_job.jsp"><i class="fa-solid fa-circle-plus me-1"></i>Post Job</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="viewJob.jsp"><i class="fa-solid fa-eye me-1"></i>View Job</a>
            </li>
            </c:if>
            
           
          </ul>
          <form class="d-flex">
          
          <c:if test = "${not empty userobj }">
                      <a href="#" class="btn btn-light me-1"><i class="fa-solid fa-user me-1"></i>Admin</a>
                      <a href="#" class="btn btn-light "><i class="fa-solid fa-right-to-bracket me-1"></i>Logout</a>
          
          </c:if>
          
           <c:if test = "${empty userobj }">
                                 <a href="login.jsp" class="btn btn-light me-1"><i class="fa-solid fa-right-to-bracket me-1"></i>Login</a>
            <a href="signup.jsp" class="btn btn-light "><i class="fa-solid fa-user me-1"></i>Signup</a>
          </c:if>
          </form>
        </div>
      </div>
    </nav>