package edu.vandu.controller.site;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import edu.vandu.dao.TokenDao;
import edu.vandu.dao.UserDao;
import edu.vandu.enums.TokenType;
import edu.vandu.helper.FileHelper;
import edu.vandu.model.Email;
import edu.vandu.model.Token;
import edu.vandu.model.User;
import edu.vandu.utils.EmailUtils;
import edu.vandu.utils.SessionUtils;

@MultipartConfig
@WebServlet(urlPatterns = { "/register", "/login", "/confirm", "/logout", "/profile", "/profile/changeInfo",
		"/profile/changePass", "/profile/uploadAvatar" })
public class UserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI().toString();
		TokenDao tokenDao = new TokenDao();
		UserDao userDao = new UserDao();

		if (uri.contains("register")) {
			request.getRequestDispatcher("/views/site/register.jsp").forward(request, response);
		} else if (uri.contains("confirm")) {
			String codeToken = request.getParameter("token");
			Token token = tokenDao.getToken(codeToken);
			if (token != null) {

				if (token.getTokenType().equals(TokenType.REGISTER_TOKEN)) {

					User user = tokenDao.getUserByToken(codeToken);
					user.setActivated(true);

					userDao.update(user);

					request.setAttribute("message", "Đăng ký thành công!");
					tokenDao.delete(token);
					request.getRequestDispatcher("/views/site/message.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("message", "Tài khoản đã được xác thực!");
				request.getRequestDispatcher("/views/site/message.jsp").forward(request, response);
			}
		} else if (uri.contains("login")) {
			request.getRequestDispatcher("/views/site/login.jsp").forward(request, response);
		} else if (uri.contains("logout")) {
//			SessionUtils.removeSessionAttribute(request, "user");
//			HttpSession session = request.getSession();
			request.getSession().removeAttribute("user");

			response.sendRedirect("/MovieWeb/home");
		} else if (uri.contains("profile")) {
			request.getRequestDispatcher("/views/site/profile.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String uri = request.getRequestURI().toString();

		if (uri.contains("register")) {
			resgister(request, response);

		} else if (uri.contains("login")) {

			login(request, response);
		} else if (uri.contains("profile")) {

			profile(request, response);
		}

	}

	protected void resgister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String role = request.getParameter("admin");

		try {
			UserDao userDao = new UserDao();
			TokenDao tokenDao = new TokenDao();
			User user = new User();
			Token token = new Token();

			BeanUtils.populate(user, request.getParameterMap());
			user.setActivated(false);
			user.setDelete(false);
			if (role != null) {
				user.setRole(true);
			} else {
				user.setRole(false);
			}

			userDao.insert(user);

			UUID uuid = UUID.randomUUID();

			token.setToken(uuid.toString());
			token.setCreateAt(new Date());
			token.setExpriedAt(new Date(System.currentTimeMillis() + 15 * 60 * 100));
			token.setTokenType(TokenType.REGISTER_TOKEN);
			token.setUser(user);

			tokenDao.insert(token);

			Email email = new Email();
			email.setFrom("vandu18082003nv@gmail.com");
			email.setFromPassword("hbuivzczomvmdpuj");
			email.setTo(user.getEmail());
			email.setSubject("REGISTER USER");
			String htmlContent = "<html><body>" + "<h3>Please click on the button below to confirm your account:</h3>"
					+ "<a href=\"http://localhost:8080" + request.getContextPath() + "/confirm?token="
					+ token.getToken() + "\">"
					+ "<button style=\"background-color: #4CAF50; color: white; border: none; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;\">Confirm Account</button>"
					+ "</a><br><p><b>Thank you!</b></p></body></html>";

			email.setContent(htmlContent);

			// gửi email
			EmailUtils.send(email);

			System.out.println("Thành công");
			out.print("{\"message\":\"Đăng ký thành công ! Vui lòng kiểm tra email!\"}");
			out.flush();

		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			UserDao userDao = new UserDao();
			User user = new User();

			BeanUtils.populate(user, request.getParameterMap());

			User currentUser = userDao.findById(user.getUsername());

			if (currentUser != null) {
				if (user.getPassword().equalsIgnoreCase(currentUser.getPassword())) {
//					SessionUtils.addSessionAttribute(request, "user", currentUser);

//					HttpSession session = request.getSession();

					if (currentUser.isActivated() == false) {

						request.setAttribute("user", user);
						request.setAttribute("message", "Tài khoản chưa được xác thực!");
						request.getRequestDispatcher("/views/site/login.jsp").forward(request, response);
						return;

					}

					if (currentUser.isDelete()) {
						request.setAttribute("user", user);
						request.setAttribute("message", "Tài khoản đã bị xóa khỏi hệ thống!!");
						request.getRequestDispatcher("/views/site/login.jsp").forward(request, response);
						return;
					}

					request.getSession().setAttribute("user", currentUser);
					response.sendRedirect("/MovieWeb/home");
					return;
				} else {
					request.setAttribute("passError", "Mật khẩu không chính xác!");
				}
			} else {

				request.setAttribute("userError", "Không tìm thấy tên đăng nhập!");
			}

			request.setAttribute("user", user);
			request.getRequestDispatcher("/views/site/login.jsp").forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	protected void profile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI().toString();
		try {

			if (uri.contains("changeInfo")) {
				changeInfo(request, response);
			} else if (uri.contains("changePass")) {
				changePassword(request, response);
			} else if (uri.contains("uploadAvatar")) {
				updateAvatar(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void changeInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter(); 
		try {
			UserDao userDao = new UserDao();
			User user = (User) SessionUtils.getSessionAttribute(request, "user");
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");

			if (fullname != null && !fullname.isEmpty()) {
				user.setFullname(fullname);
			}

			if (email != null && !email.isEmpty()) {
				user.setEmail(email);
			}
			
			userDao.update(user);
			SessionUtils.addSessionAttribute(request, "user", user);
			out.print("{\"message\":\"Thay đổi thông tin thành công!\"}");
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("{\"error\":\"Thay đổi thông tin thất bại!\"}");
			out.flush();
		}
	}

	protected void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		UserDao userDao = new UserDao();

		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String rePassword = request.getParameter("rePassword");

		System.out.println("Thành công");
		System.out.println(currentPassword);
		System.out.println(newPassword);
		System.out.println(rePassword);

		User userSession = (User) request.getSession().getAttribute("user");

		System.out.println(userSession.getPassword());
		if (userSession.getPassword().equalsIgnoreCase(currentPassword)) {

			if (newPassword.equalsIgnoreCase(rePassword)) {
				userSession.setPassword(newPassword);
				userDao.update(userSession);
				request.getSession().setAttribute("user", userSession);
				System.out.println("asasagsg");

				out.print("{\"message\":\"Đổi mật khẩu thành công!\"}");
				out.flush();
			} else {
				out.print("{\"message\":\"Mật khẩu không trùng khớp!\"}");
				out.flush();
				System.out.println("asasagsg1");
			}

		} else {
			out.print("{\"message\":\"Mật khẩu hiện tại không đúng!\"}");
			out.flush();

			System.out.println("asasagsg2");
		}

	}

	protected void updateAvatar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		System.out.println("đã gửi ảnh lên");

		UserDao userDao = new UserDao();

		User userSession = (User) request.getSession().getAttribute("user");

		Part image = request.getPart("image");

		if (image.getSize() > 0) {
			userSession.setAvatar(image.getSubmittedFileName());
			FileHelper.save(image, request);

			userDao.update(userSession);

			SessionUtils.addSessionAttribute(request, "user", userSession);
			out.print("{\"message\":\"Thay đổi ảnh đại diện thành công!\"}");
			out.flush();
//			request.setAttribute("message", "Thay đổi ảnh đại diện thành công!");

			return;
		}
//		request.setAttribute("message", "Thay đổi ảnh đại diện thất bại!");
		out.print("{\"message\":\"Thay đổi ảnh đại diện thất bại!\"}");
		out.flush();
	}

}
