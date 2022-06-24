package edu.poly.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;




@Entity
@Table(name="Favorites", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"UserId","VideoId"})
})
@NamedQuery(name="Favorite.findAll", query="SELECT f FROM Favorite f")
public class Favorite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.DATE)
	@Column(name="LikeDate")
	private Date likeDate;

//	@Column(name="VideoId")
//	private String videoId;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="UserId")
	private User user;

	//bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name="VideoId")
	private Video video;

	public Favorite() {
	}

	public int getFavoriteId() {
		return id;
	}

	public void setFavoriteId(int favoriteId) {
		this.id = favoriteId;
	}

	public Date getlikeDate() {
		return likeDate;
	}

	public void setlikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

//	public String getVideoId() {
//		return this.videoId;
//	}
//
//	public void setVideoId(String videoId) {
//		this.videoId = videoId;
//	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	
	
}