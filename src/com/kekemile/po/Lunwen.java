package com.kekemile.po;

/**
 * 论文表的实体类
 * 
 * @author Guxing
 *
 */
public class Lunwen {
	private Integer lwid;

	private String lwname;

	private String author;

	private String workplace;

	private String publishtime;

	private Integer thistitlescore;

	private String isnamenuist;

	private String doi;

	private String refertitle;

	private String mname;

	private String mtype;

	private String mcodenum;

	private String status;

	private String email;

	private String beizhu;

	public Lunwen() {
		super();
	}

	public Lunwen(Integer lwid, String lwname, String author, String workplace, String publishtime,
			Integer thistitlescore, String isnamenuist, String doi, String refertitle, String mname, String mtype,
			String mcodenum, String status, String email, String beizhu) {
		super();
		this.lwid = lwid;
		this.lwname = lwname;
		this.author = author;
		this.workplace = workplace;
		this.publishtime = publishtime;
		this.thistitlescore = thistitlescore;
		this.isnamenuist = isnamenuist;
		this.doi = doi;
		this.refertitle = refertitle;
		this.mname = mname;
		this.mtype = mtype;
		this.mcodenum = mcodenum;
		this.status = status;
		this.email = email;
		this.beizhu = beizhu;
	}

	public Integer getLwid() {
		return lwid;
	}

	public void setLwid(Integer lwid) {
		this.lwid = lwid;
	}

	public String getLwname() {
		return lwname;
	}

	public void setLwname(String lwname) {
		this.lwname = lwname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}

	public Integer getThistitlescore() {
		return thistitlescore;
	}

	public void setThistitlescore(Integer thistitlescore) {
		this.thistitlescore = thistitlescore;
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

	public String getRefertitle() {
		return refertitle;
	}

	public void setRefertitle(String refertitle) {
		this.refertitle = refertitle;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getMcodenum() {
		return mcodenum;
	}

	public void setMcodenum(String mcodenum) {
		this.mcodenum = mcodenum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	@Override
	public String toString() {
		return "Lunwen [lwid=" + lwid + ", lwname=" + lwname + ", author=" + author + ", workplace=" + workplace
				+ ", publishtime=" + publishtime + ", thistitlescore=" + thistitlescore + ", isnamenuist=" + isnamenuist
				+ ", doi=" + doi + ", refertitle=" + refertitle + ", mname=" + mname + ", mtype=" + mtype
				+ ", mcodenum=" + mcodenum + ", status=" + status + ", email=" + email + ", beizhu=" + beizhu + "]";
	}

}