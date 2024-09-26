<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3)
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>

					<tbody>
					<% 
					 AppointmentDAO dao =new AppointmentDAO(DBConnect.getConn());
					DoctorDao dao2=new DoctorDao(DBConnect.getConn());
					//DoctorDao dao2=new DoctorDao(DBConnect.getConn());
					List<Appointment> list = dao.getAllAppointment();
					for(Appointment ap : list){
						Doctor d = dao2.getDoctorById(ap.getDoctorId());
					%>
						<tr>
							<th><%=ap.getFullname() %></th>
							<th><%=ap.getGender() %></th>
							<th><%=ap.getAge() %></th>
							<th><%=ap.getAppoinDate() %></th>
							<th><%=ap.getEmail() %></th>
							<th><%=ap.getPhNo() %></th>
							<th><%=ap.getDiseases() %></th>
							<th><%=d.getFullname() %></th>
							<th><%=ap.getAddress() %></th>
							<th><%=ap.getStatus() %></th>
						</tr>
						<% 
						}
					%>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>