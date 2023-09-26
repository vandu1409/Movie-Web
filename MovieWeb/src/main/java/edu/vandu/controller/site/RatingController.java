package edu.vandu.controller.site;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import edu.vandu.dao.MovieDao;
import edu.vandu.dao.RatingDao;
import edu.vandu.model.Movie;
import edu.vandu.model.Rating;
import edu.vandu.model.User;
import edu.vandu.utils.SessionUtils;



@WebServlet("/rating")
public class RatingController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI().toString();
		
		if(uri.contains("rating")) {
			rating(request, response);
		}
	}
	
	protected void rating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			MovieDao movieDao = new MovieDao();
			RatingDao ratingDao = new RatingDao();
			Rating rating = new Rating();
			
			BeanUtils.populate(rating, request.getParameterMap());
			String ratingScore = request.getParameter("rating");
			Long movieId = Long.parseLong(request.getParameter("movieId"));
			
//			rating.setUser((User) SessionUtils.getSessionAttribute(request, "user"));		
			HttpSession session = request.getSession();
			
			rating.setUser((User) session.getAttribute("user"));
			
			rating.setRatingScore(Double.parseDouble(ratingScore));
			Movie movie = movieDao.findById(movieId);
			rating.setMovie(movie);
			rating.setCreateDate(new Date());
			
			System.out.println(movieId);
			ratingDao.insert(rating);
	
			String episodeId = request.getParameter("episodeId");
			String check = request.getParameter("check");
			
			System.out.println(episodeId+"siuhffsdjgf");
			
			if(check!=null) {
				//là cmt được gửi từ giao diện xem phim
				if(check.equalsIgnoreCase("1")) {
					
					if(!episodeId.trim().equals("")) {
						System.out.println("đã bấm");
						response.sendRedirect("/MovieWeb/moviedetails/episodeDetails?movieId="+movieId+"&episodeId="+episodeId);
					}else {
						//cmt khi chưa bấm vào tập phim
						System.out.println("chưa bấm");
						response.sendRedirect("/MovieWeb/moviedetails/episodeDetails?movieId="+movieId);
					
					}
					
				}
			}else {
				//cmt được gửi từ giao diện chi tiết phim
				response.sendRedirect("/MovieWeb/moviedetails?movieId="+movieId);
			}
			
			
//			String url = request.getServletPath();			
//			response.sendRedirect(url);
		} catch (Exception e) {
		
		}
	}

}
