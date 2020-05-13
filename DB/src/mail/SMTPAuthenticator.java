package mail;

import javax.mail.*;

public class SMTPAuthenticator extends Authenticator {
	
	protected PasswordAuthentication getPasswordAuthentication()
	{
		// SMTP설정한 네이버 계정과 비밀번호
		return new PasswordAuthentication("dlfrywlsry@naver.com", "840245asd!");
	}
}
