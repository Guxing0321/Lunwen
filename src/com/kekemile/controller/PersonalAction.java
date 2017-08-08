package com.kekemile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kekemile.po.LunwenVo;
import com.kekemile.po.ModifyPwdVo;
import com.kekemile.po.User;
import com.kekemile.service.LunwenService;
import com.kekemile.service.UserLoginService;

/**
 * 个人信息处理的控制类
 * 
 * @author guxing
 *
 */
@Controller
public class PersonalAction {

	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private LunwenService LunwenService;

	@RequestMapping("/modifyPassword")
	public String ModifyPassword() {

		return "ModifyPassword";
	}

	/**
	 * 
	 * 
	 * @return String
	 * 
	 */
	@RequestMapping("/toMydetailInfo")
	public String toMDetailInfo(LunwenVo vo, HttpSession session,Model model) {
		User user = (User) session.getAttribute("userLogin");
		int allTitleCount = 0;
		int checkCount = 0;
		int uncheckCount=0;
		if (user != null) {
			vo.setEmail(user.getEmail());
			// 所有论文的篇数
			allTitleCount = LunwenService.searchAllTitleCount(vo);
			// 已通过审核的论文篇数
			vo.setStatus("通过");
			checkCount = LunwenService.searchAllTitleCount(vo);
			uncheckCount = allTitleCount - checkCount;
		}
		model.addAttribute("allTitleCount", allTitleCount);
		model.addAttribute("checkCount", checkCount);
		model.addAttribute("uncheckCount", uncheckCount);
		return "MydetailInfo";
	}

	/**
	 * 
	 * 根据email 修改论文的信息
	 * 
	 * @param modifyPwdVo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/changePassword")
	public String ChangePassword(ModifyPwdVo modifyPwdVo) throws Exception {

		// 打印出从前台传过来的对象的值
		System.out.println("从前台传过来的vo值   :  " + modifyPwdVo);

		Boolean isModify = userLoginService.modifyPwdByEmail(modifyPwdVo);
		System.out.println("是否成功修改密码 ： " + isModify);
		return "login";
	}

}
