package ssh.member.controller;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;


public class GoogleMail {
	
	public void sendmail(String recipient, String certificationCode) throws Exception {
		
		// 1. 정보를 담기 위한 객체
        Properties prop = new Properties(); 
          
        // 2. SMTP(Simple Mail Transfer Protocoal) 서버의 계정 설정
        //    Google Gmail 과 연결할 경우 Gmail 의 email 주소를 지정 
        prop.put("mail.smtp.user", "ssanghong8080@gmail.com");
          
        // 3. SMTP 서버 정보 설정
        //    Google Gmail 인 경우  smtp.gmail.com
        prop.put("mail.smtp.host", "smtp.gmail.com");
               
          
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.debug", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.socketFactory.fallback", "false");
      
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
      
        Authenticator smtpAuth = new MySMTPAuthenticator();
        Session ses = Session.getInstance(prop, smtpAuth);
         
        // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
        ses.setDebug(true);
              
        // 메일의 내용을 담기 위한 객체생성
        MimeMessage msg = new MimeMessage(ses);

        // 제목 설정
        String subject = "위너에듀 회원님의 비밀번호를 찾기위한 인증코드 발송";
        msg.setSubject(subject);
              
        // 보내는 사람의 메일주소
        String sender = "ssanghong8080@gmail.com";
        Address fromAddr = new InternetAddress(sender);
        msg.setFrom(fromAddr);
              
        // 받는 사람의 메일주소
        Address toAddr = new InternetAddress(recipient);
        msg.addRecipient(Message.RecipientType.TO, toAddr);
              
        // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
        
        msg.setContent("<div class=\"mail_view_contents\"><div class=\"mail_view_contents_inner\" data-translate-body-38263=\"\"><div><table align=\"center\" width=\"825\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;table-layout:fixed;\">\r\n"
        		+ "    <tbody><tr><td style=\"color:#333333; font-size:16px; text-align:left; padding:0; border-bottom:3px solid #507bd7;\">\r\n"
        		+ "            <div style=\"float:left\"><img src=\"http://www.wannaedu.com/data/file/e69e843b2e715ad0390d80e8e54d2a97.png\" alt=\"워너에듀\" style=\"margin:25px 0 10px 0;max-height:50px;\" loading=\"lazy\"></div>\r\n"
        		+ "            <div style=\"float:right;\"><a href=\"http://localhost:9090/SemiProject_3Zoe/\" target=\"_blank\" style=\"text-decoration:none; font-size:12px;:22px;line-:22px;border:1px solid #c1c1c1;text-align:center;padding:0 5px;margin-top:25px;display:block\" rel=\"noreferrer noopener\">+ 사이트 바로가기</a></div>\r\n"
        		+ "        </td></tr>\r\n"
        		+ "    <tr><td style=\"color:#333333; font-size:13px; padding:0;line-height:150%;\">\r\n"
        		+ "            <div style=\"position:relative;\">\r\n"
        		+ "                <h2 style=\"background-color:#ffffff;line-height:40px;color:000000;font-size:24px;padding:20px 0;margin:0\"><strong>인증번호가 발급되었습니다.</strong></h2>\r\n"
        		+ "                <div style=\"padding:20px 0;border-top:1px solid #e7e7e7;min-height:200px;margin-bottom:12px\">\r\n"
        		+ "                    안녕하세요. 워너에듀입니다. <br><br>\r\n"
        		+ " 발송된 인증코드 : <span style='font-size:14pt; color:red;'>"+certificationCode+"</span> <br><br>\r\n"
        		+ "감사합니다.\r\n"
        		+ "                </div>\r\n"
        		+ "            </div>\r\n"
        		+ "        </td></tr>\r\n"
        		+ "    <tr><td align=\"center\" style=\"color:#333333; font-size:12px; padding:10px 0; letter-spacing:-1px;border-top:1px solid #e7e7e7;line-height:22px; background: #fff;\">\r\n"
        		+ "            \r\n"
        		+ "            본 메일은 발신전용이므로 회신이 되지 않습니다.<br>\r\n"
        		+ "        </td></tr>\r\n"
        		+ "\r\n"
        		+ "    <tr><td align=\"center\" style=\"color:#333333; font-size:12px; padding:10px 0; letter-spacing:-1px;border-top:1px solid #e7e7e7;line-height:22px; background: #fff;\">\r\n"
        		+ "            (주)한국라이센스개발원\r\n"
        		+ "            / wannaedu@naver.com\r\n"
        		+ "            /\r\n"
        		+ "            (08592)\r\n"
        		+ "            서울 금천구 가산디지털1로 75-15 201호 (가산동, 가산 하우스디 와이즈타워)\r\n"
        		+ "            \r\n"
        		+ "        </td></tr>\r\n"
        		+ "</tbody></table>\r\n"
        		+ "\r\n"
        		+ "\r\n"
        		+ "</div></div></div>" ,"text/html;charset=UTF-8");      
        // 메일 발송하기
        Transport.send(msg);
		
	}// end of public void sendmail(String recipient, String certificationCode)-----------------

	
	
	
	
	
	public void sendmail_OrderFinish(String recipient, String name, String emailContents) throws Exception {
		
		// 1. 정보를 담기 위한 객체
        Properties prop = new Properties(); 
          
        // 2. SMTP(Simple Mail Transfer Protocoal) 서버의 계정 설정
        //    Google Gmail 과 연결할 경우 Gmail 의 email 주소를 지정 
        prop.put("mail.smtp.user", "ssanghong8080@gmail.com");
          
        // 3. SMTP 서버 정보 설정
        //    Google Gmail 인 경우  smtp.gmail.com
        prop.put("mail.smtp.host", "smtp.gmail.com");
               
          
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.debug", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.socketFactory.fallback", "false");
      
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
      
        Authenticator smtpAuth = new MySMTPAuthenticator();
        Session ses = Session.getInstance(prop, smtpAuth);
         
        // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
        ses.setDebug(true);
              
        // 메일의 내용을 담기 위한 객체생성
        MimeMessage msg = new MimeMessage(ses);

        // 제목 설정
        String subject = "localhost:9090/MyMVC/mallHome1.up "+name+"님의 주문이 성공했습니다.";
        msg.setSubject(subject);
              
        // 보내는 사람의 메일주소
        String sender = "ssanghong8080@gmail.com";
        Address fromAddr = new InternetAddress(sender);
        msg.setFrom(fromAddr);
              
        // 받는 사람의 메일주소
        Address toAddr = new InternetAddress(recipient);
        msg.addRecipient(Message.RecipientType.TO, toAddr);
              
        // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
        msg.setContent("<div style='font-size:14pt; color:red;'>"+emailContents+"</div>", "text/html;charset=UTF-8");
              
        // 메일 발송하기
        Transport.send(msg);
		
		
	}// end of public void sendmail_OrderFinish(String recipient, String name, String emailContents) throws Exception----
	

}
