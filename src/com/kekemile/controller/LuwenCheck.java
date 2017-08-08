package com.kekemile.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kekemile.mail.SendMail_gu;
import com.kekemile.po.CheckLunwen;
import com.kekemile.po.Lunwen;
import com.kekemile.po.LunwenDetailVo;
import com.kekemile.po.LunwenVo;
import com.kekemile.po.PDFinfo;
import com.kekemile.po.UncheckLunwenVo;
import com.kekemile.po.UpdateScoreVo;
import com.kekemile.po.User;
import com.kekemile.service.LunwenService;
import com.kekemile.service.PdfService;
import com.kekemile.service.UncheckedLunwenService;

import cn.itcast.utils.Page;

/**
 * 论文审核的控制类
 * 
 * @author guxing
 *
 */
@Controller
@RequestMapping("/luwenCheck")
public class LuwenCheck {
	// 未被审核的论文
	@Autowired
	private UncheckedLunwenService uncheckedLunwenService;
	// 自动装配pdfSerivce
	@Autowired
	private PdfService pdfService;
	//自动装配论文的service
	@Autowired
	private LunwenService lunwenService;

	// 查询所有未被审核的论文
	@RequestMapping("/uncheckedLunwen")
	public String unCheckedTitle(Model model, UncheckLunwenVo unCheckLunwenVo) throws UnsupportedEncodingException {

		// 处理乱码
		if (unCheckLunwenVo.getLwname() != null) {
			unCheckLunwenVo.setLwname(new String(unCheckLunwenVo.getLwname().getBytes("iso8859-1"), "utf-8"));
		}
		if (unCheckLunwenVo.getWorkplace() != null) {
			unCheckLunwenVo.setWorkplace(new String(unCheckLunwenVo.getWorkplace().getBytes("iso8859-1"), "utf-8"));
		}
		if (unCheckLunwenVo.getDoi() != null) {
			unCheckLunwenVo.setDoi(new String(unCheckLunwenVo.getDoi().getBytes("iso8859-1"), "utf-8"));
		}
		
		System.out.println(" ___unCheckLunwenVo ___"+ unCheckLunwenVo);
		
		if (unCheckLunwenVo.getPage() == null) {
			unCheckLunwenVo.setPage(1);
		}

		// 设置查询的起始记录条数
		unCheckLunwenVo.setStart((unCheckLunwenVo.getPage() - 1) * unCheckLunwenVo.getSize());

		// unCheckLunwenVo.setLwname("xx");
		List<Lunwen> list = uncheckedLunwenService.searchAUncheckedTitle(unCheckLunwenVo);
		int allCount = uncheckedLunwenService.searchAUncheckedTitleCount(unCheckLunwenVo);
		System.out.println("-------------  Lunwen  List --------------");
		System.out.println(list);
		System.out.println("-------------      end      -------------");

		Page<Lunwen> page = new Page<Lunwen>();
		page.setTotal(allCount); // 数据总数
		page.setSize(unCheckLunwenVo.getSize()); // 每页显示条数
		page.setPage(unCheckLunwenVo.getPage()); // 当前页数
		page.setRows(list); // 数据列表

		model.addAttribute("page", page);
		model.addAttribute("lwname", unCheckLunwenVo.getLwname());
		model.addAttribute("workplace", unCheckLunwenVo.getWorkplace());
		model.addAttribute("doi", unCheckLunwenVo.getDoi());

		return "CheckTitle";
	}

	
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

	

		model.addAttribute("page", page);
		model.addAttribute("lwname", vo1.getLwname());
		model.addAttribute("workplace", vo1.getWorkplace());
		model.addAttribute("doi", vo1.getDoi());

		return "CheckTitle";
	}
	
	
	
	// 论论文的详细情况页面
	@RequestMapping("/detail")
	@ResponseBody
	public LunwenDetailVo detail(int id, HttpSession session) throws ParseException {
		LunwenDetailVo lunwenDetail = new LunwenDetailVo();
		Lunwen lunwen = uncheckedLunwenService.searchTitleById(id);
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

	// 审核文的信息
	@RequestMapping("/checkTitle")
	public String updateLunwen(CheckLunwen checkLunwen) {

		System.out.println(checkLunwen);

		// 声明我们需要添加的分数
		float addScore = 0;
		// 判断我们传过来的审核论文信息中审核是否通过
		if (checkLunwen != null) {
			// 若论文的已经通过
			if (checkLunwen.getStatus().equals("通过")) {
				addScore += 0.5;
				// 在用户的信息中添加相应的分数
				if (checkLunwen.getDoiIsWork().equals("是")) {
					addScore += 0.5;
				}
				// 用户是否署名南信大
				if (checkLunwen.getIsnamenuist().equals("是")) {
					addScore += 0.5;
				}
			}
		}

		// 申明UpdateScoreVo對象
		UpdateScoreVo updateScoreVo = new UpdateScoreVo();
        //申明论文对象
		Lunwen lunwen = null;
		if (checkLunwen != null) {
            //将分数添加进去
			if (checkLunwen.getEmail() != "") {

				updateScoreVo.setEmail(checkLunwen.getEmail());
				updateScoreVo.setScore(addScore);

			}
			//将我们的论文信息查出来
		
			if (checkLunwen.getLwid() != 0) {
				System.out.println("论文的id ： "+checkLunwen.getLwid());
				lunwen = lunwenService.searchTitleById(checkLunwen.getLwid());
			}

		}

		Boolean flag1 = uncheckedLunwenService.updateScoreByEmail(updateScoreVo);
		System.out.println("修改用户的分数是否成功 " + flag1);

		Boolean flag2 = uncheckedLunwenService.checkLuwenById(checkLunwen);
		System.out.println("修改论文信息是否成功 : " + flag2);

		// 发送邮件
		if (checkLunwen != null & lunwen != null) {

			if (checkLunwen.getEmail() != "") {

				SendMail_gu.checkTitle(lunwen, checkLunwen, addScore);
				
			}

		}

		return "title";
	}

}
