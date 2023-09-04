package com.example.demo.common.functions;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;

public class GeneralFunctions {
	public static boolean isInteger(String string) {
		boolean isInteger = string.matches("-?\\d+");
		return isInteger;

	}

	public static String hash256(String str) {
		String hash = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hashBytes = digest.digest(str.getBytes(StandardCharsets.UTF_8));

			StringBuilder hexString = new StringBuilder();
			for (byte hashByte : hashBytes) {
				String hex = Integer.toHexString(0xff & hashByte);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			hash = hexString.toString();
			System.out.println(hash);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash;
	}

	public static String hashMD5(String str) {
		String hash="";
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] hashBytes = digest.digest(str.getBytes());

			StringBuilder hexString = new StringBuilder();
			for (byte hashByte : hashBytes) {
				String hex = String.format("%02x", hashByte);
				hexString.append(hex);
			}

			hash = hexString.toString();
			System.out.println(hash);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash;
	}
	
	public static String getPreviousPage(HttpServletRequest request) {
		return request.getHeader("Referer");
	}
	
	public static ModelAndView getAlertPreviousRedirect(HttpServletRequest request, String msg) {
		return Alert.alertAndRedirect(msg, getPreviousPage(request));
	}
	
	public static String getQuery(Map map) {
		String query = "";
		for (Object key : map.keySet()) {
			String _key = key.toString();
		    String value = map.get(key).toString();
		    query += "&"+_key+"="+value;
		}
		query = query.substring(1);
		return query;
	}

}
