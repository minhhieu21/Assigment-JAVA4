package edu.poly.site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesssionUtils;
import edu.poly.dao.UserDao;
import edu.poly.model.User;

@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Đọc username người dùng đã đăng nhập
		String username = SesssionUtils.getLoginedUsername(request);
		
		
		//Kiểm tra nếu người dùng chưa đăng nhập ->> chuyển tới trang login
		if (username == null) {
			request.getRequestDispatcher("/Login").forward(request, response);
			return;
		}
		
		try {
			UserDao dao = new UserDao();
			User user = dao.findById(username);
			//trả về đối tượng user
			
			//Thiết lập đối tượng user lên form
			request.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_EDIT_PROFILE_PAGE);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			User user = new User();
			//Lấy thông tin người dùng nhập trên form
			BeanUtils.populate(user, request.getParameterMap());
			
			//Lấy thông tin username đăng nhập hiện tại
			String username = SesssionUtils.getLoginedUsername(request);
			UserDao dao = new UserDao();
			
			//Tìm kiếm username., trả về oldUser
			User oldUser = dao.findById(username);
			
			//Ko được thay đổi
			user.setAdmin(oldUser.getAdmin());
			
			//Cập nhật
			dao.update(user);
			
			//Thông báo và hiển thị lại thông tin user
			request.setAttribute("message ", "User profile updated !");	
			request.setAttribute("user", user);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_EDIT_PROFILE_PAGE);
	}

}
