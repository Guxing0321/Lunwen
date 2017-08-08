package com.kekemile.mapper;

import com.kekemile.po.ModifyPwdVo;
import com.kekemile.po.User;
import com.kekemile.po.UserExample;
import com.kekemile.po.UserLoginVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * 用户Mapper接口
 * @author Guxing
 *
 */
public interface UserMapper {
	 
    /**
     * 根据用户名字跟密码查询用户的信息
     * @param user
     * @return
     */
    public User selectByNameAndPassword(UserLoginVo user);
    
    /**
	 * 根据用户的邮箱更改用户的密码
	 * @param userVo
	 * @return
	 * @throws Exception
	 */
	public Boolean modifyPwdByEmail(ModifyPwdVo modifyPwdVo) throws Exception;


}