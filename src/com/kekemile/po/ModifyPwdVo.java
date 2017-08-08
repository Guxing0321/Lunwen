package com.kekemile.po;

/**
 * 根据邮箱修改密码的vo类
 * 
 * @author guxing
 *
 */
public class ModifyPwdVo {

	private String email; //邮箱
	private String newpassword;//新密码

	public ModifyPwdVo() {
		super();
	}

	public ModifyPwdVo(String email, String newpassword) {
		super();
		this.email = email;
		this.newpassword = newpassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	@Override
	public String toString() {
		return "ModifyPwdVo [email=" + email + ", newpassword=" + newpassword + "]";
	}

}
