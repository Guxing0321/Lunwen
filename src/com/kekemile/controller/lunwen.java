package com.kekemile.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kekemile.mail.SendMail_gu;
import com.kekemile.po.Lunwen;
import com.kekemile.po.LunwenDetailVo;
import com.kekemile.po.LunwenVo;
import com.kekemile.po.PDFinfo;
import com.kekemile.po.User;
import com.kekemile.service.LunwenService;
import com.kekemile.service.PdfService;

import cn.itcast.utils.Page;

/**
 * 测试论文的页面
 * 
 * @author Guxing
 *
 */
@Controller
@RequestMapping("/lunwen")
public class lunwen {

	// 自动装配的lunwenService
	@Autowired
	private LunwenService lunwenService;
	// 自动装配pdfSerivce
	@Autowired
	private PdfService pdfService;

	// 测试我们论文查询页面样式
	@RequestMapping("/selectTitle")
	public String selectTitle(LunwenVo vo1, Model model, HttpSession session) throws UnsupportedEncodingException {

		// 处理乱码
		if (vo1.getLwname() != null) {
			vo1.setLwname(new String(vo1.getLwname().getBytes("iso8859-1"), "utf-8"));
		}
		if (vo1.getWorkplace() != null) {
			vo1.setWorkplace(new String(vo1.getWorkplace().getBytes("iso8859-1"), "utf-8"));
		}
		if (vo1.getDoi() != null) {
			vo1.setDoi(new String(vo1.getDoi().getBytes("iso8859-1"), "utf-8"));
		}
		if (vo1.getStatus() != null) {
			vo1.setStatus(new String(vo1.getStatus().getBytes("iso8859-1"), "utf-8"));
		}
		User user = (User) session.getAttribute("userLogin");
		System.out.println("user" + user);
		// 用户对象不为空的时候将用户的对象的email取出来赋值
		if (user != null) {
			vo1.setEmail(user.getEmail());
			System.out.println("---------------");
			System.out.println("user   Email" + user.getEmail());
			System.out.println("----------------");
		}

		System.out.println("论文的查询的vo类  " + vo1);

		if (vo1.getPage() == null) {
			vo1.setPage(1);
		}

		// 设置查询的起始记录条数
		vo1.setStart((vo1.getPage() - 1) * vo1.getSize());

		// 查询所有的论文信息
		List<Lunwen> list = lunwenService.searchAllTitle(vo1);
		System.out.println(list);
		int allTitleCount = lunwenService.searchAllTitleCount(vo1);

		Page<Lunwen> page = new Page<Lunwen>();
		page.setTotal(allTitleCount); // 数据总数
		page.setSize(vo1.getSize()); // 每页显示条数
		page.setPage(vo1.getPage()); // 当前页数
		page.setRows(list); // 数据列表

		// 给页面的select进行查询
		List<String> statusList = new ArrayList<String>();
		statusList.add("通过");
		statusList.add("不通过");
		statusList.add("未审核");

		model.addAttribute("page", page);
		model.addAttribute("lwname", vo1.getLwname());
		model.addAttribute("workplace", vo1.getWorkplace());
		model.addAttribute("doi", vo1.getDoi());
		model.addAttribute("statusinLunwen", vo1.getStatus());
		model.addAttribute("statusList", statusList);

		return "title";
	}

	// 测试论文信息页面
	@RequestMapping("/TestTitle")
	public String TestTitle() {

		return "TitleTest";
	}

	// 跳转到添加论文信息页面
	@RequestMapping("/addTitle")
	public String addTitle() {

		return "addTitle";
	}

	// 添加论文信息，并跳转
	@RequestMapping(value = "/addTitleIntoSql")
	public String addTitleResult(Lunwen lw01, @RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Model model, HttpSession session) throws ParseException {
		// 获取用户邮件的方法
		User user = (User) session.getAttribute("userLogin");
		if (user != null) {
			lw01.setEmail(user.getEmail());
			System.out.println("用户邮箱已经添加成功:" + user.getEmail());
		}

		// 打印出论文信息
		System.out.println("-----------------------");
		System.out.println("打印出论文的信息");
		System.out.println(lw01);
		System.out.println("-----------------------");

		// 调用service中insert方法，添加论文信息
		Boolean isInserLunwen = lunwenService.insertTitle(lw01);

		// 调用发送邮件的方法

		System.out.println("论文的信息是否已经添加成功：" + isInserLunwen);
		/*
		 * 添加论文pdf文件
		 *
		 */
		System.out.println("开始");
		String path = request.getSession().getServletContext().getRealPath("upload");
		// String fileName = file.getOriginalFilename();
		// 重新定义我们的文件名
		String fileName = new Date().getTime() + ".pdf";
		System.out.println(path);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}

