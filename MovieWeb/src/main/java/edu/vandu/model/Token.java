package edu.vandu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.*;


/**
 * The persistent class for the Token database table.
 * 
 */
@Entity
@NamedQuery(name="Token.findAll", query="SELECT t FROM Token t")
public class Token implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private Date createAt;

	private Date expriedAt;

	private String token;

	private String tokenType;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public Token() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCreateAt() {
		return this.createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getExpriedAt() {
		return this.expriedAt;
	}

	public void setExpriedAt(Date expriedAt) {
		this.expriedAt = expriedAt;
	}

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getTokenType() {
		return this.tokenType;
	}

	public void setTokenType(String tokenType) {
		this.tokenType = tokenType;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public boolean checkExpried() {
		return new Date().after(expriedAt);
	}

}