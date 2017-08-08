package com.kekemile.service;

import com.kekemile.po.PDFinfo;

/**
 * 论文信息查询的接口
 * @author xingu
 *
 */
public interface PdfService {
	 /**
	  * 插入新的论文pdf信息
	  * 
	 * @param pdf
	 * @return Boolean
	 * @author xingu
	 */
	public Boolean insertPdf(PDFinfo pdf);
	/**
	 * 根据doi号码查询论文的信息
	 * 
	 * @param doi
	 * @return PDFinfo
	 */
	public PDFinfo selectPdfByDoi(String pDoi);
	
	
}
