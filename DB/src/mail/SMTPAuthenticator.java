package mail;

import javax.mail.*;

public class SMTPAuthenticator extends Authenticator {
	
	protected PasswordAuthentication getPasswordAuthentication()
	{
		// SMTP������ ���̹� ������ ��й�ȣ
		return new PasswordAuthentication("dlfrywlsry@naver.com", "840245asd!");
	}
}
