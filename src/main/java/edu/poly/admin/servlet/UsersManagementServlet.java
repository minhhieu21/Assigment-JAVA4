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

			// t???o ?????i t?????ng dao
			UserDao dao = new UserDao();

			List<User> list = dao.FindAll();

			// thi???t l???p ?????i t?????ng user
			request.setAttribute("users", list);

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error : " + e.getMessage());
		}

	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//T???o ra ?????i t?????ng user
				User user = new User();
				
				
				//Thi???t l???p thu???c t??nh video
				request.setAttribute("user", user);
				
				//Hi???n th??? t???t c??? video c?? trong CSDL
				findAll(request, response);
				
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//l???y id ng?????i d??ng c???n x??a
		String id = request.getParameter("username");
		
		//N???u id == null hi???n th??? tbao l???i, n???p trang
		if (id == null) {
			request.setAttribute("error", "Username is required !");
			PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		
		try {
			//t???o ?????i t?????ng dao
			UserDao dao = new UserDao();
			
			//t??m ki???m video theo id
			User user = dao.findById(id);
			
			//n???u kh t??m th???y videoID ->> video kh t???n t???o
			if (user == null) {
				request.setAttribute("error", "Username is required !");
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
				return;
			}
			//Ng?????c l???i
			
			//th???c hi???n delete
			dao.delete(id);
			
			//Hi???n th??? th??ng b??o
			request.setAttribute("message", "Delete user success !");

			//Thi???t l???p hi???n th??? tr??n form ->> R???NG
			request.setAttribute("user", new User());
			
			//hi???n th??? t???t c??? video c?? trong CSDL
			findAll(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", "Error : " + e.getMessage());
		}
		
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//l???y id ng?????i d??ng nh???p
				String id = request.getParameter("username");
				
				//N???u == null hi???n th??? tbao l???i, n???p trang
				if (id == null) {
					request.setAttribute("error", "Username is required !");
					PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
					return;
				}
				
				try {
					//t???o ?????i t?????ng dao
					UserDao dao = new UserDao();
					User user = dao.findById(id);
					
					//thi???t l???p ?????i t?????ng video
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
			//L???y th??ng tin ng?????i d??ng
			BeanUtils.populate(user, request.getParameterMap());
			
			//t???o ?????i t?????ng dao
			UserDao dao = new UserDao();
			
			
			//th???c hi???n update
			dao.update(user);
			
			
			
			//thi???t l???p ?????i t?????ng video
			request.setAttribute("user", user);
			
			//hi???n th??? th??ng b??o
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
