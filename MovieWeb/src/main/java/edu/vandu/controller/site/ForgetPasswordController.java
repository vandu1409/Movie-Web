package edu.vandu.controller.site;

import java.awt.DefaultKeyboardFocusManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.vandu.dao.TokenDao;
import edu.vandu.dao.UserDao;
import edu.vandu.enums.TokenType;
import edu.vandu.model.Email;
import edu.vandu.model.Token;
import edu.vandu.model.User;
import edu.vandu.utils.EmailUtils;

@WebServlet({ "/forgetpassword", "/forgetpassword/confirm", "/forgetpassword/changePassword" })
public class ForgetPasswordController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURL().toString();
		TokenDao tokenDao = new TokenDao();

		if (uri.contains("confirm")) {

			String tokenParam = request.getParameter("token");

			Token token = tokenDao.getToken(tokenParam);

			if (token != null) {
				if (token.getTokenType().equalsIgnoreCase(TokenType.FORGET_PASSWORD_TOKEN)) {

					if (token.checkExpried() == false) {
						request.setAttribute("token", tokenParam);
						request.getRequestDispatcher("/views/site/changePassword.jsp").forward(request, response);
						return;

					} else {
						request.setAttribute("message", "Đã hết thời gian quên mật khẩu!");
						request.getRequestDispatcher("/views/site/message.jsp").forward(request, response);
						return;
					}

				} else {
					request.setAttribute("message", "Đã xảy ra lỗi vui lòng thử lại!!");
					request.getRequestDispatcher("/views/site/message.jsp").forward(request, response);
					return;
				}

			} else {

				request.setAttribute("message", "Mật khẩu đã được đổi !Vui lòng kiểm tra lại!");
				request.getRequestDispatcher("/views/site/message.jsp").forward(request, response);
				return;
			}

		} else {
			request.getRequestDispatcher("/views/site/forgerpassword.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		TokenDao tokenDao = new TokenDao();

		String uri = request.getRequestURL().toString();

		if (uri.contains("changePassword")) {
			changePassword(request, response);

		} else {
			forgetPassword(request, response);
		}

	}

	protected void forgetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		UserDao userDao = new UserDao();
		TokenDao tokenDao = new TokenDao();

		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());

			User currentUser = userDao.findByUsernameAndEmail(user.getUsername(), user.getEmail());

			if (currentUser != null) {
				
				if(currentUser.isDelete()) {
					out.print("{\"error\":\"Tài khoản đã bị xóa khỏi hệ thống!\"}");
					out.flush();
					return;
				}

				UUID uuid = UUID.randomUUID();

				Token token = new Token();
				token.setToken(uuid.toString());
				token.setCreateAt(new Date());
				token.setExpriedAt(new Date(System.currentTimeMillis() + 15 * 60 * 1000));
				token.setTokenType(TokenType.FORGET_PASSWORD_TOKEN);
				token.setUser(currentUser);

				tokenDao.insert(token);

				Email email = new Email();
				email.setFrom("vandu18082003nv@gmail.com");
				email.setFromPassword("hbuivzczomvmdpuj");
				email.setTo(user.getEmail());
				email.setSubject("FORGET PASSWORD");
				String htmlContent = "<html><body>" + "<h3>Please click on the button below to  change password:</h3>"
						+ "<a href=\"http://localhost:8080" + request.getContextPath()
						+ "/forgetpassword/confirm?token=" + token.getToken() + "\">"
						+ "<button style=\"background-color: #4CAF50; color: white; border: none; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;\">Confirm Account</button>"
						+ "</a><br><p><b>Thank you!</b></p></body></html>";

				email.setContent(htmlContent);

				// gửi email
				EmailUtils.send(email);

				out.print("{\"message\":\"Quên mật khẩu thành công ! Vui lòng kiểm tra email!\"}");
				out.flush();
			} else {
				out.print("{\"error\":\"Tài khoản hoặc email không đúng!\"}");
				out.flush();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		UserDao userDao = new UserDao();
		TokenDao tokenDao = new TokenDao();

		try {
			String tokenParam = request.getParameter("token");
			String newPassword = request.getParameter("newPassword");
			String rePassword = request.getParameter("rePassword");

			if (!newPassword.equals(rePassword)) {
				out.print("{\"error\":\"Mật khẩu không trùng khớp!\"}");
				out.flush();
				return;
			}

			Token token = tokenDao.getToken(tokenParam);

			if (token != null) {

				if (token.checkExpried()==false) {
					User user = tokenDao.getUserByToken(tokenParam);
					user.setPassword(newPassword);

					userDao.update(user);
					tokenDao.delete(token);
					out.print("{\"message\":\"Đổi mật khẩu thành công!\"}");
					out.flush();

				} else {
					out.print("{\"error\":\"Đã hết thời gian để đổi mật khẩu!\"}");
					out.flush();
				}

			} else {
				out.print("{\"error\":\"Đổi mật khẩu không thành công!\"}");
				out.flush();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
