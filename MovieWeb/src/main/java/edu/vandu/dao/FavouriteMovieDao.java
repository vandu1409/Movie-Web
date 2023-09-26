package edu.vandu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.vandu.model.FavouriteMovie;
import edu.vandu.model.Movie;
import edu.vandu.utils.JpaUtils;

public class FavouriteMovieDao extends AbstractEntityDao<FavouriteMovie> {

	public FavouriteMovieDao() {
		super(FavouriteMovie.class);
	}

	public FavouriteMovie getByUserAndMovie(String userId, Long movieId) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT f FROM FavouriteMovie f where f.user.username = : uid and f.movie.movieId=:mid";

		TypedQuery<FavouriteMovie> query = em.createQuery(jpql, FavouriteMovie.class);
		query.setParameter("uid", userId);
		query.setParameter("mid", movieId);

		return query.getResultList().stream().findFirst().orElse(null);
	}
	
	public List<FavouriteMovie> getAllByMovie(Long movieId) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT f FROM FavouriteMovie f where f.movie.movieId=:mid";

		TypedQuery<FavouriteMovie> query = em.createQuery(jpql, FavouriteMovie.class);

		query.setParameter("mid", movieId);

		return query.getResultList();
	}
	
	public List<FavouriteMovie> getAllByMovie(Long movieId,int page,int size) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT f FROM FavouriteMovie f where f.movie.movieId=:mid";
	
		TypedQuery<FavouriteMovie> query = em.createQuery(jpql, FavouriteMovie.class);

		query.setParameter("mid", movieId);
		query.setFirstResult(page*size);
		query.setMaxResults(size);

		return query.getResultList();
	}

	public List<Movie> findAllByUser(String userId) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT f.movie FROM FavouriteMovie f where f.user.username = : uid ";

		TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
		query.setParameter("uid", userId);
		
		return query.getResultList();
	}
	
	public List<Movie> findAllByUser(String userId,int page,int size) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT f.movie FROM FavouriteMovie f where f.user.username = : uid ";

		TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
		query.setParameter("uid", userId);
		query.setFirstResult(page*size);
		query.setMaxResults(size);
		
		return query.getResultList();
	}
}
