package edu.vandu.utils;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.vandu.model.User;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("/admin/*")
public class AuthFilter extends HttpFilter implements Filter {

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("đã bâbbababab");;

		try {
			User user = (User) SessionUtils.getSessionAttribute(request, "user");

			if (user == null) {

				throw new Exception();
			}
			if (user.getRole()) {
				chain.doFilter(request, response);
			} else {
				throw new Exception();
			}
//			chain.doFilter(request, response);
		} catch (Exception e) {
			response.sendRedirect("/MovieWeb/home");
		}
	}

}
