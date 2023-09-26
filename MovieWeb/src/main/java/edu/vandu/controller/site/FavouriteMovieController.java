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

import edu.vandu.dao.FavouriteMovieDao;
import edu.vandu.dao.MovieDao;
import edu.vandu.model.FavouriteMovie;
import edu.vandu.model.Movie;
import edu.vandu.model.User;
import edu.vandu.utils.SessionUtils;

@WebServlet({ "/listFavourite"})
public class FavouriteMovieController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI().toString();
		FavouriteMovieDao favouriteMovieDao = new FavouriteMovieDao();
		MovieDao movieDao = new MovieDao();
		
		if(uri.contains("listFavourite")) {
			User user =(User) SessionUtils.getSessionAttribute(request, "user");

			int page = request.getParameter("page")==null ? 1 :Integer.parseInt(request.getParameter("page"));
			int size =request.getParameter("size")==null ?6 :Integer.parseInt(request.getParameter("size"));
			
			List<Movie> listMovie = favouriteMovieDao.findAllByUser(user.getUsername());
			
			System.out.println(listMovie.size());
			int totalPage = (int) Math.ceil((double)listMovie.size()/size);
			
		
			
			if(totalPage>1) {
				int start = Math.max(1, page-2);
				int end = Math.min(page+2, totalPage);
				
				if(totalPage>5) {
					if(end==totalPage) {
						start = end-5;
					}else if(start==1) {
						end = start+5;
					}
				}
				
				List<Integer> pageNumber = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
				request.setAttribute("pageNumber", pageNumber);
			}

			List<Movie> list = favouriteMovieDao.findAllByUser(user.getUsername(), page-1, size);
			
			for (Movie movie : list) {
				System.out.println(movie.getTitle());
			}
			
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("list", favouriteMovieDao.findAllByUser(user.getUsername(), page-1, size));
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("listTopView", movieDao.getTopMovieByMonth(4));
			
			request.getRequestDispatcher("/views/site/listFavorite.jsp").forward(request, response);
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}


}
