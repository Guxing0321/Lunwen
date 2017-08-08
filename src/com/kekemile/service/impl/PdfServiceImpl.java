package com.kekemile.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kekemile.mapper.PdfMapper;
import com.kekemile.po.PDFinfo;
import com.kekemile.service.PdfService;

@Service
public class PdfServiceImpl implements PdfService {
     @Autowired
	private PdfMapper pdfMapper;
	
     //插入论文pdf信息
	@Override
	public Boolean insertPdf(PDFinfo pdf) {
		Boolean flag = pdfMapper.insertPdf(pdf);
		
		return flag;
	}
   //根据论文的doi信息查询论文的信息
	@Override
	public PDFinfo selectPdfByDoi(String pDoi) {
		PDFinfo pdFinfo = pdfMapper.selectPdfByDoi(pDoi);
		return pdFinfo;
	}

}
