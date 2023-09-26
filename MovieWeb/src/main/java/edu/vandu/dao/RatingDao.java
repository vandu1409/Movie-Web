package edu.vandu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.vandu.model.Rating;
import edu.vandu.utils.JpaUtils;

public class RatingDao extends AbstractEntityDao<Rating> {

	public RatingDao() {
		super(Rating.class);

	}
	
	public List<Rating> findAllByMovie(Long movieId){
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT r FROM Rating r where r.movie.movieId=:movieId ORDER BY r.createDate DESC";
		
		TypedQuery<Rating> query = em.createQuery(jpql, Rating.class);
		query.setParameter("movieId", movieId);
		
		return query.getResultList();
	}
	
	public List<Rating> findAllByMovie(Long movieId,int page,int size){
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT r FROM Rating r where r.movie.movieId=:movieId";
		
		TypedQuery<Rating> query = em.createQuery(jpql, Rating.class);
		query.setParameter("movieId", movieId);
		query.setFirstResult(page*size);
		query.setMaxResults(size);
		
		
		return query.getResultList();
	}

}
