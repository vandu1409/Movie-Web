package edu.vandu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.*;


/**
 * The persistent class for the Views database table.
 * 
 */
@Entity
@Table(name="Views")
@NamedQuery(name="View.findAll", query="SELECT v FROM View v")
public class View implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long viewId;

	private Date viewDate;

	//bi-directional many-to-one association to Episode
	@ManyToOne
	@JoinColumn(name="episodeId")
	private Episode episode;

	//bi-directional many-to-one association to Movy
	@ManyToOne
	@JoinColumn(name="movieId")
	private Movie movie;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public View() {
	}

	public long getViewId() {
		return this.viewId;
	}

	public void setViewId(long viewId) {
		this.viewId = viewId;
	}

	public Date getViewDate() {
		return this.viewDate;
	}

	public void setViewDate(Date viewDate) {
		this.viewDate = viewDate;
	}

	public Episode getEpisode() {
		return this.episode;
	}

	public void setEpisode(Episode episode) {
		this.episode = episode;
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