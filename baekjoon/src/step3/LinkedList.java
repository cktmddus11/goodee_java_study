package step3;

/* 
 * 1. ���� ��ũ�� ����Ʈ (Single Linked List)
 * ����� ��ũ�� 1�� 
 * �ܹ������� ����
 * 2. ����(�����) ��ũ�� ����Ʈ(Double Linked List)
 * ����� ��ũ�� 2��
 * ��������� ����
 * 3. ȯ��(����) ��ũ�� ����Ʈ(Circular Linked List) 
 * ������ ��尡 ù��° ��带 ����Ŵ 
 * �������� ����(ȸ��)
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
