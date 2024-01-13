package com.finalproject.festival.service;

import java.util.Random;

import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;
import net.nurigo.sdk.message.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	int authNumber ;
	
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
					Random r = new Random();
					int checkNum = r.nextInt(888888) + 111111;
					System.out.println("인증번호 : " + checkNum);
					authNumber = checkNum;
		
	}
	
	
	public String phoneMessage(String phonenumber) {
		String result ="";
		
		makeRandomNumber();
		
		System.out.println(authNumber);
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSI9QMNEDQ9MTEN", "XNFRZQUNIUHFALVSOQZJHKAJRLYO94ZX", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01038731573");
		message.setTo(phonenumber);
		message.setText("GALAGO 회원가입 핸드폰 인증번호는 "+authNumber+"입니다.");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		  result = Integer.toString(authNumber);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		return result;
	}
}
