package com.kekemile.mapper;

import com.kekemile.po.PDFinfo;

public interface PdfMapper {
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
