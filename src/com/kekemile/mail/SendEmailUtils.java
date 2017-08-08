package com.kekemile.mail;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.sun.mail.util.MailSSLSocketFactory;

public class SendEmailUtils {
	private static String account;// 登录用户名
	private static String pass; // 登录密码
	private static String from; // 发件地址
	private static String host; // 服务器地址
	private static String port; // 端口
	private static String protocol; // 协议

	static {
		/*Properties prop = new Properties();
		InputStream instream = ClassLoader.getSystemResourceAsStream("classpath:Config/email.properties");
		try {
			prop.load(instream);
		} catch (IOException e) {
			System.out.println("加载属性文件失败");
		}*/
		account ="admin@kekemile.com";
		pass = "Vision953305";	
		from ="admin@kekemile.com";
		host = "smtp.exmail.qq.com";
		port ="465";
		protocol = "smtp";
	}

	// 用户名密码验证，需要实现抽象类Authenticator的抽象方法PasswordAuthentication
	static class MyAuthenricator extends Authenticator {
		String u = null;
		String p = null;

		public MyAuthenricator(String u, String p) {
			this.u = u;
			this.p = p;
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(u, p);
		}
	}

	/*private String to; // 收件人
	private String id; // 重置密码地址标识(这句话是我的业务需要，你们可以不要)

	public SendEmailUtils(String to, String id) {
		this.to = to;
		this.id = id;
	}*/

	public static void send(String toMail,String copyMail,String emailTitle,String mailContent) {
		Properties prop = new Properties();
		// 协议
		prop.setProperty("mail.transport.protocol", protocol);
		// 服务器
		prop.setProperty("mail.smtp.host", host);
		// 端口
		prop.setProperty("mail.smtp.port", port);
		// 使用smtp身份验证
		prop.setProperty("mail.smtp.auth", "true");
		// 使用SSL，企业邮箱必需！
		// 开启安全协议
		MailSSLSocketFactory sf = null;
		try {
			sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.socketFactory", sf);
		//
		Session session = Session.getDefaultInstance(prop, new MyAuthenricator(account, pass));
		session.setDebug(true);
		MimeMessage mimeMessage = new MimeMessage(session);
		BodyPart messageBodyPart = new MimeBodyPart();
        Multipart multipart = new MimeMultipart();
       // String content = null;
		try {
			mimeMessage.setFrom(new InternetAddress(from, "kekemile的提示邮件"));
			//邮件的发送对象
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			//邮件抄送对象
			mimeMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(copyMail));
			//邮件的标题
			mimeMessage.setSubject(emailTitle);
			// mimeMessage.setSentDate(new Date());
			//mailContent = "This is my mail hope you can be happy "+"<br/><br/>Best Wishes <br/>Robin";
			//设置邮件内容
			mimeMessage.setText(mailContent);
			
			//设置邮件内容的格式html
			mimeMessage.setContent(mailContent,"text/html;charset=UTF-8");
			
			
			mimeMessage.saveChanges();
			Transport.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
