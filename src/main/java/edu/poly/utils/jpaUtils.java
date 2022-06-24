package edu.poly.utils;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class jpaUtils {
	public static EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("Assigment").createEntityManager();
	}
}
