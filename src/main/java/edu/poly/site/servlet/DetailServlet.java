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
import edu.poly.dao.VideoDao;
import edu.poly.model.Video;

@WebServlet("/Detail")
public class DetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy thông tin videoId người dùng truyền vào
		String videoId = request.getParameter("videoId");

		// nếu == null --> chuyển tới homepage
		if (videoId == null) {
			response.sendRedirect("/Homepage");
		}

		try {
			// tạo đối tượng dao
			VideoDao dao = new VideoDao();
			Video video = dao.findById(videoId);

			// thiết lập đối tượng video
			request.setAttribute("video", video);


		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error : " + e.getMessage());
		}
		findAll(request, response);
		//Thiết lập thuộc tính videoId
				request.setAttribute("videoId", videoId);
		// Chuyển trang
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_DETAIL_PAGE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	
	private void findAll(HttpServletRequest request, HttpServletResponse response) {


		try {
			
			//tạo đối tượng dao
			VideoDao dao = new VideoDao();
			
			List<Video> list = dao.FindAll();
			
			
			//thiết lập đối tượng video
			request.setAttribute("videos", list);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", "Error : " + e.getMessage());
		}
		
	}

}
