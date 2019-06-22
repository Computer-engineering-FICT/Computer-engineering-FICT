import java.util.*;

public class MyList<E> implements List<E>{
    private int size = 0;
    private Node<E> first;
    private Node<E> last;

    @Override //+
    public int size() {
        return this.size;
    }

    @Override //+
    public boolean isEmpty() {
        return this.size()==0;
    }

    @Override //+
    public boolean contains(Object o) {
        return indexOf(o) != -1;
    }

    @Override //+
    public Iterator<E> iterator() {
        return new MyIterator();
    }

    @Override //+
    public Object[] toArray() {
        Object[] result = new Object[this.size()];
        if (!this.isEmpty()) {
            Node<E> current = first;
            result[0] = current.item;
            for (int i = 1; i < this.size(); i++) {
                current = current.next;
                result[i] = current.item;
            }
        }
        return result;
    }

    @Override //+
    public <T> T[] toArray(T[] a) {
        if (a.length<size()) {
            a = (T[])java.lang.reflect.Array.newInstance(a.getClass().getComponentType(), size());
        }
        for(int i=0; i<a.length;i++){
            a[i]=(T)get(i);
        }
        if (size()<a.length){
            a[size()]=null;
        }
        return a;
    }

    @Override //+
    public boolean add(E e) {
        if(isEmpty()){
            first = new Node<E>(null, e, null);
            last = first;
        } else {
            last.next = new Node<E>(last, e, null);
            last = last.next;
        }
        this.size++;
        return true;
    }

    @Override //+
    public boolean remove(Object o) {
        int index = indexOf(o);
        if (index==-1){
            return false;
        }
        remove(index);
        return true;
    }

    @Override //+
    public boolean containsAll(Collection<?> c) {
        for(Object o: c) {
            if(indexOf(o)==-1){
                return false;
            }
        }
        return true;
    }

    @Override //+
    public boolean addAll(Collection<? extends E> c) {
        return addAll(size(), c);
    }

    @Override //+
    public boolean addAll(int index, Collection<? extends E> c) {
        boolean changed = false;
        if (index>=0 && index<=size()) {
            ListIterator<E> itr = listIterator(index);
            for(Object o: c) {
                itr.add((E)o);
                changed = true;
            }
            return changed;
        } else {
            throw new IndexOutOfBoundsException();
        }
    }

    @Override //+
    public boolean removeAll(Collection<?> c) {
        boolean changed = false;
        for(Object o: c) {
            while(indexOf(o)!=-1){
                remove(o);
                changed = true;
            }
        }
        return changed;
    }

    @Override //+
    public boolean retainAll(Collection<?> c) {
        boolean changed = false;
        ListIterator<E> itr = listIterator();
        while(itr.hasNext()){
            if(!c.contains(itr.next())){
                itr.remove();
                changed = true;
            }
        }
        return changed;
    }

    @Override //+
    public void clear() {
        for (Node<E> n = first; n != null; ) {
            Node<E> next = n.next;
            n.item = null;
            n.next = null;
            n.prev = null;
            n = next;
        }
        first = null;
        last = null;
        size = 0;
    }

    @Override //+
    public E get(int index) {
        if (0 <= index && index < size()){
            Node<E> current = first;
            for (int i=0; i < index; i++){
                current = current.next;
            }
            return current.item;
        }
        throw new NoSuchElementException();
    }

    @Override //+
    public E set(int index, E element) {
        if (index>=0 && index<size()) {
            Node<E> n = first;
            for(int i=0; i<index; i++) {
                n = n.next;
            }
            E e = n.item;
            n.item = element;
            return e;
        } else {
            throw new IndexOutOfBoundsException();
        }
    }

    @Override //+
    public void add(int index, E element) {
        if (index>=0 && index<=size()) {
            ListIterator<E> itr = listIterator(index);
            itr.add(element);
        } else {
            throw new IndexOutOfBoundsException();
        }
    }

    @Override //+
    public E remove(int index) {
        if (index<size() && index>=0){
            Node<E> current = first;
            for(int i=0; i<index;i++){
                current = current.next;
            }
            Node<E> n = current;
            if(current.next!=null){
                current.next.prev = current.prev;
            } else {
                last = current.prev;
            }
            if(current.prev!=null){
                current.prev.next = current.next;
            } else {
                first = current.next;
            }
            size--;
            n.prev = null;
            n.item = null;
            n.next = null;
            return current.item;
        }
        throw new NoSuchElementException();
    }

