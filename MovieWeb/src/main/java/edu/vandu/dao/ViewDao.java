package edu.vandu.dao;

import java.util.Date;

import edu.vandu.model.Episode;
import edu.vandu.model.Movie;
import edu.vandu.model.User;
import edu.vandu.model.View;

public class ViewDao extends AbstractEntityDao<View> {

	public ViewDao() {
		super(View.class);
		
	}
	
	public void watch(User user,Episode episode,Movie movie) {
		View view = new View();
		view.setUser(user);
		view.setMovie(movie);
		view.setEpisode(episode);
		view.setViewDate(new Date());
		insert(view);
	}

}
