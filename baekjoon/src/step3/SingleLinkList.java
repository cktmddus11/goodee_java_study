package step3;

class SingleLinkedList<T> {
	private int size = 0;
	private Node<T> head;
	private Node<T> tail;

	public SingleLinkedList() {
	}

	public void add(Node<T> node) {
		if (head == null) { // 처음 add할때 
			head = node; // 처음 노드의 주소값을 head, tail에 다 넣음
			tail = node; // head와 tail이 동일한 노드를 가리킴
		} else {
			this.tail.setNext(node); // 하나더 들어오면 들어온걸 노드의 주소값을 tail에 저장
			this.tail = node;
		}
		this.size++; // 노드 사이즈 증가
	}

	public void setHead(Node<T> node) {
		node.setNext(this.head);
		this.head = node;
	}

	public void setTail(Node<T> node) {
		this.tail.setNext(node);
		this.tail = node;
	}

	public Node<T> getHead() {
		return this.head;
	}

	public Node<T> getTail() {
		return this.tail;
	}

	public Node<T> get(int index) { // 리스트중 인덱스가 2인 노드를 가져와
		if (index >= this.size || index < 0) // 인덱스가 노드 사이즈를 벗어나거나 0이하이면 
			throw new IndexOutOfBoundsException(index);  // 가져올수 없음 에러 처리
		Node<T> node = this.head; // 노드의 머리 주소 가져옴
		for (int i = 0; i < index; i++) // 인덱스 번호만큼 반복
			node = node.getNext(); // 노드의 next(다음 노드주소값)을 node에 저장
		return node; // 인덱스 끝까지 반복후 node주소를 리턴해서 
		
	}

	public void remove() {
		if (this.size == 1) {  // 노드 사이즈가 1이면 
			this.head = null; // head, tail 둘다 null로 가리키는 노드를 null로 만들어서
			this.tail = null; // 아무것도 가리키지 않게함
			this.size--; // 노드 사이즈 감소 0
			return; // 함수종료
		}
		Node<T> node = this.head;
		for (int i = 0; i < size - 2; i++)
			node = node.getNext();
		node.setNext(null);
		this.tail = node;
		this.size--;
	}

	public void remove(int index) {
		if (index >= this.size || index < 0)
			throw new IndexOutOfBoundsException(index);
		if (index == 0) {
			try {
				this.head = this.head.getNext();
				this.size--;
			} catch (IndexOutOfBoundsException e) {
				this.head = null;
				this.tail = null;
			}
		} else if (index == this.size - 1)
			remove();
		else {
			get(index - 1).setNext(get(index + 1));
			this.size--;
		}
	}

	public int size() {
		return this.size;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		Node<T> node = this.head;
		sb.append("[");
		while (node != null) {
			sb.append(node.toString());
			node = node.getNext();
			if (node != null)
				sb.append(", ");
		}
		sb.append("]");
		return new String(sb);
	}
}