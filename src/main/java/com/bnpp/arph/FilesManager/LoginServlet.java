/**
 * 
 */
package com.bnpp.arph.FilesManager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 * 
 * @author MDian
 *
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String userID = "admin";
	private final String password = "password";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// get request parameters for userID and password
		String user = request.getParameter("username");
		String pwd = request.getParameter("password");

		if (userID.equals(user) && password.equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", userID);
			// setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30 * 60);
			Cookie userName = new Cookie("user", user);
			userName.setMaxAge(30 * 60);
			response.addCookie(userName);
			response.sendRedirect("/FileUpload.jsp");
		} else {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/login.jsp");
			request.setAttribute(
					"errorMessage",
					"<font color=red><strong>Error!</strong> Either user name or password is wrong.</font>");
			rd.include(request, response);
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			response.sendRedirect("/upload");
		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
