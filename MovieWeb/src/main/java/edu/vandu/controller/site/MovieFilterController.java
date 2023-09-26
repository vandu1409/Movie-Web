package edu.vandu.controller.site;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import edu.vandu.dao.MovieDao;
import edu.vandu.model.Movie;

@WebServlet({ "/movie/all" ,"/movie/pagination"})
public class MovieFilterController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MovieDao movieDao = new MovieDao();
		String uri = request.getRequestURI().toString();
		
		if(uri.contains("pagination")) {
			int page = request.getParameter("page")==null ? 1 :Integer.parseInt(request.getParameter("page"));
			int size =request.getParameter("size")==null ?6 :Integer.parseInt(request.getParameter("size"));
	
			
			int totalPage = (int) Math.ceil((double)movieDao.getTotalMovie()/size);
				
			if(totalPage>0) {
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

			List<Movie> list = movieDao.getAll(page-1, size);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("listTopView", movieDao.getTopMovieByMonth(4));	
			request.getRequestDispatcher("/views/site/include/includeAllMovie.jsp").forward(request, response);

		}else if(uri.contains("all")) {
			request.setAttribute("listTopView", movieDao.getTopMovieByMonth(4));	
			request.getRequestDispatcher("/views/site/allMovie.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
