package edu.poly.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.CookieUtils;
import edu.poly.common.SesssionUtils;

/**
 * Servlet implementation class LogoffServlet
 */
@WebServlet("/LogoffAdmin")
public class LogoffServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CookieUtils.add("username", null, 0, response);
		
		SesssionUtils.invalidate(request);
		
		request.setAttribute("isLogin", false);
		request.getRequestDispatcher("/Login").forward(request, response);
	}

}
