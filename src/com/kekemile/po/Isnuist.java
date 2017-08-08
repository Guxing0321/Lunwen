package com.kekemile.po;

/**
 * 字典表 是否是南信大 的实体类
 * 
 * @author Guxing
 *
 */
public class Isnuist {
	private Integer id;

	private Integer isnuist;

	private String isnuistname;

	public Isnuist() {
		super();

	}

	public Isnuist(Integer id, Integer isnuist, String isnuistname) {
		super();
		this.id = id;
		this.isnuist = isnuist;
		this.isnuistname = isnuistname;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIsnuist() {
		return isnuist;
	}

	public void setIsnuist(Integer isnuist) {
		this.isnuist = isnuist;
	}

	public String getIsnuistname() {
		return isnuistname;
	}

	public void setIsnuistname(String isnuistname) {
		this.isnuistname = isnuistname == null ? null : isnuistname.trim();
	}

	@Override
	public String toString() {
		return "Isnuist [id=" + id + ", isnuist=" + isnuist + ", isnuistname=" + isnuistname + "]";
	}

}