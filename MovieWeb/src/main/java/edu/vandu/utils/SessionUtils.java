package edu.vandu.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
	
	public static void addSessionAttribute(HttpServletRequest request, String attributeName, Object attributeValue) {
		HttpSession session = request.getSession(true);
		session.setAttribute(attributeName, attributeValue);
	}

	public static Object getSessionAttribute(HttpServletRequest request, String attributeName) {
		HttpSession session = request.getSession();
		return session != null ? session.getAttribute(attributeName) : null;
	}

	public static void removeSessionAttribute(HttpServletRequest request, String attributeName) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute(attributeName);
		}
	}

	public static void invalidateSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
	}
}
