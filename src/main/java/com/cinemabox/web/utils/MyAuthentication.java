package com.cinemabox.web.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator{
	
	PasswordAuthentication pa;
	
	public MyAuthentication(){
	String id = "abpple0405@gmail.com";
	String pw = "0987poiu";
	pa = new PasswordAuthentication(id, pw);
	
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	
	}
	
}
