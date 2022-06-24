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
import edu.poly.dao.VideoDao;
import edu.poly.model.Video;

@WebServlet({ "/Admin/VideosManagement", "/Admin/VideosManagement/create", "/Admin/VideosManagement/update",
		"/Admin/VideosManagement/delete", "/Admin/VideosManagement/reset", "/Admin/VideosManagement/edit" })
@MultipartConfig

public class VideosManagementServlet extends HttpServlet {

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
		
		Video video = new Video();
		video.setPoster("images/nokia-x60-600x600.jpg");
		
		findAll(request, response);
		request.setAttribute("video", video);
		
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
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

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Video video = new Video();

		try {
			//Lấy thông tin người dùng
			BeanUtils.populate(video, request.getParameterMap());
			
			//tạo đối tượng dao
			VideoDao dao = new VideoDao();
			
			//Nếu người dùng không thay đổi hình ảnh ->> Lấy hình ảnh cũ
			Video oldVideo = dao.findById(video.getVideoId());
			if (request.getPart("cover").getSize()==0) {
				video.setPoster(oldVideo.getPoster());
			
			//Lưu thông tin hình ảnh mới
			}else {
				video.setPoster("uploads/" + UploadUtils.processUploadField("cover", request, "/uploads", video.getVideoId()));
			}
			
			//thực hiện update
			dao.update(video);
			
			
			
			//thiết lập đối tượng video
			request.setAttribute("video", video);
			
			//hiển thị thông báo
			request.setAttribute("message", "Video update success ! ");
			
			//
			findAll(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", "Error : " + e.getMessage());
		}
		
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		
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

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Video video = new Video();

		try {
			BeanUtils.populate(video, request.getParameterMap());
			
			video.setPoster("uploads/" + UploadUtils.processUploadField("cover", request, 
					"/uploads", video.getVideoId()));

			VideoDao dao = new VideoDao();
			dao.insert(video);

			request.setAttribute("video", video);
			request.setAttribute("message", "Video is inserted!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		
		//
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Tạo ra đối tượng video
		Video video = new Video();
		
		//Thiết lập hình ảnh mặc định
		video.setPoster("images/iphone-12-pro-max-xanh-duong-new-600x600-org.jpg");
		
		//Thiết lập thuộc tính video
		request.setAttribute("video", video);
		
		//Hiển thị tất cả video có trong CSDL
		findAll(request, response);
		
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lấy id người dùng cần xóa
				String id = request.getParameter("videoId");
				
				//Nếu id == null hiển thị tbao lỗi, nạp trang
				if (id == null) {
					request.setAttribute("error", "Video ID is required !");
					PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
					return;
				}
				
				try {
					//tạo đối tượng dao
					VideoDao dao = new VideoDao();
					
					//tìm kiếm video theo id
					Video video = dao.findById(id);
					
					//nếu kh tìm thấy videoID ->> video kh tồn tạo
					if (video == null) {
						request.setAttribute("error", "Video ID is required !");
						PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
						return;
					}
					//Ngược lại
					
					//thực hiện delete
					dao.delete(id);
					
					//Hiển thị thông báo
					request.setAttribute("message", "Delete video success !");

					//Thiết lập hiển thị trên form ->> RỖNG
					request.setAttribute("video", new Video());
					
					//hiển thị tất cả video có trong CSDL
					findAll(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
					
					request.setAttribute("error", "Error : " + e.getMessage());
				}
				
				PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lấy id người dùng nhập
		String id = request.getParameter("videoId");
		
		//Nếu == null hiển thị tbao lỗi, nạp trang
		if (id == null) {
			request.setAttribute("error", "Video ID is required !");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		
		try {
			//tạo đối tượng dao
			VideoDao dao = new VideoDao();
			Video video = dao.findById(id);
			
			//thiết lập đối tượng video
			request.setAttribute("video", video);
			
			//
			findAll(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", "Error : " + e.getMessage());
		}
		
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

}
