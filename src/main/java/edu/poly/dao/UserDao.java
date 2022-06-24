package edu.poly.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.poly.model.User;
import edu.poly.model.Video;
import edu.poly.utils.jpaUtils;

public class UserDao extends AbstractEntityDao<User> {
	public UserDao() {
		super(User.class);

	}

	public void changePassword(String username, String oldPassword, String newPassword) throws Exception {
		
		EntityManager em = jpaUtils.getEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		//Tìm kiếm thông tin username và password ->> jqpl
		String jqpl = "select u from User u where u.username = :username and u.password = :password";
		
		try {
			
			trans.begin();
			
			TypedQuery<User> query = em.createQuery(jqpl, User.class);
			
			//Thiết lập giá trị cho các tham số
			query.setParameter("username", username);
			query.setParameter("password", oldPassword);
			
			//Trả về đối tượng
			User user = query.getSingleResult();
			
			//Nếu không tìm thấy ->> ngoại lệ
			if (user == null) {
				throw new Exception("Current password or Username incorrect");
			}//Ngược lại
			
			//Thay mật khẩu bằng mật khẩu mới
			user.setPassword(newPassword);
			
			//Tiến hình cập nhật
			em.merge(user);
			
			//hoàn tất giao dịch
			trans.commit();
			
		} catch (Exception e) {
			
			//hủy bỏ giao dịch
			trans.rollback();
			throw e;
			
		}finally {
			em.close();
		}
	}
	
	
	public User findByUsernameAndEmail(String username, String email) {
		EntityManager em = jpaUtils.getEntityManager();
		
		String jpql = "select u from User u where u.username=:username and u.email = :email";
		
		try {
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("email", email);
			
			return query.getSingleResult();
			
		}finally {
			em.close();
		}
	}
	
	
	// ham nay de tra ve gia tri Video neu co id tre. ko co thi tra ve null
		public static User getUserId(String id) {
			EntityManager em = jpaUtils.getEntityManager();
			try {
				User user = em.find(User.class, id);
				return user;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
}
