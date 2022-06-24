package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.poly.domain.FavoriteUserReport;
import edu.poly.domain.MyFavorite;
import edu.poly.model.User;
import edu.poly.model.Video;
import edu.poly.utils.jpaUtils;

public class VideoDao extends AbstractEntityDao<Video> {
	public VideoDao() {
		super(Video.class);
		
	}
	
	public List<MyFavorite> FavoritedByUser(String username){
		String jpql= "select new edu.poly.domain.MyFavorite(f.video.videoId, f.video.title,"
				+ "f.video.poster,f.video.description) from Favorite f where f.user.username = :username ";
		
		EntityManager em = jpaUtils.getEntityManager();
		
		List<MyFavorite> list = null;
		
		try {
			TypedQuery<MyFavorite> query = em.createQuery(jpql, MyFavorite.class);
			
			query.setParameter("username", username);
			
			list = query.getResultList();
		}finally{
			em.close();
		}
		
		return list;
		
	}
	
	
	// ham nay de tra ve gia tri Video neu co id tre. ko co thi tra ve null
	public static Video getVideoId(String id) {
		EntityManager em = jpaUtils.getEntityManager();
		try {
			Video video = em.find(Video.class, id);
			return video;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
