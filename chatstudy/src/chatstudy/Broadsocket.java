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
			Collections.synchronizedSet(new HashSet<Session>()); // ������ ��� x, �ߺ��� �Ұ���
	@OnMessage // client ���� �޽��� ����
	public void onMessage(String message, Session session)
		throws IOException {
		synchronized(clients) {
			for(Session client : clients) { 
				// client �� ���� session �� ���. �޽����� ������ Ŭ���̾�Ʈ
				if(!client.equals(session)) { // �ڽ��� �޽����� �� ���� �ʿ䰡 �����ϱ�
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen	// client �� ����Ǿ��� ��
	public void onOpen(Session session) {
		clients.add(session);
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
	
	
	
}
