package edu.vandu.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import edu.vandu.dao.MovieDao;
import edu.vandu.helper.FileHelper;
import edu.vandu.model.Movie;

@MultipartConfig
@WebServlet({ "/admin/movie", "/admin/movie/insert", "/admin/movie/update", "/admin/movie/list", "/admin/movie/edit",
		"/admin/movie/delete", "/admin/movie/pagination" })
public class MovieController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI().toString();

		if (uri.contains("list")) {
			request.getRequestDispatcher("/views/admin/movies/listMovie.jsp").forward(request, response);
			return;
		} else if (uri.contains("pagination")) {
			System.out.println("Đã vvvvv");
			getAll(request, response);
			request.getRequestDispatcher("/views/site/include/includeMovieAdmin.jsp").forward(request, response);
			return;
		} else if (uri.contains("edit")) {
			edit(request, response);
			request.setAttribute("isEdit", true);
			request.getRequestDispatcher("/views/admin/movies/movie.jsp").forward(request, response);
			return;
		} else if (uri.contains("delete")) {
			delete(request, response);
			response.sendRedirect("/MovieWeb/admin/movie");
			return;
		}

		request.setAttribute("isEdit", false);
		request.getRequestDispatcher("/views/admin/movies/movie.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		DateTimeConverter dtc = new DateConverter(new Date());
		dtc.setPattern("dd/MM/yyyy");
		ConvertUtils.register(dtc, Date.class);

		String uri = request.getRequestURI().toString();

		if (uri.contains("insert")) {

			insert(request, response);

			response.sendRedirect("/MovieWeb/admin/movie");
		} else if (uri.contains("update")) {
			update(request, response);
			response.sendRedirect("/MovieWeb/admin/movie");
		}

	}

	// thêm phim
	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			MovieDao movieDao = new MovieDao();
			Movie movie = new Movie();

			BeanUtils.populate(movie, request.getParameterMap());

			Part image = request.getPart("image");

			movie.setImage(image.getSubmittedFileName());

			FileHelper.save(image, request);

			movieDao.insert(movie);

			request.setAttribute("message", "Thêm phim thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Thêm phim thất bại!");
		}
	}

	// cập nhật
	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			MovieDao movieDao = new MovieDao();
			Movie movie = new Movie();

			BeanUtils.populate(movie, request.getParameterMap());

			Part image = request.getPart("image");

			Movie currentMovie = movieDao.findById(movie.getMovieId());

			if (image.getSize() > 0) {
				movie.setImage(image.getSubmittedFileName());
				System.out.println(movie.getMovieId());

//				FileHelper.delete(currentMovie.getImage(), request);
				FileHelper.save(image, request);
			} else {
				movie.setImage(currentMovie.getImage());
			}

			movieDao.update(movie);

			request.setAttribute("message", "Cập nhật phim thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Thêm phim thất bại!");
		}
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

			Long id = Long.parseLong(request.getParameter("movieId"));

			MovieDao movieDao = new MovieDao();
			Movie movie = movieDao.findById(id);
			
			String relsaseDate = format.format(movie.getReleaseDate());
			
			System.out.println(relsaseDate);
			
			movie.setReleaseDate(format.parse(relsaseDate));
		
			System.out.println(movie.getReleaseDate());
			
			request.setAttribute("movie", movie);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi!");
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			Long id = Long.parseLong(request.getParameter("movieId"));

			MovieDao movieDao = new MovieDao();
			movieDao.delete(movieDao.findById(id));

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi!");
		}
	}

	//
	protected void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			MovieDao movieDao = new MovieDao();

			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			int size = request.getParameter("size") == null ? 5 : Integer.parseInt(request.getParameter("size"));
			String search = request.getParameter("search") == null ? "" : request.getParameter("search");

			List<Movie> listMovie = movieDao.findByKeyword(search);

			int totalPage = (int) Math.ceil((double) listMovie.size() / size);

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

			List<Movie> list = movieDao.getAll(page - 1, size, search);
			request.setAttribute("list", list);
			request.setAttribute("size", size);
			request.setAttribute("page", page);
			request.setAttribute("search", search);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi!");
		}
	}
}
