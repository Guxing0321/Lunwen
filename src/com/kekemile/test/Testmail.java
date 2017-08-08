package com.kekemile.test;

import com.kekemile.mail.SendMail_gu;
import com.kekemile.po.Lunwen;
import com.kekemile.po.User;

/**
 * 测试发送邮件的方法
 * @author guxing
 *
 */
public class Testmail {
public static void main(String[] args) {
	//发送测试邮件
	//SendEmailUtils.send("guxing0321@163.com","guxing@kekemile.com", "kekemile 提示邮件", "This is a mail to make you happy!");
  Lunwen lunwen = new Lunwen(11, "keke", "11", "aa", "aa", 11, "aa", "aa", "aa", "aa", "aa", "aa", "aa", "guxing0321@163.com","1");
  User user = new User("Robin","11","guxing0321@163.com", 1, 1);
  SendMail_gu.addTitle(lunwen, user);
}
}
