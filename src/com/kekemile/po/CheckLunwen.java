package com.kekemile.po;

/**
 * 
 * 审核论文是否通过的实体类
 * 
 * @author guxing
 *
 */
public class CheckLunwen {

	private int lwid; // 论文的id
	private String isnamenuist;// 是否署名南信大
	private String doiIsWork; // DOI号是否有效
	private String status; // 是否通过
	private String beizhu; // 审核论文的备注
	private String email;// 审核论文的email

	public CheckLunwen() {
		super();
	}

	public CheckLunwen(int lwid, String isnamenuist, String doiIsWork, String status, String beizhu, String email) {
		super();
		this.lwid = lwid;
		this.isnamenuist = isnamenuist;
		this.doiIsWork = doiIsWork;
		this.status = status;
		this.beizhu = beizhu;
		this.email = email;
	}

	public int getLwid() {
		return lwid;
	}

	public void setLwid(int lwid) {
		this.lwid = lwid;
	}

	public String getIsnamenuist() {
		return isnamenuist;
	}

	public void setIsnamenuist(String isnamenuist) {
		this.isnamenuist = isnamenuist;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getDoiIsWork() {
		return doiIsWork;
	}

	public void setDoiIsWork(String doiIsWork) {
		this.doiIsWork = doiIsWork;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "CheckLunwen [lwid=" + lwid + ", isnamenuist=" + isnamenuist + ", doiIsWork=" + doiIsWork + ", status="
				+ status + ", beizhu=" + beizhu + ", email=" + email + "]";
	}

}
