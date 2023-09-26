package edu.vandu.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the WatchedMovies database table.
 * 
 */
@Entity
@Table(name="WatchedMovies")
@NamedQuery(name="WatchedMovie.findAll", query="SELECT w FROM WatchedMovie w")
public class WatchedMovie implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long watchedID;

	private Date watchedDate;

	//bi-directional many-to-one association to Movy
	@ManyToOne
	@JoinColumn(name="movieId")
	private Movie movie;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public WatchedMovie() {
	}

	public long getWatchedID() {
		return this.watchedID;
	}

	public void setWatchedID(long watchedID) {
		this.watchedID = watchedID;
	}

	public Date getWatchedDate() {
		return this.watchedDate;
	}

	public void setWatchedDate(Date watchedDate) {
		this.watchedDate = watchedDate;
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