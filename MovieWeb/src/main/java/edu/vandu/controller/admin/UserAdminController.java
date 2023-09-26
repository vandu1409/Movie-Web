package edu.vandu.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.vandu.dao.MovieDao;
import edu.vandu.dao.UserDao;
import edu.vandu.model.Movie;
import edu.vandu.model.User;

@WebServlet({ "/admin/user/list", "/admin/user/add", "/admin/user/edit", "/admin/user/update", "/admin/user/delete",
		"/admin/user/userDeleted", "/admin/user/restore", "/admin/user/pagination" })
public class UserAdminController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI().toString();
		if (uri.contains("list")) {
			request.getRequestDispatcher("/views/admin/user/listUser.jsp").forward(request, response);
		}
		if (uri.contains("pagination")) {
			getAll(request, response);
			request.getRequestDispatcher("/views/admin/user/includeUser.jsp").forward(request, response);
		} else if (uri.contains("add")) {
//			request.setAttribute("user", null);
			request.setAttribute("isEdit", false);
			request.getRequestDispatcher("/views/admin/user/user.jsp").forward(request, response);
		} else if (uri.contains("edit")) {
			request.setAttribute("isEdit", true);
			edit(request, response);
			request.getRequestDispatcher("/views/admin/user/user.jsp").forward(request, response);
		} else if (uri.contains("delete")) {
			delete(request, response);
		} else if (uri.contains("userDeleted")) {
			getAllUserDeleted(request, response);
			request.getRequestDispatcher("/views/admin/user/listUserDeleted.jsp").forward(request, response);
		} else if (uri.contains("restore")) {
			restore(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI().toString();

		if (uri.contains("update")) {
			update(request, response);
		}
	}

	protected void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			UserDao userDao = new UserDao();

			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			int size = request.getParameter("size") == null ? 5 : Integer.parseInt(request.getParameter("size"));
			String search = request.getParameter("search") == null ? "" : request.getParameter("search");

			List<User> listUser = userDao.findByKeyword(search, false);

			int totalPage = (int) Math.ceil((double) listUser.size() / size);

			if (totalPage > 1) {

				int start = Math.max(1, page - 2);
				int end = Math.min(page + 2, totalPage);

				if (totalPage > 5) {
					if (end == totalPage) {
						start = end - 5;
					} else if (start == 1) {
						end = start + 5;
					}
				}

				List<Integer> pageNumber = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
				request.setAttribute("pageNumber", pageNumber);
			}

			List<User> list = userDao.findAll(page - 1, size, search, false);
			request.setAttribute("list", list);
			request.setAttribute("size", size);
			request.setAttribute("page", page);
			request.setAttribute("search", search);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi!");
		}
	}

	protected void getAllUserDeleted(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			UserDao userDao = new UserDao();

			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			int size = request.getParameter("size") == null ? 5 : Integer.parseInt(request.getParameter("size"));
			String search = request.getParameter("search") == null ? "" : request.getParameter("search");

			List<User> listUser = userDao.findByKeyword(search, true);

			int totalPage = (int) Math.ceil((double) listUser.size() / size);

			if (totalPage > 1) {

				int start = Math.max(1, page - 2);
				int end = Math.min(page + 2, totalPage);

				if (totalPage > 5) {
					if (end == totalPage) {
						start = end - 5;
					} else if (start == 1) {
						end = start + 5;
					}
				}

				List<Integer> pageNumber = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
				request.setAttribute("pageNumber", pageNumber);
			}

			List<User> list = userDao.findAll(page - 1, size, search, true);
			request.setAttribute("list", list);
			request.setAttribute("size", size);
			request.setAttribute("page", page);
			request.setAttribute("search", search);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi!");
		}
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserDao userDao = new UserDao();

		String username = request.getParameter("username");

		User user = userDao.findById(username);

		request.setAttribute("currentUser", user);

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		try {
			UserDao userDao = new UserDao();

			String username = request.getParameter("username");

			User user = userDao.findById(username);
			user.setDelete(true);

			userDao.update(user);

			out.print("{\"message\":\"Xóa tài khoản thành công!\"}");
			out.flush();

		} catch (Exception e) {
			out.print("{\"error\":\"Xóa tài khoản thất bại!\"}");
			out.flush();
		}

	}

	protected void restore(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		try {
			UserDao userDao = new UserDao();

			String username = request.getParameter("username");

			User user = userDao.findById(username);
			user.setDelete(false);

			userDao.update(user);

			out.print("{\"message\":\"Khôi phục  tài khoản thành công!\"}");
			out.flush();

		} catch (Exception e) {
			out.print("{\"error\":\"Khôi phục  tài khoản thất bại!\"}");
			out.flush();
		}

	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		try {
			UserDao userDao = new UserDao();
			User user = new User();

			BeanUtils.populate(user, request.getParameterMap());

			String role = request.getParameter("admin");

			if (role != null) {
				user.setRole(true);
			} else {
				user.setRole(false);
			}

			userDao.update(user);

			out.print("{\"message\":\"Cật nhật thông tin tài khoản thành công!\"}");
			out.flush();

		} catch (Exception e) {
			out.print("{\"error\":\"Cật nhật thông tin tài khoản thất bại!\"}");
			out.flush();
		}

	}

}
