package edu.poly.dao;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.domain.FavoriteReport;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.model.Favorite;
import edu.poly.model.User;
import edu.poly.model.Video;
import edu.poly.utils.jpaUtils;

public class FavoriteDao extends AbstractEntityDao<Favorite> {

	public FavoriteDao() {
		super(Favorite.class);
	}

	public List<FavoriteReport> reportFavoritesByVideos() {
		String jpql = "select new edu.poly.domain.FavoriteReport(f.video.title, count(f), min(f.likeDate),  max(f.likeDate))"
				+ " from Favorite f group by f.video.title ";

		EntityManager em = jpaUtils.getEntityManager();

		List<FavoriteReport> list = null;

		try {
			TypedQuery<FavoriteReport> query = em.createQuery(jpql, FavoriteReport.class);

			list = query.getResultList();
		} finally {
			em.close();
		}

		return list;
	}
	
	public List<FavoriteUserReport> reportFavoriteUsersByVideo(String videoId) {
		String jpql = "select new edu.poly.domain.FavoriteUserReport(f.user.username, f.user.fullname,"
				+ "f.user.email,f.likeDate) from Favorite f where f.video.videoId = :videoId ";

		EntityManager em = jpaUtils.getEntityManager();

		List<FavoriteUserReport> list = null;

		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);

			query.setParameter("videoId", videoId);

			list = query.getResultList();
		} finally {
			em.close();
		}

		return list;

	}
// trời ơi nó nằm ở đây này ... e nhìn chữ o với O kìa 2 cái khác nhau à kkkk O vs o
	// cho nay co van de j do ma minh ko bit
	public static String jdbc_find_favorite_user_video_id = "SELECT f FROM Favorite f WHERE f.user=:u AND f.video=:v";  // nếu chỗ đó mà là privary thì chỗ này o.uỏe  o.video là nó ko lấy vì privary ko cho lấy

	public static Favorite getFavoriteKeyword(User username, Video videoId) {
		EntityManager em = jpaUtils.getEntityManager();
		try {
			TypedQuery<Favorite> query = em.createQuery(jdbc_find_favorite_user_video_id, Favorite.class);
			query.setParameter("v", videoId);
			query.setParameter("u", username);
			Favorite favorite = query.getSingleResult();
			return favorite;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String[] args) {
		User u = UserDao.getUserId("hieu");
		Video v= VideoDao.getVideoId("Vid001".trim());
		Favorite f = getFavoriteKeyword(u, v);
		System.out.println(f.getFavoriteId());
		deleteFavorite(f); //
	}


	public static void createFavorite(User user, Video video) {
		Favorite favorite = new Favorite();
		favorite.setUser(user);
		favorite.setVideo(video);
		favorite.setlikeDate(new Date());
		
		FavoriteDao dao = new FavoriteDao();
		dao.insert(favorite);
	}

	public static void deleteFavorite(Favorite favorite) {
		EntityManager em = jpaUtils.getEntityManager();
		try {
			em.getTransaction().begin();
			em.remove(favorite);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback(); // chỗ này ko bị mất dữ liệu nếu thực thi sai nà.
		}
		
	}
}
