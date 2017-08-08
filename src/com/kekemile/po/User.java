package com.kekemile.po;

/**
 * 用户表
 * 
 * @author Guxing
 *
 */
public class User {
	private Integer uid;

	private String name;

	private String password;

	private String email;

	private Integer score;

	private Integer typeid;

	public User() {

	}

	public User(String name, String password, String email, Integer score, Integer typeid) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.score = score;
		this.typeid = typeid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
}