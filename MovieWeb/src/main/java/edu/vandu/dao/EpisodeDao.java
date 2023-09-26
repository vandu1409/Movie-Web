package edu.vandu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.vandu.model.Episode;
import edu.vandu.utils.JpaUtils;

public class EpisodeDao extends AbstractEntityDao<Episode> {

	public EpisodeDao() {
		super(Episode.class);
	}
	
	public List<Episode> getAllByMovie(Long movieId){
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT e FROM Episode e where e.movie.movieId = :movieId";
		
		TypedQuery<Episode> query = em.createQuery(jpql,Episode.class);
		query.setParameter("movieId", movieId);
		
		return query.getResultList();
		
	}
	
	public List<Episode> getAllByMovie(Long movieId,int page,int size,String search){
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT e FROM Episode e where e.movie.movieId = :movieId and e.title like :search";
		
		if(search==null) {
			jpql="SELECT e FROM Episode e where e.movie.movieId = :movieId ";
		}
		
		TypedQuery<Episode> query = em.createQuery(jpql,Episode.class);
		query.setParameter("movieId", movieId);
		query.setFirstResult(page*size);
		query.setMaxResults(size);
		
		if(search!=null) {
			query.setParameter("search", "%"+search+"%");
		}
		
		return query.getResultList();
		
	}
	
	public List<Episode> getAllByMovie(Long movieId,String search){
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT e FROM Episode e where e.movie.movieId = :movieId and e.title like :search";
		
		if(search==null) {
			jpql="SELECT e FROM Episode e where e.movie.movieId = :movieId ";
		}
		
		TypedQuery<Episode> query = em.createQuery(jpql,Episode.class);
		query.setParameter("movieId", movieId);

		
		if(search!=null) {
			query.setParameter("search", "%"+search+"%");
		}
		
		return query.getResultList();
		
	}
	
	public Long getViewByEpisode(Long episodeId) {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "select count(v) from view v where v.episode.episodeId = :id";
		
		Query query = em.createQuery(jpql);
		query.setParameter("id",episodeId);
		
		return (Long) query.getSingleResult();
	}

}
