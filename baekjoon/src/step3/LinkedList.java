package step3;

/* 
 * 1. 단일 링크드 리스트 (Single Linked List)
 * 노드의 링크가 1개 
 * 단방향으로 진행
 * 2. 이중(양방향) 링크드 리스트(Double Linked List)
 * 노드의 링크가 2개
 * 양방향으로 진행
 * 3. 환형(원형) 링크드 리스트(Circular Linked List) 
 * 마지막 노드가 첫번째 노드를 가리킴 
 * 원형으로 진행(회전)
 * 
 * */

public class LinkedList {

	public static void main(String[] args) {
		SingleLinkedList<Integer> sl = new SingleLinkedList<>();
		sl.add(new Node<Integer>(1));
		System.out.println("sl.add(1) ->" + sl);

		sl.remove();
		System.out.println("sl.remove() ->" + sl);

		sl.add(new Node<Integer>(1));
		sl.add(new Node<Integer>(2));
		sl.add(new Node<Integer>(3));
		
		System.out.println(sl.get(2));

	}

}
