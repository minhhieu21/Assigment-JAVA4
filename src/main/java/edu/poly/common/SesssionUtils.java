package edu.poly.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SesssionUtils {
	
	//Lưu  thuộc tính đối tượng session 
	public static void add(HttpServletRequest req, String name, Object value) {
		HttpSession session = req.getSession();
		session.setAttribute(name, value);
	}
	
	//Lấy giá trị thuộc tính được truyền vào ở trong đối tương session
	public static Object get(HttpServletRequest req, String name) {
		HttpSession session = req.getSession();
		
		return session.getAttribute(name);
	}
	
	//Hủy bỏ session
	public static void invalidate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		session.removeAttribute("username");
		
		session.invalidate();
	}
	
	//Kiểm tra người dùng đăng nhập hay chưa ?
	public static boolean isLogin(HttpServletRequest req) {
		return get(req, "username") != null;
	}
	
	//Trả về giá trị username đã đăng nhập vào hệ thống 
	public static String getLoginedUsername(HttpServletRequest req) {
		Object username = get(req, "username");
		return username == null? null: username.toString();
	}
}
