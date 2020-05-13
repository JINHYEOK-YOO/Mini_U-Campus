<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="javax.mail.*" import="javax.mail.internet.*"
	import="java.util.*" import="mail.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		Address fromAddr = new InternetAddress("dlfrywlsry@naver.com");	// SMTP설정한 네이버 계정
		// 받을 사람 (아무 이메일이나)
		StringTokenizer str = new StringTokenizer(request.getParameter("email_textbox"), ";");
		Address[] toAddr = new InternetAddress[str.countTokens()];
		for	(int i = 0; i < toAddr.length; i++)
			toAddr[i] = new InternetAddress(str.nextToken());
		
		String subject = request.getParameter("pTitle");	// 메일 제목
		String content = request.getParameter("pContext");	// 메일 내용

		Properties p = new Properties();
		p.put("mail.smtp.host", "smtp.naver.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			
			MimeMessage msg = new MimeMessage(ses);
			msg.setFrom(fromAddr);
			msg.setRecipients(Message.RecipientType.TO, toAddr);
			msg.setSubject(subject, "UTF-8");
			msg.setContent(content, "text/html;charset=UTF-8");
			
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('메일 전송 실패'); history.back();</script>");
			return;
		}
		
		out.println("<script>alert('메일 전송 성공'); self.close()</script>");
	%>
</body>
</html>