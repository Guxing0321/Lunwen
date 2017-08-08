package com.kekemile.po;

/**
 * 显示论文的详细信息
 * 
 * @author xingu
 *
 */
public class LunwenDetailVo {

	private Lunwen lunwen;

	private String url; // 路径地址

	private String pdfName;

	public Lunwen getLunwen() {
		return lunwen;
	}

	public void setLunwen(Lunwen lunwen) {
		this.lunwen = lunwen;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPdfName() {
		return pdfName;
	}

	public void setPdfName(String pdfName) {
		this.pdfName = pdfName;
	}

}
