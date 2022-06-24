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
import edu.poly.domain.ChangePasswordForm;

@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//kiểm tra user đăng nhập hay không
		String username = SesssionUtils.getLoginedUsername(request);
		
		//Nếu user == null --> hiển thị trang login
		if (username == null) {
			request.getRequestDispatcher("/Login").forward(request, response);
			return;
		}
		
		//Đăng nhập --> thiếp lập  
		request.setAttribute("username", username);
		
		//Hiển thị form change password
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGEPASSWORD_PAGE);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//Lấy thông tin username người dùng đang đăng nhập 
			String username = SesssionUtils.getLoginedUsername(request);
			
			//Tạo đối tượng changpepassword form
			ChangePasswordForm form = new ChangePasswordForm();
			
			//Lấy dữ liệu người dùng nhập 
			BeanUtils.populate(form, request.getParameterMap());
			
			//Thiết lập thuộc tính
			request.setAttribute("username", username);
			
			//Nếu pass mới và nhập lại pass kh trùng nhau --> hiển thị thông báo
			if (!form.getCurrentPassword().equals(form.getConfirmPassword())) {
				request.setAttribute("error", "New password and new confirmpassword are not identicial !");
			
			}else {//trùng pass
				UserDao dao = new UserDao();
				//Change Password
				dao.changePassword(form.getUsername(), form.getPassword(), form.getCurrentPassword());
				request.setAttribute("message", "Change Password success !");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :" + e.getMessage());
		}
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_CHANGEPASSWORD_PAGE);
		
	}

}
