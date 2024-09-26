package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userLogout")
public class UserLogout extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(); //session ko get krenge
		session.removeAttribute("userObj"); //object ko remove kr denge
		session.setAttribute("succMsg","User Logout Successfully"); //msg dikha denge
		resp.sendRedirect("user_login.jsp"); //redirect kr denge login page par

}
}
