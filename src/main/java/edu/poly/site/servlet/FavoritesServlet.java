package edu.poly.site.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesssionUtils;
import edu.poly.dao.FavoriteDao;
import edu.poly.dao.VideoDao;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.domain.MyFavorite;
import edu.poly.model.User;
import edu.poly.model.Video;


@WebServlet("/Favorites")
public class FavoritesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Kiểm tra người dùng đã đăng nhập chưa 
				if (!SesssionUtils.isLogin(request)) {
					response.sendRedirect("Login");
					return;
				}
				UserFavorites(request, response);
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FAVORITES_PAGE);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void UserFavorites(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			
			//Lấy thông tin user đang đăng nhập
			String username = SesssionUtils.getLoginedUsername(request);
			User user = new User();
			user.setUsername(username);
			
			//Tạo video dao ->> lấy danh sách tất cả các video để hiển thị 
			VideoDao vdao = new VideoDao();
			List<MyFavorite> list = vdao.FavoritedByUser(username);
			

			//Thiết lập thuộc tính ->> Giúp hiển thị trên view
			request.setAttribute("username", username);

			request.setAttribute("myList", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :" + e.getMessage());
		}
	}

}
