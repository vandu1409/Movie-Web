package edu.vandu.model;

import java.io.Serializable;
import javax.persistence.*;

import edu.vandu.utils.JpaUtils;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Movies database table.
 * 
 */
@Entity
@Table(name="Movies")
@NamedQuery(name="Movie.findAll", query="SELECT m FROM Movie m")
public class Movie implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long movieId;

	private String author;

	private String description;

	private String duration;

	private String genre;

	private String image;

	@Column(name="release_date")
	private Date releaseDate;

	private String status;

	private String studios;

	private String title;


	//bi-directional many-to-one association to Episode
	@OneToMany(mappedBy="movie")
	private List<Episode> episodes;

	//bi-directional many-to-one association to FavouriteMovy
	@OneToMany(mappedBy="movie")
	private List<FavouriteMovie> favouriteMovies;

	//bi-directional many-to-one association to Rating
	@OneToMany(mappedBy="movie")
	private List<Rating> ratings;

	//bi-directional many-to-one association to WatchedMovy
	@OneToMany(mappedBy="movie")
	private List<WatchedMovie> watchedMovies;

	//bi-directional many-to-one association to View
	@OneToMany(mappedBy="movie")
	private List<View> viewsSet;

	public Movie() {
	}

	public long getMovieId() {
		return this.movieId;
	}

	public void setMovieId(long movieId) {
		this.movieId = movieId;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getGenre() {
		return this.genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getReleaseDate() {
		return this.releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStudios() {
		return this.studios;
	}

	public void setStudios(String studios) {
		this.studios = studios;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public List<Episode> getEpisodes() {
		return this.episodes;
	}

	public void setEpisodes(List<Episode> episodes) {
		this.episodes = episodes;
	}

	public Episode addEpisode(Episode episode) {
		getEpisodes().add(episode);
		episode.setMovie(this);

		return episode;
	}

	public Episode removeEpisode(Episode episode) {
		getEpisodes().remove(episode);
		episode.setMovie(null);

		return episode;
	}

	public List<FavouriteMovie> getFavouriteMovies() {
		return this.favouriteMovies;
	}

	public void setFavouriteMovies(List<FavouriteMovie> favouriteMovies) {
		this.favouriteMovies = favouriteMovies;
	}

	public FavouriteMovie addFavouriteMovy(FavouriteMovie favouriteMovy) {
		getFavouriteMovies().add(favouriteMovy);
		favouriteMovy.setMovie(this);

		return favouriteMovy;
	}

	public FavouriteMovie removeFavouriteMovy(FavouriteMovie favouriteMovy) {
		getFavouriteMovies().remove(favouriteMovy);
		favouriteMovy.setMovie(null);

		return favouriteMovy;
	}

	public List<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public Rating addRating(Rating rating) {
		getRatings().add(rating);
		rating.setMovie(this);

		return rating;
	}

	public Rating removeRating(Rating rating) {
		getRatings().remove(rating);
		rating.setMovie(null);

		return rating;
	}

	public List<WatchedMovie> getWatchedMovies() {
		return this.watchedMovies;
	}

	public void setWatchedMovies(List<WatchedMovie> watchedMovies) {
		this.watchedMovies = watchedMovies;
	}

	public WatchedMovie addWatchedMovy(WatchedMovie watchedMovy) {
		getWatchedMovies().add(watchedMovy);
		watchedMovy.setMovie(this);

		return watchedMovy;
	}

	public WatchedMovie removeWatchedMovy(WatchedMovie watchedMovy) {
		getWatchedMovies().remove(watchedMovy);
		watchedMovy.setMovie(null);

		return watchedMovy;
	}

	public List<View> getViewsSet() {
		return this.viewsSet;
	}

	public void setViewsSet(List<View> viewsSet) {
		this.viewsSet = viewsSet;
	}

	public View addViewsSet(View viewsSet) {
		getViewsSet().add(viewsSet);
		viewsSet.setMovie(this);

		return viewsSet;
	}

	public View removeViewsSet(View viewsSet) {
		getViewsSet().remove(viewsSet);
		viewsSet.setMovie(null);

		return viewsSet;
	}
	
	public Long getViewByMovie() {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT COUNT(v) FROM View v where v.movie.movieId = : id";
		
		Query query = em.createQuery(jpql);
		query.setParameter("id", this.movieId);
		
		return (Long) query.getSingleResult();
	}
	
	public Long getFavoriuteByMovie() {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT COUNT(f) FROM FavouriteMovie f  where f.movie.movieId = : id";
		
		Query query = em.createQuery(jpql);
		query.setParameter("id", this.movieId);
		
		return (Long) query.getSingleResult();
	}
	
	public Long getRatingByMovie() {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT COUNT(r) FROM Rating r where r.movie.movieId = :id";
		
		Query query = em.createQuery(jpql);
		query.setParameter("id", this.movieId);
		
		return (Long) query.getSingleResult();
	}

}