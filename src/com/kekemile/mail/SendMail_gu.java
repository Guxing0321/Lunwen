package com.kekemile.mail;

import com.kekemile.po.CheckLunwen;
import com.kekemile.po.Lunwen;
import com.kekemile.po.User;

/**
 * 发送邮件的方法
 * 
 * @author guxing
 *
 */
public class SendMail_gu {

	/**
	 * 添加论文后成功后 发送邮件的方法
	 * 
	 * @param lunwen
	 * @param user
	 */
	public static void addTitle(Lunwen lunwen, User user) {
		// 发送邮件的标题
		String emailTitle = "添加论文信息成功";
		String mailContent = "Hi " + user.getName() + "<br/><br/>恭喜你已经成功添加一条论文信息，" + "论文的信息如下<br/><br/>" + "论文的题目：    "
				+ lunwen.getLwname() + "<br/>论文的DOI号 :  " + lunwen.getDoi() + "<br/>论文的作者：   " + lunwen.getAuthor()
				+ "<br/>论文发表的期刊：    " + lunwen.getMname() + "<br/>论文发表期刊类别：   " + lunwen.getMtype()
				+ "<br/>论文发表的期刊号：   " + lunwen.getMcodenum() + "<br/>论文发表的时间：    " + lunwen.getPublishtime()
				+ "<br/>工作地点：   " + lunwen.getWorkplace() + "<br/>引用文献:<br>   " + lunwen.getRefertitle()
				+ "<br/><br/><br/><br/>-------------<br/>" + "Best Whishes<br/>Nuist论文管理系统团队";

		SendEmailUtils.send(lunwen.getEmail(), "guxing0321@163.com", emailTitle, mailContent);
	}

	/**
	 * 
	 * 刪除论文信息发送的邮件
	 * 
	 * @param lunwen
	 * @param user
	 */
	public static void deleteTitle(Lunwen lunwen, User user) {
		// 发送邮件的标题
		String emailTitle = "删除论文信息成功";
		String mailContent = "Hi " + user.getName() + "<br/><br/>您已经成功删除一条论文信息，" + "论文的信息如下<br/><br/>" + "论文的题目：    "
				+ lunwen.getLwname() + "<br/>论文的DOI号 :  " + lunwen.getDoi() + "<br/>论文的作者：   " + lunwen.getAuthor()
				+ "<br/>论文发表的期刊：    " + lunwen.getMname() + "<br/>论文发表期刊类别：   " + lunwen.getMtype()
				+ "<br/>论文发表的期刊号：   " + lunwen.getMcodenum() + "<br/>论文发表的时间：    " + lunwen.getPublishtime()
				+ "<br/>工作地点：   " + lunwen.getWorkplace() + "<br/>引用文献:<br>   " + lunwen.getRefertitle()
				+ "<br/><br/><br/><br/>-------------<br/>" + "Best Whishes<br/><br/>Nuist论文管理系统团队";

		SendEmailUtils.send(lunwen.getEmail(), "guxing0321@163.com", emailTitle, mailContent);

	}

	/**
	 * 修改论文的信息
	 * @param lunwen
	 * @param user
	 */
	public static void updateTitle(Lunwen lunwen, User user) {
		// 发送邮件的标题
		String emailTitle = "修改论文信息成功";
		String mailContent = "Hi " + user.getName() + "<br/><br/>您已经成功修改一条论文信息，" + "修改后的论文的信息如下<br/><br/>" + "论文的题目：    "
				+ lunwen.getLwname() + "<br/>论文的DOI号 :  " + lunwen.getDoi() + "<br/>论文的作者：   " + lunwen.getAuthor()
				+ "<br/>论文发表的期刊：    " + lunwen.getMname() + "<br/>论文发表期刊类别：   " + lunwen.getMtype()
				+ "<br/>论文发表的期刊号：   " + lunwen.getMcodenum() + "<br/>论文发表的时间：    " + lunwen.getPublishtime()
				+ "<br/>工作地点：   " + lunwen.getWorkplace() + "<br/>引用文献:<br>   " + lunwen.getRefertitle()
				+ "<br/><br/><br/><br/>-------------<br/>" + "Best Whishes<br/><br/>Nuist论文管理系统团队";

		SendEmailUtils.send(lunwen.getEmail(), "guxing0321@163.com", emailTitle, mailContent);

	}
	
	/**
	 * 根据论文的email发送邮件
	 * @param lunwen
	 * @param user
	 */
	public static void checkTitle(Lunwen lunwen,CheckLunwen checkLunwen, float addScore) {
		// 发送邮件的标题
				String emailTitle = "审核论文提示邮件";
				String mailContent = "Hi "+ "<br/><br/>您的一篇论文已经被审核，" + "论文的信息如下<br/><br/>" + "论文的题目：    "
						+ lunwen.getLwname() + "<br/>论文的DOI号 :  " + lunwen.getDoi() + "<br/>论文的作者：   " + lunwen.getAuthor()
						+ "<br/>论文发表的期刊：    " + lunwen.getMname() + "<br/>论文发表期刊类别：   " + lunwen.getMtype()
						+ "<br/>论文发表的期刊号：   " + lunwen.getMcodenum() + "<br/>论文发表的时间：    " + lunwen.getPublishtime()
						+ "<br/>工作地点：   " + lunwen.getWorkplace() + "<br/>引用文献:<br>   " + lunwen.getRefertitle()
						+"<br/><br/>______审核信息如下_________<br/>" +"是否通过:  "+checkLunwen.getStatus()
						+"<br/>是否署名南信大 ：  "+ checkLunwen.getIsnamenuist()+"<br/>DOI是否有效：  "+checkLunwen.getDoiIsWork()
						+"<br/>添加的积分为 ：  "+addScore+"<br/>审核论文的备注 ：  "+checkLunwen.getBeizhu()
						+"<br/><br/><br/><br/>-------------<br/>" + "Best Whishes<br/><br/>Nuist论文管理系统团队";

				SendEmailUtils.send(lunwen.getEmail(), "guxing0321@163.com", emailTitle, mailContent);
		
	}

}
