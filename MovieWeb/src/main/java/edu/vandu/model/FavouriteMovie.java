package edu.vandu.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the FavouriteMovies database table.
 * 
 */
@Entity
@Table(name="FavouriteMovies")
@NamedQuery(name="FavouriteMovie.findAll", query="SELECT f FROM FavouriteMovie f")
public class FavouriteMovie implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long favouriteId;

	private Date likeDate;

	//bi-directional many-to-one association to Movy
	@ManyToOne
	@JoinColumn(name="movieId")
	private Movie movie;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public FavouriteMovie() {
	}

	public long getFavouriteId() {
		return this.favouriteId;
	}

	public void setFavouriteId(long favouriteId) {
		this.favouriteId = favouriteId;
	}

	public Date getLikeDate() {
		return this.likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
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