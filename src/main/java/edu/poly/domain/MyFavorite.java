package edu.poly.domain;

public class MyFavorite {
	private String videoId;
	private String title;
	private String poster;
	private String description;
	
	
	public MyFavorite() {
	}


	public MyFavorite(String videoId, String title, String poster, String description) {
		this.videoId = videoId;
		this.title = title;
		this.poster = poster;
		this.description = description;
	}


	public String getVideoId() {
		return videoId;
	}


	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	


	
	
	
}
