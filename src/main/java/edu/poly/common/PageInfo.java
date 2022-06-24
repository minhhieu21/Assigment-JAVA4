package edu.poly.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	
	public static Map<PageType, PageInfo> pageRoute = new HashedMap();
	
	static {
		pageRoute.put(PageType.USER_MANAGEMENT_PAGE, new PageInfo("User Management", "/admin/users/users.jsp", null));
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE, new PageInfo("Reports Management", "/admin/reports/reports.jsp", null));
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE, new PageInfo("Video Management", "/admin/videos/videos.jsp", null));
		pageRoute.put(PageType.ADMIN_HOME_PAGE, new PageInfo("HOME", "/admin/home/home.jsp", null));
		
		pageRoute.put(PageType.SITE_HOME_PAGE, new PageInfo("HOME", "/site/home/home.jsp", null));
		
		pageRoute.put(PageType.SITE_LOGIN_PAGE, new PageInfo("LOGIN TO SYSTEM", "/site/users/login.jsp", null));
		pageRoute.put(PageType.SITE_REGISTRATION_PAGE, new PageInfo("REGISTRATION", "/site/users/registration.jsp", null));
		pageRoute.put(PageType.SITE_CHANGEPASSWORD_PAGE, new PageInfo("CHANGE PASSWORD", "/site/users/change-password.jsp", null));
		pageRoute.put(PageType.SITE_EDIT_PROFILE_PAGE, new PageInfo("EDIT PROFILE", "/site/users/edit-profile.jsp", null));
		pageRoute.put(PageType.SITE_FORGOTPASSWORD_PAGE, new PageInfo("FORGOTPASSWORD", "/site/users/forgot-password.jsp", null));
		
		pageRoute.put(PageType.SITE_DETAIL_PAGE, new PageInfo("DETAIL", "/site/videos/detail.jsp", null));
		pageRoute.put(PageType.SITE_FAVORITES_PAGE, new PageInfo("FAVORITES", "/site/videos/favorite.jsp", null));
		pageRoute.put(PageType.SITE_SHARE_PAGE, new PageInfo("SHARE", "/site/videos/share.jsp", null));
	}
	
	public static void prepareAndForward (HttpServletRequest req, HttpServletResponse resp, PageType pageType) 
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		
		req.setAttribute("page", page);
		
		req.getRequestDispatcher("/admin/layout.jsp").forward(req, resp);
	}
	
	public static void prepareAndForwardSite (HttpServletRequest req, HttpServletResponse resp, PageType pageType) 
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		
		req.setAttribute("page", page);
		
		req.getRequestDispatcher("/site/layout.jsp").forward(req, resp);
	}
	
	private String title;
	private String contentUrl;
	private String scriptUrl;
	
	
	public PageInfo(String title, String contentUrl, String scriptUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.scriptUrl = scriptUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentUrl() {
		return contentUrl;
	}
	public void setContentUtl(String contentUrl) {
		this.contentUrl = contentUrl;
	}
	public String getScriptUrl() {
		return scriptUrl;
	}
	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}
}
