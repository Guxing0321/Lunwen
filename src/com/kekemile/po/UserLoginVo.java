package com.kekemile.po;

/**
 * 用户登录系统的Vo类
 * 
 * @author guxing
 *
 */
public class UserLoginVo {
	private String name; // 用户的名字
	private String email; // 用户的邮箱
	private String password; // 用户的密码

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
