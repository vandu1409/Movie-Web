package edu.vandu.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the Rating database table.
 * 
 */
@Entity
@NamedQuery(name="Rating.findAll", query="SELECT r FROM Rating r")
public class Rating implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long ratingId;

	private double ratingScore;

	private String review;
	
	private Date createDate;

	//bi-directional many-to-one association to Movy
	@ManyToOne
	@JoinColumn(name="movieId")
	private Movie movie;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public Rating() {
	}

	public long getRatingId() {
		return this.ratingId;
	}

	public void setRatingId(long ratingId) {
		this.ratingId = ratingId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public double getRatingScore() {
		return this.ratingScore;
	}

	public void setRatingScore(double ratingScore) {
		this.ratingScore = ratingScore;
	}

	public String getReview() {
		return this.review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Movie getMovie() {
		return this.movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}