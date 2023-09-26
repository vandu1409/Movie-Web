package edu.vandu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.vandu.model.User;
import edu.vandu.utils.JpaUtils;

public class UserDao extends AbstractEntityDao<User> {

	public UserDao() {
		super(User.class);

	}

	public User checkLogin(String username, String password) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT u FROM User u where u.username = :username and u.password = :password";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);

		return query.getResultList().stream().findFirst().orElse(null);

	}
	
	public User findByUsernameAndEmail(String username, String email) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT u FROM User u where u.username = :username and u.email = :email";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("username", username);
		query.setParameter("email", email);

		return query.getResultList().stream().findFirst().orElse(null);

	}

	public User findById(String username) {
		EntityManager em = JpaUtils.getEntityManager();

		return em.find(User.class, username);
	}
	
	
	public List<User> findByKeyword(String keyword,boolean isDelete) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT u FROM User u where u.username like :key and u.isDelete = :isDelete";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("key", "%"+keyword+"%");
		query.setParameter("isDelete", isDelete);

		return query.getResultList();

	}
	
	
	public List<User> findAll(int page,int size,String keyword,boolean isDelete) {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT u FROM User u where u.username like :key and u.isDelete = :isDelete ";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("key", "%"+keyword+"%");
		query.setParameter("isDelete", isDelete);
		query.setFirstResult(page*size);
		query.setMaxResults(size);
		

		return query.getResultList();

	}
	
	public List<User> findAll() {
		EntityManager em = JpaUtils.getEntityManager();

		String jpql = "SELECT u FROM User u";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
	
		return query.getResultList();

	}

	public static void main(String[] args) {
		UserDao userDao = new UserDao();
		User user = userDao.checkLogin("vandu123", "123456");

		System.out.println(user.getFullname());
	}

}
