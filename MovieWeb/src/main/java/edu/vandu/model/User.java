package edu.vandu.model;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Users database table.
 * 
 */
@Entity
@Table(name="Users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String username;

	private String avatar;

	private String email;

	private String fullname;

	private String password;

	private boolean role;
	
	private boolean isDelete;
	
	private boolean activated;
	//bi-directional many-to-one association to FavouriteMovy
	@OneToMany(mappedBy="user")
	private List<FavouriteMovie> favouriteMovies;

	//bi-directional many-to-one association to Rating
	@OneToMany(mappedBy="user")
	private List<Rating> ratings;

	//bi-directional many-to-one association to Token
	@OneToMany(mappedBy="user")
	private List<Token> tokens;

	//bi-directional many-to-one association to WatchedMovy
	@OneToMany(mappedBy="user")
	private List<WatchedMovie> watchedMovies;

	//bi-directional many-to-one association to View
	@OneToMany(mappedBy="user")
	private List<View> views;

	public User() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getRole() {
		return this.role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}
	
	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}


	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public List<FavouriteMovie> getFavouriteMovies() {
		return this.favouriteMovies;
	}

	public void setFavouriteMovies(List<FavouriteMovie> favouriteMovies) {
		this.favouriteMovies = favouriteMovies;
	}

	public FavouriteMovie addFavouriteMovy(FavouriteMovie favouriteMovy) {
		getFavouriteMovies().add(favouriteMovy);
		favouriteMovy.setUser(this);

		return favouriteMovy;
	}

	public FavouriteMovie removeFavouriteMovy(FavouriteMovie favouriteMovy) {
		getFavouriteMovies().remove(favouriteMovy);
		favouriteMovy.setUser(null);

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
		rating.setUser(this);

		return rating;
	}

	public Rating removeRating(Rating rating) {
		getRatings().remove(rating);
		rating.setUser(null);

		return rating;
	}

	public List<Token> getTokens() {
		return this.tokens;
	}

	public void setTokens(List<Token> tokens) {
		this.tokens = tokens;
	}

	public Token addToken(Token token) {
		getTokens().add(token);
		token.setUser(this);

		return token;
	}

	public Token removeToken(Token token) {
		getTokens().remove(token);
		token.setUser(null);

		return token;
	}

	public List<WatchedMovie> getWatchedMovies() {
		return this.watchedMovies;
	}

	public void setWatchedMovies(List<WatchedMovie> watchedMovies) {
		this.watchedMovies = watchedMovies;
	}

	public WatchedMovie addWatchedMovy(WatchedMovie watchedMovy) {
		getWatchedMovies().add(watchedMovy);
		watchedMovy.setUser(this);

		return watchedMovy;
	}

	public WatchedMovie removeWatchedMovy(WatchedMovie watchedMovy) {
		getWatchedMovies().remove(watchedMovy);
		watchedMovy.setUser(null);

		return watchedMovy;
	}

	public List<View> getViews() {
		return this.views;
	}

	public void setViews(List<View> views) {
		this.views = views;
	}

	public View addView(View view) {
		getViews().add(view);
		view.setUser(this);

		return view;
	}

	public View removeView(View view) {
		getViews().remove(view);
		view.setUser(null);

		return view;
	}

}