		// 保存
		try {
			file.transferTo(targetFile);

		} catch (Exception e) {
			e.printStackTrace();

		}
		// 定义文件的全路径名
		String pPath = request.getContextPath() + "/upload/" + fileName;
		// 声明pdf文件对象
		PDFinfo pdFinfo = new PDFinfo();

		pdFinfo.setpDoi(lw01.getDoi());
		pdFinfo.setpName(fileName);
		pdFinfo.setpPath(pPath);

		Boolean isInsertPdf = pdfService.insertPdf(pdFinfo);

		System.out.println("pdf文件是否存入数据库中： " + isInsertPdf);

		// 发送邮件的方法
		if (isInsertPdf && isInserLunwen) {

			SendMail_gu.addTitle(lw01, user);
		}

		return "success";
	}

	// 论论文的详细情况页面
	@RequestMapping("/detail")
	@ResponseBody
	public LunwenDetailVo detail(int id, HttpSession session) throws ParseException {
		LunwenDetailVo lunwenDetail = new LunwenDetailVo();
		Lunwen lunwen = lunwenService.searchTitleById(id);
		System.out.println(lunwen);

		// 根据论文的doi信息查询论文的pdf文件信息
		PDFinfo pdFinfo = pdfService.selectPdfByDoi(lunwen.getDoi());
		System.out.println("pdFinfo : " + pdFinfo);
		// model.addAttribute("edit_date2", lunwen.getPublishtime());
		// session.setAttribute("pdFinfo", pdFinfo);
		lunwenDetail.setLunwen(lunwen);
		if (pdFinfo != null) {
			lunwenDetail.setUrl(pdFinfo.getpPath());
			lunwenDetail.setPdfName(pdFinfo.getpName());
		}

		return lunwenDetail;
	}

	// 删除论文信息
	@RequestMapping("/deleteLuwnenById")
	public String deleteLunwenById(Integer id, HttpSession session) {

		System.out.println("id = " + id);
		// 查询到要被删除的论文系统
		Lunwen lunwen = lunwenService.searchTitleById(id);
		// 获取用户邮件的方法
		User user = (User) session.getAttribute("userLogin");
		// 判断论文信息是否成功删除
		Boolean flag = lunwenService.deleteLunwenById(id);

		// 发送邮件提示已经删除邮件
		if (flag == true && user != null) {
			SendMail_gu.deleteTitle(lunwen, user);
		}

		System.out.println("删除论文是否从成功： " + flag);

		return "title";
	}

	// 修改论文的信息
	@RequestMapping("/update")
	public String updateLunwen(Lunwen lw, HttpSession session) {

		System.out.println(lw);
		Boolean flag = lunwenService.updateLuwenById(lw);
		System.out.println("修改论文信息是否成功 : " + flag);

		// 获取用户邮件的方法
		User user = (User) session.getAttribute("userLogin");
		// 修改论文信息成功
		if (flag == true && user != null) {
			SendMail_gu.updateTitle(lw, user);
		}
		return "title";
	}

	// 跳转到批量添加论文信息页面
	@RequestMapping("/gotoBantchJsp")
	public String gotoBatchImport() {

		return "batchImport";
	}

	// 批量添加论文信息
	@RequestMapping(value = "/batchimport", method = RequestMethod.POST)
	public String batchimport(@RequestParam(value = "filename") MultipartFile file, Model model,
			HttpServletRequest request) {

		System.out.println("AddController ..batchimport() start");
		// 判断文件是否为空
		if (file == null)
			return null;
		// 获取文件名
		String name = file.getOriginalFilename();
		// 进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
		long size = file.getSize();
		if (name == null || ("").equals(name) && size == 0)
			return null;

		// 批量导入。参数：文件名，文件。
		boolean b = lunwenService.batchImport(name, file, request);

		String Msg = "";
		if (b) {
			Msg = "批量导入EXCEL成功！";
		} else {
			Msg = "批量导入EXCEL失败！";
		}

		model.addAttribute("msg", Msg);

		return "batchImport";

	}

}
