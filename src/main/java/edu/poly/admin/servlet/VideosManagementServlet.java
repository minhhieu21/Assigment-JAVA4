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
			//L???y th??ng tin ng?????i d??ng
			BeanUtils.populate(video, request.getParameterMap());
			
			//t???o ?????i t?????ng dao
			VideoDao dao = new VideoDao();
			
			//N???u ng?????i d??ng kh??ng thay ?????i h??nh ???nh ->> L???y h??nh ???nh c??
			Video oldVideo = dao.findById(video.getVideoId());
			if (request.getPart("cover").getSize()==0) {
				video.setPoster(oldVideo.getPoster());
			
			//L??u th??ng tin h??nh ???nh m???i
			}else {
				video.setPoster("uploads/" + UploadUtils.processUploadField("cover", request, "/uploads", video.getVideoId()));
			}
			
			//th???c hi???n update
			dao.update(video);
			
			
			
			//thi???t l???p ?????i t?????ng video
			request.setAttribute("video", video);
			
			//hi???n th??? th??ng b??o
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
			
			//t???o ?????i t?????ng dao
			VideoDao dao = new VideoDao();
			
			List<Video> list = dao.FindAll();
			
			
			//thi???t l???p ?????i t?????ng video
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
		//T???o ra ?????i t?????ng video
		Video video = new Video();
		
		//Thi???t l???p h??nh ???nh m???c ?????nh
		video.setPoster("images/iphone-12-pro-max-xanh-duong-new-600x600-org.jpg");
		
		//Thi???t l???p thu???c t??nh video
		request.setAttribute("video", video);
		
		//Hi???n th??? t???t c??? video c?? trong CSDL
		findAll(request, response);
		
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//l???y id ng?????i d??ng c???n x??a
				String id = request.getParameter("videoId");
				
				//N???u id == null hi???n th??? tbao l???i, n???p trang
				if (id == null) {
					request.setAttribute("error", "Video ID is required !");
					PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
					return;
				}
				
				try {
					//t???o ?????i t?????ng dao
					VideoDao dao = new VideoDao();
					
					//t??m ki???m video theo id
					Video video = dao.findById(id);
					
					//n???u kh t??m th???y videoID ->> video kh t???n t???o
					if (video == null) {
						request.setAttribute("error", "Video ID is required !");
						PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
						return;
					}
					//Ng?????c l???i
					
					//th???c hi???n delete
					dao.delete(id);
					
					//Hi???n th??? th??ng b??o
					request.setAttribute("message", "Delete video success !");

					//Thi???t l???p hi???n th??? tr??n form ->> R???NG
					request.setAttribute("video", new Video());
					
					//hi???n th??? t???t c??? video c?? trong CSDL
					findAll(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
					
					request.setAttribute("error", "Error : " + e.getMessage());
				}
				
				PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//l???y id ng?????i d??ng nh???p
		String id = request.getParameter("videoId");
		
		//N???u == null hi???n th??? tbao l???i, n???p trang
		if (id == null) {
			request.setAttribute("error", "Video ID is required !");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		
		try {
			//t???o ?????i t?????ng dao
			VideoDao dao = new VideoDao();
			Video video = dao.findById(id);
			
			//thi???t l???p ?????i t?????ng video
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
