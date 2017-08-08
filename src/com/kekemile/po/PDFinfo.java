package com.kekemile.po;

/**
 * pdf 信息类
 * 
 * @author xingu
 *
 */
public class PDFinfo {
	private int id; // id信息
	private String pName; // pdf文件名字信息
	private String pPath; // 路径名信息
	private String pDoi; // doi信息

	public PDFinfo() {
		super();
	}

	public PDFinfo(int id, String pName, String pPath, String pDoi) {
		super();
		this.id = id;
		this.pName = pName;
		this.pPath = pPath;
		this.pDoi = pDoi;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpPath() {
		return pPath;
	}

	public void setpPath(String pPath) {
		this.pPath = pPath;
	}

	public String getpDoi() {
		return pDoi;
	}

	public void setpDoi(String pDoi) {
		this.pDoi = pDoi;
	}

	@Override
	public String toString() {
		return "PDFinfo [id=" + id + ", pName=" + pName + ", pPath=" + pPath + ", pDoi=" + pDoi + "]";
	}

}
