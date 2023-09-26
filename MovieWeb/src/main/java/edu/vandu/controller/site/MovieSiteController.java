package edu.vandu.controller.site;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.vandu.dao.MovieDao;
import edu.vandu.model.Movie;

@WebServlet({ "/movie/search", "/movie/categories" })
public class MovieSiteController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MovieDao movieDao = new MovieDao();
		String uri = request.getRequestURI().toString();
		if (uri.contains("search")) {
			search(request, response);
		} else if (uri.contains("categories")) {
			String keyword = request.getParameter("keyword");
			request.setAttribute("keyword", keyword);
			
			request.setAttribute("listTopView", movieDao.getTopMovieByMonth(4));
			request.getRequestDispatcher("/views/site/categories.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MovieDao movieDao = new MovieDao();

		String keyword = request.getParameter("keyword");
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int size = request.getParameter("size") == null ? 6 : Integer.parseInt(request.getParameter("size"));

		List<Movie> listMovie = movieDao.findByKeyword(keyword);

		System.out.println(listMovie.size());
		int totalPage = (int) Math.ceil((double) listMovie.size() / size);

		System.out.println("keyword" + keyword + "page" + page + "size" + size + "totalPage" + totalPage);

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

		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", movieDao.getAll(page - 1, size, keyword));
		request.setAttribute("page", page);
		request.setAttribute("size", size);
		request.setAttribute("keyword", keyword);
		request.setAttribute("listTopView", movieDao.getTopMovieByMonth(4));
		System.out.println("Thành công");
		
		request.getRequestDispatcher("/views/site/include/includeCategories.jsp").forward(request, response);
	}
}
