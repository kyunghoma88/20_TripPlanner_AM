package com.kh.spring.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

//웹소켓 서버
//접속한 클라이언트의 연결을 유지/관리
//1. TextWebsocketHandler객체를 상속
public class ChattingServer extends TextWebSocketHandler{

	@Autowired
	Logger logger;
	@Autowired
	ObjectMapper mapper;
	//접속한 세션을 관리하기 위한 객체!
	Map<String,WebSocketSession> clients = new HashMap();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		//클라이언트가 웹소켓 서버에 접속했을때
		//실행되는 메소드
		logger.info("클라이언트가 접속하였습니다.");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		//클라이언트가 보낸 메세지 확인
		logger.info(message.getPayload());
		//0 : type(새로 생성, 메세지, 파일, 관리자가 보내는 메세지)
		//String[] data = message.getPayload().split(",");
		//SocketMessage sm = getMessage(message.getPayload());
		//websocket통신을 위한 메세징으 파싱하여 관리해야함
//		switch(sm.getType()) {
//		case "open" : newClient(session,sm);break;
//		//case "open" : newClient(session,data[0]);break;
//		case "msg" : sendMessage(sm);break;
//		//case "msg" : sendMessage(data[0]);break;
//		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		logger.info("접속이 종료되었습니다.");
	}
	
	private void newClient(WebSocketSession session, SocketMessage msg) {
		//clients.put(msg[1], session);
		clients.put(msg.getSender(), session);
		//현재접속회원을 전송
		try {
			//session.sendMessage(new TextMessage("a,admin, ,채팅접속을 환영합니다."));
			session.sendMessage(new TextMessage(mapper.writeValueAsString(new SocketMessage("a","admin","","채팅접속을 환영합니다."))));
		} catch (IOException e) {
			e.printStackTrace();
		}//데이터전송!
	}
	
	//private void sendMessage(String[] msg) {
	private void sendMessage(SocketMessage msg) {	
	//if(msg[2].equals("all")) {
//		if(msg.getReciever()!=null)	
//		Set<Map.Entry<String, WebSocketSession>> keys=clients.entrySet();
//			Iterator<Map.Entry<String, WebSocketSession>> it = keys.iterator();
//			while(it.hasNext()) {
//				Map.Entry<String, WebSocketSession> client = it.next();
//				try {
//					//client.getValue().sendMessage(new TextMessage(String.join(",",msg)));
//					client.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(msg))));
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//		}
	}
	
//	메세지파싱처리하기
//	private SocketMessage getMessage(String msg) {
//		SocketMessage sm = null;
//		
//		try {
//			sm=mapper.readValue(msg, SocketMessage.class);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
}
