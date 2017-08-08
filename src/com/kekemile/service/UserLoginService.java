package com.kekemile.service;

import com.kekemile.po.ModifyPwdVo;
import com.kekemile.po.User;
import com.kekemile.po.UserLoginVo;

/**
 * 用户登陆的service
 * 
 * @author Guxing
 *
 */
public interface UserLoginService {

	/**
	 * 根据用户的姓名跟密码验证用户
	 * 
	 * @param name
	 * @param password
	 * @return User
	 */
	public User findUser(UserLoginVo userVo) throws Exception;
	
	/**
	 * 根据用户的邮箱更改用户的密码
	 * @param userVo
	 * @return
	 * @throws Exception
	 */
	public Boolean modifyPwdByEmail(ModifyPwdVo modifyPwdVo) throws Exception;
	
}
