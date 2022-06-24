package edu.poly.site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.EmailUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.UserDao;
import edu.poly.domain.Email;
import edu.poly.model.User;


@WebServlet("/ForgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FORGOTPASSWORD_PAGE);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Lấy username và email từ form người dùng đã nhập
			String emailAddress = request.getParameter("email");
			String username = request.getParameter("username");
			
			//tạo userdao, thực hiện findByUsernameAndEmail
			UserDao dao = new UserDao();
			User user = dao.findByUsernameAndEmail(username, emailAddress);
			
			//nếu tìm kh thấy --> hiển thị thông báo cho người dùng
			if(user == null) {
				request.setAttribute("error", "Username or email are incorrect");
			
			}else { //tìm thấy
				//Tạo dựng nội dung chi tiết của mail
				Email email = new Email();
				email.setFrom("haideptrai210402@gmail.com");
				email.setFromPassword("minhhieu21");
				email.setTo(emailAddress);
				email.setSubject("Forgot Password Function");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear").append(username).append("<br>");
				sb.append("You are used the forgot password function. <br>");
				sb.append("Your password is <b>").append(user.getPassword()).append("</b>");
				sb.append("Regards<br>");
				sb.append("Administrator");
				
				email.setContent(sb.toString());
				//gửi mail
				EmailUtils.send(email);
				
				//hiển thị thông báo cho người dùng
				request.setAttribute("message", "Email sent to the email Address. Please chech and get your password");
			}
		}catch(Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FORGOTPASSWORD_PAGE);
	}

}
