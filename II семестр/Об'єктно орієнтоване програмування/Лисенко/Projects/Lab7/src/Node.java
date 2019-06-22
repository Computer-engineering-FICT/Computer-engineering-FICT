public class Node<T> {
    private Node next;
    private Node previous;
    private T t;
    private int index;

    Node(Node next, Node previous, T t) {
        if (!(previous==null)){
            previous.setNext(this);
        }
        if (!(next==null)){
            next.setPrevious(this);
        }
        this.next = next;
        this.previous = previous;
        this.t = t;
    }

    public Node getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }

    public boolean hasNext(){
        if (next==null){
            return false;
        }
        return true;
    }

    public Node getPrevious() {
        return previous;
    }

    public void setPrevious(Node previous) {
        this.previous = previous;
    }

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    @Override
    public boolean equals(Object obj) {
        return t.equals(obj);
    }
}
