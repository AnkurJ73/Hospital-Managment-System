package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.userDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctorLogin") //url mapping
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password"); //user se input le lenge email and password
		
		HttpSession session = req.getSession();
		
		//userDao dao = new userDao(DBConnect.getConn());
		DoctorDao dao=new DoctorDao(DBConnect.getConn());
		
		//User user=dao.login(email, password);
		Doctor doctor=dao.login(email, password);
		
		
		if(doctor!=null)
		{
			session.setAttribute("doctObj", doctor);
			resp.sendRedirect("doctor/index.jsp");
		}else {
			session.setAttribute("errorMsg", "invalid email & password");
			resp.sendRedirect("doctor_login.jsp");
		}
		
	}
	
	

}
