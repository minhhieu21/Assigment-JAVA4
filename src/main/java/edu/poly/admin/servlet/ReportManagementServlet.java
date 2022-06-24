package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.FavoriteDao;
import edu.poly.dao.VideoDao;
import edu.poly.domain.FavoriteReport;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.model.Video;

@WebServlet("/ReportManagement")
public class ReportManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reportFavoriteByVideo(request, response);
		reportFavoriteUserByVideo(request, response);
		
		
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void reportFavoriteByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteReport> list = dao.reportFavoritesByVideos();

			request.setAttribute("favList", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :" + e.getMessage());
		}
	}
	
	protected void reportFavoriteUserByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			
			//Lấy video người dùng lựa chọn
			String videoUserId = request.getParameter("videoUserId");
			
			//Tạo video dao ->> lấy danh sách tất cả các video để hiển thị lên combobox
			VideoDao vdao = new VideoDao();
			List<Video> vlist = vdao.FindAll();
			
			//Kiểm tra nếu người dùng chưa chọn video 	
			if (videoUserId == null && vlist.size()>0) {
				// ->> Thiết lập giá trị mặc định : Lấy mã video đầu tiên
				videoUserId = vlist.get(0).getVideoId();
			}
			
			//Trả lại danh sách thông tin người dùng yêu thích video
			FavoriteDao fdao = new FavoriteDao();
			List<FavoriteUserReport> list = fdao.reportFavoriteUsersByVideo(videoUserId);

			
			//Thiết lập thuộc tính ->> Giúp hiển thị trên view
			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vlist);
			request.setAttribute("favUserList", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :" + e.getMessage());
		}
	}
}
