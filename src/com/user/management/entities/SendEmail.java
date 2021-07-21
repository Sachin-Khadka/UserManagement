package com.user.management.entities;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;


import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public String getRandom() {
		Random rnd = new Random();

		int number = rnd.nextInt(999999);

		return String.format("%06d", number);
	}

	public boolean sendEmail(UserVerify user) {
		boolean test = false;
		String toEmail = user.getEmail();
		String fromEmail = "np03a170220@heraldcollege.edu.np";
		String password = "DangerHacker1@345";

		try {
			
			Properties pr = new Properties();
			pr.setProperty("mail.smtp.host", "smtp.gmail.com");
			pr.setProperty("mail.smtp.port", "587");
			pr.setProperty("mail.smtp.auth", "true");
			pr.setProperty("mail.smtp.starttls.enable", "true");
			pr.setProperty("mail.smtp.socketFactory.port", "587");
			pr.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			

			// get session
			Session session = Session.getInstance(pr, new Authenticator()
			{

				@Override
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(fromEmail, password);
				}

			});

			Message mess = new MimeMessage(session);
			mess.setFrom(new InternetAddress(fromEmail));
			mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

			mess.setSubject("User Email Verification");

			mess.setText("Registration Successfully. Please verify your account using this code." +user.getCode());

			Transport.send(mess);
			test = true;

		}

		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return test;

	}
}
