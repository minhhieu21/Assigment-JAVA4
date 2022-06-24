package edu.poly.site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.CookieUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesssionUtils;
import edu.poly.dao.UserDao;
import edu.poly.domain.LoginForm;
import edu.poly.model.User;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Lấy thông tin cookie
		String username = CookieUtils.get("username", request);
		
		//Cookie chưa tồn tại -> Nạp trang đăng nhập
		if (username == null) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);
			return;
		}
		
		//Lưu thông tin username ở session
		SesssionUtils.add(request, "username", username);
		
		//Chuyển tới trang Homepage
		request.getRequestDispatcher("/Homepage").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			LoginForm form = new LoginForm();
			
			//Lấy dữ liệu form người dùng nhập vào
			BeanUtils.populate(form, request.getParameterMap());
			
			UserDao dao = new UserDao();
			//Tìm kiếm thông tin người dùng theo username
			User user = dao.findById(request.getParameter("username"));
			
			
			
			String p = request.getParameter("password").trim();
			
			
			
			//Nếu tìm thấy đối tượng user và tiếp tục kiểm tra password
			if (user != null && user.getPassword().trim().equals(p)) {	
				
				
				//Tạo session
				SesssionUtils.add(request, "username", user.getUsername());
				
				//Nếu người dùng remember ->> Thêm cookie username tồn tại 24h
				if (form.isRemember()) {
					CookieUtils.add("username", form.getUsername(), 24, response);
				
				//Xóa cookie
				}else {
					CookieUtils.add("username", form.getUsername(), 0, response);
				}
				
				if (user.getAdmin()==false) {
					request.getRequestDispatcher("/Homepage").include(request, response);
				}
				else {
					PageInfo.prepareAndForward(request, response, PageType.ADMIN_HOME_PAGE);
					request.setAttribute("isLogin", true);
					return;
				}
				
				request.setAttribute("isLogin", true);
				request.setAttribute("name", user.getFullname());
				
				return;
			}		
			else {
				request.setAttribute("error", "Invalid username or password");
			}
			
			
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);
		
	}

}
