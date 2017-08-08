package com.kekemile.po;

/**
 * 论文页面进行模糊查询的方法
 * 
 * @author Guxing
 *
 */
/**
 * @author guxing
 *
 */
public class LunwenVo {

	private String lwname;

	private String workplace;

	private String isnamenuist;

	private String doi;

	private String email;

	private String status;

	// 分页用到变量
	private Integer page = 1;

	private Integer start;

	private Integer size = 5;

	public LunwenVo() {
		super();
	}

	public LunwenVo(String lwname, String workplace, String isnamenuist, String doi, String email, String status,
			Integer page, Integer start, Integer size) {
		super();
		this.lwname = lwname;
		this.workplace = workplace;
		this.isnamenuist = isnamenuist;
		this.doi = doi;
		this.email = email;
		this.status = status;
		this.page = page;
		this.start = start;
		this.size = size;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getLwname() {
		return lwname;
	}

	public void setLwname(String lwname) {
		this.lwname = lwname;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getIsnamenuist() {
		return isnamenuist;
	}

	public void setIsnamenuist(String isnamenuist) {
		this.isnamenuist = isnamenuist;
	}

	public String getDoi() {
		return doi;
	}

	public void setDoi(String doi) {
		this.doi = doi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "LunwenVo [lwname=" + lwname + ", workplace=" + workplace + ", isnamenuist=" + isnamenuist + ", doi="
				+ doi + ", email=" + email + ", status=" + status + ", page=" + page + ", start=" + start + ", size="
				+ size + "]";
	}

}