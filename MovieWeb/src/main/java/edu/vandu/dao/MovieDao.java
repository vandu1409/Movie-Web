package edu.vandu.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.vandu.model.Movie;
import edu.vandu.utils.JpaUtils;

public class MovieDao extends AbstractEntityDao<Movie> {

	public MovieDao() {
		super(Movie.class);

	}

	public List<Movie> getAll() {
		EntityManager em = JpaUtils.getEntityManager();

		TypedQuery<Movie> query = em.createNamedQuery("Movie.findAll", Movie.class);

		return query.getResultList();
	}
	

	public List<Movie> getAll(int page, int size, String keyword) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT m FROM Movie m where m.title like :keyword or m.description like :keyword";

		if (keyword == null) {
			jpql = "SELECT m FROM Movie m";
		}

		TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);

		if (keyword != null) {
			query.setParameter("keyword", "%" + keyword + "%");
		}

		query.setFirstResult(page * size);
		query.setMaxResults(size);

		return query.getResultList();
	}

	public List<Movie> getAll(int page, int size) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT m FROM Movie m";

		TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);

		query.setFirstResult(page * size);
		query.setMaxResults(size);

		return query.getResultList();
	}

	public List<Movie> findByKeyword(String keyword) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT m FROM Movie m where m.title like :keyword or m.description like :keyword";

		TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);

		query.setParameter("keyword", "%" + keyword + "%");

		return query.getResultList();
	}

	public Long getTotalMovie() {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT COUNT(m) FROM Movie m";

		Query query = em.createQuery(jpql);

		return (Long) query.getSingleResult();

	}

	public List<Movie> getMovieRandom(int number) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT m FROM Movie m ORDER BY NEWID() ";

		TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
		query.setFirstResult(0);
		query.setMaxResults(number);

		return query.getResultList();

	}

	public List<Movie> getTopMovieByMonth(int number) {
		EntityManager em = JpaUtils.getEntityManager();

//		String jpql = "SELECT v.movie.movieId,COUNT(*) as views FROM View v where MONTH(v.viewDate) = MONTH(GETDATE()) AND YEAR(v.viewDate) = YEAR(GETDATE()) GROUP BY v.movie  ORDER BY Count(*) Desc";

		String jpql = "SELECT movieId\r\n" + "FROM views\r\n"
//				+ "WHERE MONTH(viewDate) = MONTH(GETDATE()) AND YEAR(viewDate) = YEAR(GETDATE())\r\n"
				+ "GROUP BY movieId\r\n" + "ORDER BY COUNT(*)  DESC";

		Query query = em.createNativeQuery(jpql);
		query.setFirstResult(0);
		query.setMaxResults(number);

		List<Object> result = query.getResultList();

		List<Movie> movies = new ArrayList<>();
		for (Object id : result) {
			Movie movie = findById(Long.parseLong(id.toString()));
			movies.add(movie);
		}

		return movies;
	}

//	public List<Movie> topMovieByDate(int number) {
//		EntityManager em = JpaUtils.getEntityManager();
//
////		String jpql = "SELECT v.movie.movieId,COUNT(*) as views FROM View v where MONTH(v.viewDate) = MONTH(GETDATE()) AND YEAR(v.viewDate) = YEAR(GETDATE()) GROUP BY v.movie  ORDER BY Count(*) Desc";
//
//		String jpql = "SELECT movieId\r\n"
//				+ "FROM views\r\n"
//				+ "WHERE viewDate = :date\r\n"
//				+ "GROUP BY movieId\r\n"
//				+ "ORDER BY COUNT(*)  DESC\r\n"
//				+ "";
//
//		Query query = em.createNativeQuery(jpql);
//		query.setParameter("date", new Date());
//		query.setFirstResult(0);
//		query.setMaxResults(number);
//
//		List<Object> result = query.getResultList();
//
//		List<Movie> movies = new ArrayList<>();
//		for (Object id : result) {
//			Movie movie = findById(Long.parseLong(id.toString()));
//			movies.add(movie);
//		}
//
//		return movies;
//	}

	public static void main(String[] args) {
		MovieDao movieDao = new MovieDao();

		List<Movie> list = movieDao.getTopMovieByMonth(5);

		for (Movie movie : list) {
			System.out.println(movie.getTitle());
		}
	}

}
