package step3;
class Node<T> {
   private Node<T> next;
   private T data;

   // constructor
   public Node(T t) {
      this.data = t;
   }

   // getter,setter,toString
   public Node<T> getNext() {
      return next;
   }

   public void setNext(Node<T> next) {
      this.next = next;
   }

   public T getData() {
      return data;
   }

   public void setData(T data) {
      this.data = data;
   }

   @Override
   public String toString() {
      return data.toString();
   }
}