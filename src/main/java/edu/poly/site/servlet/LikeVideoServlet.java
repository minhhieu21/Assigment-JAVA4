package edu.poly.site.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesssionUtils;
import edu.poly.dao.FavoriteDao;
import edu.poly.dao.UserDao;
import edu.poly.dao.VideoDao;
import edu.poly.model.Favorite;
import edu.poly.model.User;
import edu.poly.model.Video;


@WebServlet("/LikeVideo")
public class LikeVideoServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Kiểm tra người dùng đã đăng nhập chưa 
				if (!SesssionUtils.isLogin(request)) {
					response.sendRedirect("Login");
					return;
				}
				
				//Lấy thông tin người dùng đang dùng
				String page = request.getParameter("page");
				
				//Lấy thông tin videoId người dùng truyền vào
				String videoId = request.getParameter("videoId");
				System.out.println(videoId);
				
				//nếu videoId == null --> chuyển tới homepage
				if (videoId == null) {
					response.sendRedirect("/Homepage");
				}
				
				String username = (String) request.getSession().getAttribute("username");
				User user = UserDao.getUserId(username);
				System.out.println(user.getUsername());
				Video video = VideoDao.getVideoId(videoId);
				System.out.println(video.getVideoId());
				
				
				Favorite f = FavoriteDao.getFavoriteKeyword(user, video);
				System.out.println(f);
				
				if (f == null) {
					// f == null thi chua co user nay like cai video do
					// chua co thi minh them favorite vao
					FavoriteDao.createFavorite(user, video);
					request.setAttribute("message", "The video is Liked !!");
				}
				else {
//					FavoriteDao.deleteFavorite(user, video);
					request.setAttribute("error", "The video is Unlike !!");
				}
				request.getRequestDispatcher("/Homepage").forward(request, response);
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
