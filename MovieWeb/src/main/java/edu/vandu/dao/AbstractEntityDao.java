package edu.vandu.dao;

import javax.persistence.EntityManager;

import edu.vandu.utils.JpaUtils;

public abstract class AbstractEntityDao<T> {

	private Class<T> entityClass;

	public AbstractEntityDao(Class<T> entityClass) {
		this.entityClass = (Class<T>) entityClass;
	}

	public void insert(T entity) {
		EntityManager em = JpaUtils.getEntityManager();

		try {
			em.getTransaction().begin();

			em.persist(entity);

			em.getTransaction().commit();
		} catch (Exception e) {		
			e.printStackTrace();
			em.getTransaction().rollback();
			
		}
	}
	
	public void update(T entity) {
		EntityManager em = JpaUtils.getEntityManager();

		try {
			em.getTransaction().begin();

			em.merge(entity);

			em.getTransaction().commit();
		} catch (Exception e) {		
			e.printStackTrace();
			em.getTransaction().rollback();
			
		}
	}
	
	
	public void delete(T entity) {
		EntityManager em = JpaUtils.getEntityManager();

		try {
			em.getTransaction().begin();

			em.remove(em.contains(entity)?entity:em.merge(entity));

			em.getTransaction().commit();
		} catch (Exception e) {		
			e.printStackTrace();
			em.getTransaction().rollback();
			
		}
	}
	
	public T findById(Long id) {
		EntityManager em = JpaUtils.getEntityManager();
		
		return em.find(entityClass, id);
	}
	

}
