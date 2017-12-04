package net.eoutech.webmin.ws.test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	private static ApplicationContext ac = null;

	public static void main(String[] args) {
		
		String s = "634,64";
		
		try {
			System.out.println(URLEncoder.encode(s,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
