package edu.vandu.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {

	public static EntityManager getEntityManager() {

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("MovieWeb");

		return entityManagerFactory.createEntityManager();

	}
}
