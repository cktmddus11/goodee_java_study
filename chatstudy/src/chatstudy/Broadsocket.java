package chatstudy;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class Broadsocket {
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>()); // 순서는 상관 x, 중복은 불가능
	@OnMessage // client 에서 메시지 수신
	public void onMessage(String message, Session session)
		throws IOException {
		synchronized(clients) {
			for(Session client : clients) { 
				// client 가 나의 session 인 경우. 메시지를 전송한 클라이언트
				if(!client.equals(session)) { // 자신은 메시지를 또 보낼 필요가 없으니까
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen	// client 가 연결되었을 때
	public void onOpen(Session session) {
		clients.add(session);
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
	
	
	
}
