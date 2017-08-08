package com.kekemile.po;

/**
 * 实体类
 * 
 * @author Guxing
 *
 */
public class Mangazine {
	private Integer mid;

	private String mname;

	private String mtype;

	private String mcodenum;

	public Mangazine() {
		super();
	}

	public Mangazine(String mname, String mtype, String mcodenum) {

		this.mname = mname;
		this.mtype = mtype;
		this.mcodenum = mcodenum;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname == null ? null : mname.trim();
	}

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype == null ? null : mtype.trim();
	}

	public String getMcodenum() {
		return mcodenum;
	}

	public void setMcodenum(String mcodenum) {
		this.mcodenum = mcodenum == null ? null : mcodenum.trim();
	}

	@Override
	public String toString() {
		return "Mangazine [mid=" + mid + ", mname=" + mname + ", mtype=" + mtype + ", mcodenum=" + mcodenum + "]";
	}

}