    @Override //+
    public int indexOf(Object o) {
        int index = -1;
        for (E e: this) {
            index++;
            if(e.equals(o)){
                return index;
            }
        }
        return -1;
    }

    @Override //+
    public int lastIndexOf(Object o) {
        ListIterator<E> itr = listIterator(size());
        for (int index = size()-1; index>=0; index--) {
            if (itr.previous().equals(o)){
                return index;
            }
        }
        return -1;
    }

    @Override //+
    public ListIterator<E> listIterator() {
        return new MyListIterator();
    }

    @Override //+
    public ListIterator<E> listIterator(int index) {
        ListIterator<E> itr = new MyListIterator();
        for (int i=0; i<index; i++){
            itr.next();
        }
        return itr;
    }

    @Override
    public List<E> subList(int fromIndex, int toIndex) {
        return null;
    }

    @Override //+
    public String toString(){
        if(isEmpty()){
            return "[]";
        }
        String s = "[";
        for (E e: this){
            s = s + e.toString() + ", ";
        }
        s = s.substring(0,s.length()-2) + "]";
        return s;
    }

    private class Node<E> {
        E item;
        Node<E> next;
        Node<E> prev;

        Node(Node<E> prev, E element, Node<E> next) {
            this.item = element;
            this.next = next;
            this.prev = prev;
        }
    }

    private class MyIterator implements Iterator<E>{
        private int index = -1;
        private Node<E> current;

        @Override
        public boolean hasNext() {
            return index+1<size();
        }

        @Override
        public E next() {
            if (index==-1){
                current = first;
            } else {
                current = current.next;
            }
            index++;
            return current.item;
        }
    }

    private class MyListIterator implements ListIterator<E> {
        private int position = -1;
        private Node<E> prevNode;
        private int lastCalled = 0; // 1 - called next(); -1 - called previous()

        @Override //+
        public boolean hasNext() {
            return position+1 < size();
        }

        @Override //+
        public E next() {
            if (!hasNext()){
                throw new NoSuchElementException();
            }
            if (position == -1){
                prevNode = first;
            } else {
                prevNode = prevNode.next;
            }
            position++;
            lastCalled = 1;
            return prevNode.item;
        }

        @Override //+
        public boolean hasPrevious() {
            return position !=-1;
        }

        @Override //+
        public E previous() {
            if (!hasPrevious()){
                throw new NoSuchElementException();
            }
            E e = prevNode.item;
            prevNode = prevNode.prev;
            position--;
            lastCalled = -1;
            return e;
        }

        @Override //+
        public int nextIndex() {
            return position + 1;
        }

        @Override //+
        public int previousIndex() {
            return position;
        }

        @Override //+
        public void remove() {
            if (lastCalled == -1) {
                next();
            }
            if (lastCalled == 1) {
                Node<E> n = prevNode;
                if (prevNode.next != null) {
                    prevNode.next.prev = prevNode.prev;
                } else {
                    last = prevNode.prev;
                }
                if (prevNode.prev != null) {
                    prevNode.prev.next = prevNode.next;
                } else {
                    first = prevNode.next;
                }
                size--;
                position--;
                prevNode = prevNode.prev;
                lastCalled = 0;
                n.prev = null;
                n.item = null;
                n.next = null;
            } else {
                throw new ConcurrentModificationException();
            }
        }

        @Override //+
        public void set(E e) {
            if (lastCalled == 1) {
                prevNode.item = e;
            } else if (lastCalled == -1) {
                next();
                prevNode.item = e;
                previous();
            } else {
                throw new ConcurrentModificationException();
            }
        }

        @Override //+
        public void add(E e) {
            if (position==-1){
                first = new Node<E>(null, e, first);
                if (!isEmpty()){
                    first.next.prev = first;
                }
                prevNode = first;
            } else {
                prevNode = new Node<E>(prevNode, e, prevNode.next);
                prevNode.prev.next = prevNode;
                if (position == size()-1){
                    last = prevNode;
                } else {
                    prevNode.next.prev = prevNode;
                }
            }
            position++;
            size++;
            lastCalled = 0;
        }
    }
}
