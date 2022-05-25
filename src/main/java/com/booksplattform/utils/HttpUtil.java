package com.booksplattform.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;

import com.booksplattform.model.book.LinePayConfirmation;
import com.booksplattform.model.book.LinePayEntity;

public class HttpUtil {
	
	public static String sendRequest(LinePayEntity lpe) 
			throws JSONException, IOException {
		JSONObject json = new JSONObject();
  		
		json.put("amount", lpe.getAmount());    
		json.put("productName", lpe.getProductName());    
		json.put("productImageUrl", lpe.getProductImageUrl());    
		json.put("confirmUrl", lpe.getConfirmUrl());    
		json.put("orderId", lpe.getOrderId());    
		json.put("currency", lpe.getCurrency());  
		
		
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();

		try {
		    HttpPost request = new HttpPost
		    		("https://sandbox-api-pay.line.me/v2/payments/request");
		    StringEntity params = new StringEntity(json.toString());
		    request.addHeader("content-type", "application/json;charset=UTF-8");
		    request.addHeader("X-LINE-ChannelId", "1657095313");
		    request.addHeader("X-LINE-ChannelSecret", "5d0fe5e9bede435b5c29cca443d65766");
		    
		    
		    request.setEntity(params);
		    CloseableHttpResponse o = httpClient.execute(request);
		    HttpEntity res = o.getEntity();
		    String responseString = EntityUtils.toString(res, "UTF-8");
//		    System.out.println(responseString);
		    return responseString;
		// handle response here...
		} catch (Exception ex) {
		    // handle exception here
		} finally {
		    httpClient.close();
		}
		return null;
	}
	
	public static String sendConfirm(String transactionId , LinePayConfirmation lpc) 
			throws JSONException, IOException {
		JSONObject json = new JSONObject();
		json.put("amount", lpc.getAmount());      
		json.put("currency", lpc.getCurrency());    

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();

		String confirmUrl = "https://sandbox-api-pay.line.me/v2/payments/" + transactionId + "/confirm";
		try {
		    HttpPost request = new HttpPost(confirmUrl);
		    StringEntity params = new StringEntity(json.toString());
		    request.addHeader("content-type", "application/json");
		    request.addHeader("X-LINE-ChannelId", "1657095313");
		    request.addHeader("X-LINE-ChannelSecret", "5d0fe5e9bede435b5c29cca443d65766");
	    
		    request.setEntity(params);
		    CloseableHttpResponse o = httpClient.execute(request);
		    o.setHeader("Access-Control-Allow-Origin", "http://localhost:8080/");
//		    o.setHeader("Access-Control-Allow-Headers", "http://127.0.0.1:8080/");
		    
		    HttpEntity res = o.getEntity();
		    String responseString = EntityUtils.toString(res, "UTF-8");
		    System.out.println(responseString);
		    return responseString;
		// handle response here...
		} catch (Exception ex) {
		    // handle exception here
		} finally {
		    httpClient.close();
		}
		return null;
	}
}
