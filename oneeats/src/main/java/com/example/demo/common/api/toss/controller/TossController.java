package com.example.demo.common.api.toss.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TossController {
	 @Value("${toss.api.secret}")
	 private String TOSS_SECRET;
	 
	 @Value("${toss.api.key}")
	 private String TOSS_API;
	
	@ResponseBody
	@RequestMapping("/toss/orderSuccess.do")
	public String get(HttpServletRequest request) throws Exception {
		String orderId = request.getParameter("orderId");
		  String paymentKey = request.getParameter("paymentKey");
		  String amount = request.getParameter("amount");
		  String secretKey = TOSS_SECRET+":";
		  
		  Encoder encoder = Base64.getEncoder(); 
		  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
		  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

		  paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);
		  
		  URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
		  
		  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		  connection.setRequestProperty("Authorization", authorizations);
		  connection.setRequestProperty("Content-Type", "application/json");
		  connection.setRequestMethod("POST");
		  connection.setDoOutput(true);
		  JSONObject obj = new JSONObject();
		  obj.put("paymentKey", paymentKey);
		  obj.put("orderId", orderId);
		  obj.put("amount", amount);
		  
		  OutputStream outputStream = connection.getOutputStream();
		  outputStream.write(obj.toString().getBytes("UTF-8"));
		  
		  int code = connection.getResponseCode();
		  boolean isSuccess = code == 200 ? true : false;
		  
		  InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
		  
		  Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
		  JSONParser parser = new JSONParser();
		  JSONObject jsonObject = (JSONObject) parser.parse(reader);
		  responseStream.close();
		  System.out.println(jsonObject);
		  System.out.println(jsonObject.toString());
		  return jsonObject.toString();
	}
}
