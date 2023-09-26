package edu.vandu.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.vandu.dao.FavouriteMovieDao;
import edu.vandu.model.FavouriteMovie;

@WebServlet({ "/admin/getAllFavourite", "/admin/getListFavourite" })
public class FavoriuteAdminController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI().toString();
		FavouriteMovieDao favouriteMovieDao = new FavouriteMovieDao();
		
		if (uri.contains("getAllFavourite")) {
			getAll(request, response);
			request.getRequestDispatcher("/views/admin/include/includeFavoriute.jsp").forward(request, response);
			
		} else if (uri.contains("getListFavourite")) {
			
			String movieId = request.getParameter("movieId");

			if (movieId != null) {
				List<FavouriteMovie> listFavouriteMovies = favouriteMovieDao.getAllByMovie(Long.parseLong(movieId));
				request.setAttribute("movieId", movieId);
				request.getRequestDispatcher("/views/admin/favoriute.jsp").forward(request, response);
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String movieId = request.getParameter("movieId");
System.out.println(movieId);
			FavouriteMovieDao favouriteMovieDao = new FavouriteMovieDao();

			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			int size = request.getParameter("size") == null ? 5 : Integer.parseInt(request.getParameter("size"));

			List<FavouriteMovie> listFavouriteMovies = favouriteMovieDao.getAllByMovie(Long.parseLong(movieId));

			int totalPage = (int) Math.ceil((double) listFavouriteMovies.size() / size);

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

			List<FavouriteMovie> list = favouriteMovieDao.getAllByMovie(Long.parseLong(movieId), page - 1, size);
			for (FavouriteMovie favouriteMovie : list) {
				System.out.println(favouriteMovie.getMovie().getTitle());
			}
			request.setAttribute("list", list);
			request.setAttribute("size", size);
			request.setAttribute("page", page);
			request.setAttribute("movieId", movieId);

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
