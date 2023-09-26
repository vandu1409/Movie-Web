package edu.vandu.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.vandu.model.Token;
import edu.vandu.model.User;
import edu.vandu.utils.JpaUtils;

public class TokenDao extends AbstractEntityDao<Token> {

	public TokenDao() {
		super(Token.class);
		// TODO Auto-generated constructor stub
	}
	
	public User getUserByToken(String token) {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT t.user FROM Token t where t.token = :token";
		
		TypedQuery<User> query = em.createQuery(jpql,User.class);
		query.setParameter("token", token);
		
		return query.getResultList().stream().findFirst().orElse(null);
	}
	
	public Token getToken(String token) {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT t FROM Token t where t.token = :token";
		
		TypedQuery<Token> query = em.createQuery(jpql,Token.class);
		query.setParameter("token", token);
		
		return query.getResultList().stream().findFirst().orElse(null);
	}

}
