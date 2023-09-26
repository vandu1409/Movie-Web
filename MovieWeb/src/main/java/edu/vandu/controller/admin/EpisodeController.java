package edu.vandu.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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

import edu.vandu.dao.EpisodeDao;
import edu.vandu.dao.MovieDao;
import edu.vandu.helper.FileHelper;
import edu.vandu.model.Episode;
import edu.vandu.model.Movie;

@MultipartConfig
@WebServlet({ "/admin/episode", "/admin/episode/add", "/admin/episode/insert", "/admin/episode/list",
		"/admin/episode/edit", "/admin/episode/update", "/admin/episode/delete", "/admin/episode/pagination" })
public class EpisodeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();

		String uri = request.getRequestURI().toString();
		MovieDao movieDao = new MovieDao();
		EpisodeDao episodeDao = new EpisodeDao();

		if (uri.contains("add")) {
			String movieId = (String) request.getParameter("movieId");

			if (movieId != null) {

				Movie movie = movieDao.findById(Long.parseLong(movieId));
				request.setAttribute("movie", movie);

				request.setAttribute("isEdit", false);
				request.getRequestDispatcher("/views/admin/episode/episode.jsp").forward(request, response);
				return;
			}

		} else if (uri.contains("list")) {
			String movieId = request.getParameter("movieId");
			request.setAttribute("movieId", movieId);
			request.getRequestDispatcher("/views/admin/episode/listEpisode.jsp").forward(request, response);
	
			
		} else if (uri.contains("pagination")) {
			getAll(request, response);
			return;
			
		} else if (uri.contains("edit")) {
			String movieId = (String) request.getParameter("movieId");
			String episodeId = (String) request.getParameter("episodeId");

			if (movieId != null && episodeId != null) {
				request.setAttribute("movie", movieDao.findById(Long.parseLong(movieId)));
				request.setAttribute("episode", episodeDao.findById(Long.parseLong(episodeId)));

				request.setAttribute("isEdit", true);
				request.getRequestDispatcher("/views/admin/episode/episode.jsp").forward(request, response);
				return;
			}
		} else if (uri.contains("delete")) {
			String movieId = (String) request.getParameter("movieId");
			String episodeId = (String) request.getParameter("episodeId");

			if (episodeId != null) {
				episodeDao.delete(episodeDao.findById(Long.parseLong(episodeId)));
			}

//			response.sendRedirect("/MovieWeb/admin/episode/add?movieId=" + movieId);
			
			out.print("{\"movieId\":"+movieId+", \"message\":\"Xóa tập phim thành công!\"}");
			out.flush();
			
		}

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
			System.out.println("Đã chạy");
			insert(request, response);
		} else if (uri.contains("update")) {
			update(request, response);
		}
	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			EpisodeDao episodeDao = new EpisodeDao();
			MovieDao movieDao = new MovieDao();
			Episode episode = new Episode();

			BeanUtils.populate(episode, request.getParameterMap());

			Part video = request.getPart("source");
			episode.setSource(video.getSubmittedFileName());
			FileHelper.save(video, request);

			Long movieId = Long.parseLong(request.getParameter("movieId"));

			Movie movie = movieDao.findById(movieId);
			System.out.println(movieId + " - " + movie.getTitle());

			episode.setMovie(movie);

			episodeDao.insert(episode);

			request.setAttribute("message", "Thêm tập phim thành công!");
			request.setAttribute("movie", movie);

			response.sendRedirect("/MovieWeb/admin/episode/add?movieId=" + movieId);

		} catch (Exception e) {

		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			EpisodeDao episodeDao = new EpisodeDao();
			MovieDao movieDao = new MovieDao();
			Episode episode = new Episode();

			BeanUtils.populate(episode, request.getParameterMap());

			Part video = request.getPart("source");

			if (video.getSize() > 0) {
				episode.setSource(video.getSubmittedFileName());
				FileHelper.save(video, request);
			} else {
				Episode currentEpisode = episodeDao.findById(episode.getEpisodeId());
				episode.setSource(currentEpisode.getSource());
			}

			Long movieId = Long.parseLong(request.getParameter("movieId"));

			Movie movie = movieDao.findById(movieId);
			System.out.println(movieId + " - " + movie.getTitle());

			episode.setMovie(movie);

			episodeDao.update(episode);

			request.setAttribute("message", "Cập nhật tập phim thành công!");
			request.setAttribute("movie", movie);

			response.sendRedirect("/MovieWeb/admin/episode/add?movieId=" + movieId);

		} catch (Exception e) {

		}
	}

	protected void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EpisodeDao episodeDao = new EpisodeDao();

		String movieId = (String) request.getParameter("movieId");

		if (movieId != null) {

			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			int size = request.getParameter("size") == null ? 3 : Integer.parseInt(request.getParameter("size"));
			String search = request.getParameter("search") == null ? "" : request.getParameter("search");

			List<Episode> listEpisodes = episodeDao.getAllByMovie(Long.parseLong(movieId), search);

			int totalPage = (int) Math.ceil((double) listEpisodes.size() / size);

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

			List<Episode> list = episodeDao.getAllByMovie(Long.parseLong(movieId), page - 1, size, search);
			request.setAttribute("list", list);
			request.setAttribute("size", size);
			request.setAttribute("page", page);
			request.setAttribute("search", search);
			request.setAttribute("movieId", movieId);
			

			request.getRequestDispatcher("/views/admin/include/includeEpisode.jsp").forward(request, response);

			return;

		}
	}
}
