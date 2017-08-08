package com.kekemile.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kekemile.mapper.UserMapper;
import com.kekemile.po.ModifyPwdVo;
import com.kekemile.po.User;
import com.kekemile.po.UserLoginVo;
import com.kekemile.service.UserLoginService;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	// 自动注解mapper
	@Autowired
	private UserMapper usermapper;

	@Override
	public User findUser(UserLoginVo userVo) throws Exception {

		User user = usermapper.selectByNameAndPassword(userVo);

		return user;
	}

	@Override
	public Boolean modifyPwdByEmail(ModifyPwdVo modifyPwdVo) throws Exception {
		Boolean flag = usermapper.modifyPwdByEmail(modifyPwdVo);

		return flag;
	}

}
