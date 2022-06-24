package edu.poly.site.servlet;

import java.io.IOException;
import java.util.Date;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.manager.util.SessionUtils;

import edu.poly.common.EmailUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesssionUtils;
import edu.poly.dao.ShareDao;
import edu.poly.dao.UserDao;
import edu.poly.domain.Email;
import edu.poly.model.Share;
import edu.poly.model.User;
import edu.poly.model.Video;

/**
 * Servlet implementation class ShareVideoServlet
 */
@WebServlet("/ShareVideo")
public class ShareVideoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Kiểm tra người dùng đã đăng nhập chưa 
		if (!SesssionUtils.isLogin(request)) {
			response.sendRedirect("Login");
			return;
		}
		
		//Lấy thông tin videoId người dùng truyền vào
		String videoId = request.getParameter("videoId");
		
		//nếu == null --> chuyển tới homepage
		if (videoId == null) {
			response.sendRedirect("/Homepage");
		}
		
		//Thiết lập thuộc tính
		request.setAttribute("videoId", videoId);
		
		//Chuyển trang
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_SHARE_PAGE); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Lấy username và email từ form người dùng đã nhập
			String emailAddress = request.getParameter("email");
			String videoId = request.getParameter("videoId");
			String fullname = request.getParameter("fullname");
			String sdt = request.getParameter("sdt");
			String content = request.getParameter("content");

			//nếu tìm kh thấy --> hiển thị thông báo cho người dùng
			if(videoId == null) {
				request.setAttribute("error", "VideoId is not null !");
			
			}else { //tìm thấy
				//Tạo dựng nội dung chi tiết của mail
				Email email = new Email();
				email.setFrom("haideptrai210402@gmail.com");
				email.setFromPassword("minhhieu21");
				email.setTo(emailAddress);
				email.setSubject("Share Fovorites Video");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear Ms/Mr : " +fullname +"<br>");
				sb.append(content+"<br>");
				sb.append("Please click the link ").append(String.format("<a href=''>View Video </a> <br>", videoId));		
				
				
				sb.append("Administrator");
				
				email.setContent(sb.toString());
				//gửi mail
				EmailUtils.send(email);
				
				//tạo đối tượng sharedao
				ShareDao dao = new ShareDao();
				Share share = new Share();
				
				//thiết lập các thông tin
				share.setEmails(emailAddress);
				share.setSharedDate(new Date());
				
				//Lấy thông tin user đang đăng nhập
				String username = SesssionUtils.getLoginedUsername(request);
				User user = new User();
				user.setUsername(username);
				
				
				share.setUser(user);
				
				Video video = new Video();
				video.setVideoId(videoId);
				share.setVideo(video);
				
				dao.insert(share);
				
				//hiển thị thông báo cho người dùng
				request.setAttribute("message", "Video link has sent !");
			}
		}catch(Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_SHARE_PAGE);
	}

}
