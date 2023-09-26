package edu.vandu.controller.site;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.vandu.dao.EpisodeDao;
import edu.vandu.dao.FavouriteMovieDao;
import edu.vandu.dao.MovieDao;
import edu.vandu.dao.RatingDao;
import edu.vandu.dao.ViewDao;
import edu.vandu.model.Episode;
import edu.vandu.model.FavouriteMovie;
import edu.vandu.model.Movie;
import edu.vandu.model.User;
import edu.vandu.model.View;
import edu.vandu.utils.SessionUtils;

@WebServlet({ "/moviedetails", "/moviedetails/episode", "/moviedetails/episodeDetails", "/likeMovie" })
public class MovieDetailsController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI().toString();
		MovieDao movieDao = new MovieDao();
		EpisodeDao episodeDao = new EpisodeDao();
		ViewDao viewDao = new ViewDao();
		RatingDao ratingDao = new RatingDao();
		FavouriteMovieDao favouriteMovieDao = new FavouriteMovieDao();

		Long movieId = Long.parseLong(request.getParameter("movieId"));

		if (uri.contains("episodeDetails")) {

			String episodeId = request.getParameter("episodeId");

		
			
			if (episodeId == null) {

				request.setAttribute("episode", null);
			} else {
				Episode episode = episodeDao.findById(Long.parseLong(episodeId));
				User user = (User) request.getSession().getAttribute("user");
				Movie movie = movieDao.findById(movieId);
				
		
				        viewDao.watch(user, episode, movie);
				        System.out.println("Thêm view");
				 

				request.setAttribute("episode", episode);

			}

			request.setAttribute("listRating", ratingDao.findAllByMovie(movieId));
			request.setAttribute("movie", movieDao.findById(movieId));
			request.setAttribute("list", episodeDao.getAllByMovie(movieId));

			request.getRequestDispatcher("/views/site/movieWatching.jsp").forward(request, response);
			return;

		} else if (uri.contains("moviedetails")) {
			User user = (User) SessionUtils.getSessionAttribute(request, "user");
			if (user != null) {
				FavouriteMovie favouriteMovie = favouriteMovieDao.getByUserAndMovie(user.getUsername(), movieId);

				if (favouriteMovie != null) {
//					System.out.println("likedddđ");
					request.setAttribute("liked", "true");
				}
			}

			request.setAttribute("movie", movieDao.findById(movieId));
			request.setAttribute("listMovieRand", movieDao.getMovieRandom(4));
			request.setAttribute("listRating", ratingDao.findAllByMovie(movieId));
			request.getRequestDispatcher("/views/site/movieDetails.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		likeVideo(request, response);
	}

	protected void likeVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		System.out.println("Đã lên");

		FavouriteMovieDao favouriteMovieDao = new FavouriteMovieDao();
		MovieDao movieDao = new MovieDao();

		Long movieId = Long.parseLong(request.getParameter("movieId"));
		User user = (User) SessionUtils.getSessionAttribute(request, "user");

		FavouriteMovie favouriteMovie = favouriteMovieDao.getByUserAndMovie(user.getUsername(), movieId);

		if (favouriteMovie != null) {
			favouriteMovieDao.delete(favouriteMovie);

			out.print("{\"message\":\"Đã bỏ thích phim!\"}");

			out.flush();

		} else {
			FavouriteMovie fmovie = new FavouriteMovie();
			fmovie.setUser(user);
			fmovie.setMovie(movieDao.findById(movieId));
			fmovie.setLikeDate(new Date());
			favouriteMovieDao.insert(fmovie);

			System.out.println("thích");
			out.print("{\"liked\":\"true\", \"message\":\"Đã thích phim!\"}");
			out.flush();
		}

	}

}
