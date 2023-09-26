package edu.vandu.model;

import java.io.Serializable;
import javax.persistence.*;

import edu.vandu.utils.JpaUtils;
import net.bytebuddy.asm.Advice.This;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Episode database table.
 * 
 */
@Entity
@NamedQuery(name="Episode.findAll", query="SELECT e FROM Episode e")
public class Episode implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long episodeId;

	private Date createDate;

	private String description;

	private String source;

	private String title;

	//bi-directional many-to-one association to Movy
	@ManyToOne
	@JoinColumn(name="movieId")
	private Movie movie;

	//bi-directional many-to-one association to View
	@OneToMany(mappedBy="episode")
	private List<View> views;

	public Episode() {
	}

	public long getEpisodeId() {
		return this.episodeId;
	}

	public void setEpisodeId(long episodeId) {
		this.episodeId = episodeId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Movie getMovie() {
		return this.movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public List<View> getViews() {
		return this.views;
	}

	public void setViews(List<View> views) {
		this.views = views;
	}

	public View addView(View view) {
		getViews().add(view);
		view.setEpisode(this);

		return view;
	}

	public View removeView(View view) {
		getViews().remove(view);
		view.setEpisode(null);

		return view;
	}
	
	public Long getViewByEpisode() {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "SELECT COUNT(v) FROM View v  where v.episode.episodeId = :id";
		
		Query query = em.createQuery(jpql);
		query.setParameter("id", this.episodeId);
		
		return (Long) query.getSingleResult();
	}
	
	public static void main(String[] args) {
		Episode episode = new Episode();
		episode.setEpisodeId(5);
		System.out.println(String.valueOf(episode.getViewByEpisode()));
	}

}