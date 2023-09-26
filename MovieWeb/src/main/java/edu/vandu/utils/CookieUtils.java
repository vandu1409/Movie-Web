package edu.vandu.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	public static String get(String name, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
				
			}
		}
		
		return "";
	}

	public static Cookie add(String name, String value, int hour, HttpServletResponse response) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(hour * 60 * 60);
		response.addCookie(cookie);

		return cookie;
	}
}
