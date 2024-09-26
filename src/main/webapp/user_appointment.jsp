<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3)
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/img3.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct3.jpg">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Appointment</p>
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-4">${errorMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						
						<form class="row g-3" action="add_appoint" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required name="fullname" type="text" class="form-control">
							</div>


							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Age</label> <input
									required name="age" type="number" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Appointment
									Date</label> <input required name="appoint_date" type="date"
									class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Email</label> <input
									required name="email" type="email" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Phone No</label> <input
									maxlength="10" required name="phno" type="number"
									class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Diseases</label> <input
									required name="diseases" type="text" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputpassword4">Doctor</label> <select
									class="form-control" name="doct" required>
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId() %>"><%= d.getFullname() %>(<%=d.getSpecialist() %>)</option>

									<%
									}
									%>

									
								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${ empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<button type="submit"
									class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>

					</div>
				</div>
			</div>
		</div>
		</div>
		
		<%@include file="component/footer.jsp" %>
</body>
</html>