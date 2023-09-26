package edu.vandu.controller.site;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.vandu.dao.MovieDao;
import edu.vandu.model.Movie;


@WebServlet("/home")
public class HomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MovieDao movieDao = new MovieDao();
		
		request.setAttribute("list", movieDao.getAll(0,9));
		request.setAttribute("listRandom", movieDao.getMovieRandom(6));
		request.setAttribute("listRandom1", movieDao.getMovieRandom(5));
		request.setAttribute("listTopView", movieDao.getTopMovieByMonth(4));	
		request.getRequestDispatcher("/views/site/index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		doGet(request, response);
	}

}
