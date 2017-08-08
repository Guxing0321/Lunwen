package com.kekemile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kekemile.po.User;
import com.kekemile.po.UserLoginVo;
import com.kekemile.service.UserLoginService;

/**
 * 用户登陆的方法
 * 
 * @author xingu
 *
 */
@Controller
public class Login {

	@Autowired
	private UserLoginService userLoginService;

	/**
	 * 
	 * 跳转登录的方法
	 * 
	 * @author Guxing
	 * @return ModelAndView
	 * 
	 */
	@RequestMapping("login")
	public String login() {

		return "login";

	}

	// 验证用户登陆跳转的方法
		@RequestMapping("userLogin")
		public String userLogin(UserLoginVo userLoginVo,HttpSession session) throws Exception {
		
			User user = userLoginService.findUser(userLoginVo);
			// 判断用户是否存在
			if (user != null) {
				//将我们的用户信息存放session中去
				session.setAttribute("userLogin", user);
				
				// 如果是管理员就跳转到管理员页面
				if (user.getTypeid() == 1) {
					return "adindex";
				} else {
					return "usindex";
				}
				
			}
			
			
			return "login";
		}
		
		
	
	
	
	
	@RequestMapping("/logout")
	public String logout(){
		
		
		//返回到登录页面
		return "login";
	}
	
	

}
