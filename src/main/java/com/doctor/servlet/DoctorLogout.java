package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/doctorLogout")
public class DoctorLogout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(); //session ko get krenge
		session.removeAttribute("doctObj"); //object ko remove kr denge
		session.setAttribute("succMsg","Doctor Logout Successfully"); //msg dikha denge
		resp.sendRedirect("doctor_login.jsp"); //redirect kr denge login page par
	}
	
	

}
