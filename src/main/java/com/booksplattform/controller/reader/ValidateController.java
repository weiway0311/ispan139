package com.booksplattform.controller.reader;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.social.connect.web.HttpSessionSessionStrategy;
import org.springframework.social.connect.web.SessionStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.ServletWebRequest;

import com.booksplattform.model.reader.ImageCode;

@RestController
public class ValidateController {
		
	public final static String SESSION_KEY_IMAGE_CODE = "SESSION_KEY_IMAGE_CODE";
	
	private SessionStrategy sessionStrategy = new HttpSessionSessionStrategy();

	
	@GetMapping("/code/image")
	public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ImageCode imageCode = createImageCode();
		sessionStrategy.setAttribute(new ServletWebRequest(request), SESSION_KEY_IMAGE_CODE, imageCode);
		ImageIO.write(imageCode.getImage(), "jpeg", response.getOutputStream());
	}
	
	// 生成驗證碼對象
	private ImageCode createImageCode() {
		int width = 70; //驗證碼圖片寬度
		int height = 35; //驗證碼圖片長度
		int length = 4; //驗證碼位數
		int expireIn = 60; //驗證碼有效時間(秒)
		
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = image.getGraphics();
		
		Random random = new Random();
		
		graphics.setColor(getRandColor(200, 500));
		graphics.fillRect(0, 0, width, height);
		graphics.setFont(new Font("Times New Roman", Font.ITALIC, 20));
		graphics.setColor(getRandColor(160, 200));
		
		for(int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int x1 = random.nextInt(12);
			int y1 = random.nextInt(12);
			graphics.drawLine(x, y, x+x1, y+y1);
		}
		
		StringBuilder sRand = new StringBuilder();
		for(int i = 0; i < length; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand.append(rand);
			graphics.setColor(new Color(20 +random.nextInt(20), 20 +random.nextInt(20), 20 +random.nextInt(20)));
			graphics.drawString(rand, (13 * i + 6), 16);
		}
		
		graphics.dispose();
		
		ImageCode imageCode = new ImageCode(image, sRand.toString(), expireIn);
		return imageCode;
	}

	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if(fc > 255) { fc = 255; };
		if(bc > 255) { bc = 255; };
		
		int r = fc + random.nextInt(bc-fc);
		int g = fc + random.nextInt(bc-fc);
		int b = fc + random.nextInt(bc-fc);
		return new Color(r,g,b);
	}
	
}
