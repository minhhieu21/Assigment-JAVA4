package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.UploadUtils;
import edu.poly.dao.UserDao;
import edu.poly.dao.VideoDao;
import edu.poly.model.User;
import edu.poly.model.Video;

@WebServlet({ "/Admin/UsersManagement", "/Admin/UsersManagement/create", "/Admin/UsersManagement/update",
		"/Admin/UsersManagement/delete", "/Admin/UsersManagement/reset", "/Admin/UsersManagement/edit" })
@MultipartConfig

public class UsersManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURL().toString();

		if (url.contains("edit")) {
			edit(request, response);
			return;
		}
		if (url.contains("delete")) {
			delete(request, response);
			return;
		}
		if (url.contains("reset")) {
			reset(request, response);
			return;
		}

		User user = new User();

		findAll(request, response);
		request.setAttribute("user", user);

		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();

		if (url.contains("create")) {
			create(request, response);
			return;
		}
		if (url.contains("delete")) {
			delete(request, response);
			return;
		}
		if (url.contains("update")) {
			update(request, response);
			return;
		}
		if (url.contains("reset")) {
			reset(request, response);
			return;
		}
	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) {
		try {

			// tạo đối tượng dao
			UserDao dao = new UserDao();

			List<User> list = dao.FindAll();

			// thiết lập đối tượng user
			request.setAttribute("users", list);

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error : " + e.getMessage());
		}

	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Tạo ra đối tượng user
				User user = new User();
				
				
				//Thiết lập thuộc tính video
				request.setAttribute("user", user);
				
				//Hiển thị tất cả video có trong CSDL
				findAll(request, response);
				
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lấy id người dùng cần xóa
		String id = request.getParameter("username");
		
		//Nếu id == null hiển thị tbao lỗi, nạp trang
		if (id == null) {
			request.setAttribute("error", "Username is required !");
			PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		
		try {
			//tạo đối tượng dao
			UserDao dao = new UserDao();
			
			//tìm kiếm video theo id
			User user = dao.findById(id);
			
			//nếu kh tìm thấy videoID ->> video kh tồn tạo
			if (user == null) {
				request.setAttribute("error", "Username is required !");
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
				return;
			}
			//Ngược lại
			
			//thực hiện delete
			dao.delete(id);
			
			//Hiển thị thông báo
			request.setAttribute("message", "Delete user success !");

			//Thiết lập hiển thị trên form ->> RỖNG
			request.setAttribute("user", new User());
			
			//hiển thị tất cả video có trong CSDL
			findAll(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", "Error : " + e.getMessage());
		}
		
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lấy id người dùng nhập
				String id = request.getParameter("username");
				
				//Nếu == null hiển thị tbao lỗi, nạp trang
				if (id == null) {
					request.setAttribute("error", "Username is required !");
					PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
					return;
				}
				
				try {
					//tạo đối tượng dao
					UserDao dao = new UserDao();
					User user = dao.findById(id);
					
					//thiết lập đối tượng video
					request.setAttribute("user", user);
					
					//
					findAll(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
					
					request.setAttribute("error", "Error : " + e.getMessage());
				}
				
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();

		try {
			//Lấy thông tin người dùng
			BeanUtils.populate(user, request.getParameterMap());
			
			//tạo đối tượng dao
			UserDao dao = new UserDao();
			
			
			//thực hiện update
			dao.update(user);
			
			
			
			//thiết lập đối tượng video
			request.setAttribute("user", user);
			
			//hiển thị thông báo
			request.setAttribute("message", "User update success ! ");
			
			//
			findAll(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", "Error : " + e.getMessage());
		}
		
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();

		try {
			BeanUtils.populate(user, request.getParameterMap());
			


			UserDao dao = new UserDao();
			dao.insert(user);

			request.setAttribute("user", user);
			request.setAttribute("message", "User is inserted!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		
		//
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

}
