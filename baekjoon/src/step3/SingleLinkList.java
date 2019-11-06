package step3;

class SingleLinkedList<T> {
	private int size = 0;
	private Node<T> head;
	private Node<T> tail;

	public SingleLinkedList() {
	}

	public void add(Node<T> node) {
		if (head == null) { // ó�� add�Ҷ� 
			head = node; // ó�� ����� �ּҰ��� head, tail�� �� ����
			tail = node; // head�� tail�� ������ ��带 ����Ŵ
		} else {
			this.tail.setNext(node); // �ϳ��� ������ ���°� ����� �ּҰ��� tail�� ����
			this.tail = node;
		}
		this.size++; // ��� ������ ����
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

	public Node<T> get(int index) { // ����Ʈ�� �ε����� 2�� ��带 ������
		if (index >= this.size || index < 0) // �ε����� ��� ����� ����ų� 0�����̸� 
			throw new IndexOutOfBoundsException(index);  // �����ü� ���� ���� ó��
		Node<T> node = this.head; // ����� �Ӹ� �ּ� ������
		for (int i = 0; i < index; i++) // �ε��� ��ȣ��ŭ �ݺ�
			node = node.getNext(); // ����� next(���� ����ּҰ�)�� node�� ����
		return node; // �ε��� ������ �ݺ��� node�ּҸ� �����ؼ� 
		
	}

	public void remove() {
		if (this.size == 1) {  // ��� ����� 1�̸� 
			this.head = null; // head, tail �Ѵ� null�� ����Ű�� ��带 null�� ����
			this.tail = null; // �ƹ��͵� ����Ű�� �ʰ���
			this.size--; // ��� ������ ���� 0
			return; // �Լ�����
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