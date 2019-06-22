import java.*;

import java.util.*;

public class MyLinkedList<T extends Sweets> implements List<T>
{

    public MyLinkedList(){}

    public MyLinkedList(T sweet){
        add(sweet);
    }

    public MyLinkedList(Collection<? extends T> c){
        addAll(c);
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return (size == 0);
    }

    @Override
    public boolean add(T o) {
        linkLast(o);
        return true;
    }

    @Override
    public void add(int index, T element) {
        checkPositionIndex(index);

        if (index == size)
            linkLast(element);
        else
            linkBefore(element, node(index));
    }

    @Override
    public boolean addAll(Collection<? extends T> c) {
        return addAll(size, c);
    }

    @Override
    public boolean addAll(int index, Collection<? extends T> c) {
        checkPositionIndex(index);

        Object[] arr = c.toArray();

        if (arr.length == 0) return false;

        Node<T> n, p;
        if ( index == size){
            p = last;
            n = null;
        } else{
            n = node(index);
            p = n.prev;
        }

        for (Object o : arr){
            T t = (T) o;

            Node<T> newNode = new Node<>(p, t ,null);
            if (p == null)
                first = newNode;
            else
                p.next = newNode;
            p = newNode;
        }

        if (n != null){
            p.next = n;
            n.prev = p;
        }else
            last = p;

        size += arr.length;
        return true;
    }

    @Override
    public boolean remove(Object o) {
        ListItr itr = new ListItr(0);

        if (o == null){
            while(itr.hasNext()){
                T x = itr.next();
                if(x == null){
                    itr.remove();
                    return true;
                }
            }
        }else{
            while(itr.hasNext()){
                T x = itr.next();
                if(o.equals(x)){
                    itr.remove();
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public T remove(int index) {
        checkElementIndex(index);
        return unlink(node(index));
    }

    @Override
    public boolean removeAll(Collection c) {
        if (c == null) return false;

        c.forEach(cElement -> remove(cElement));
        return true;
    }

    @Override
    public boolean retainAll(Collection c) {
        if (c == null) return false;

        ListItr itr = new ListItr(0);

        while(itr.hasNext())
            if (!c.contains(itr.next()))
                itr.remove();

        return true;
    }

    @Override
    public T get(int index) {
        checkElementIndex(index);

        return node(index).data;
    }

    @Override
    public T set(int index, T element) {
        checkElementIndex(index);

        Node<T> node = node(index);
        T x = node.data;

        node.data = element;

        return x;
    }

    @Override
    public int indexOf(Object o) {

        int i = 0;

        if (o != null) {

            for (T data : this) {
                if (o.equals(data))
                    return i;
                i++;
            }
        } else {
            for (T data : this) {
                if (data == null)
                    return i;
                i++;
            }
        }

        return -1;
    }

    @Override
    public int lastIndexOf(Object o) {

        ListItr itr = new ListItr(size);

        if (o != null) {
            while (itr.hasPrevious()){
                T x = itr.previous();
                if (o.equals(x))
                    return itr.nextIndex;
            }
        }else{
            while(itr.hasPrevious()){
                T x = itr.previous();
                if (x == null)
                    return itr.nextIndex;
            }
        }

        return -1;
    }

    @Override
    public boolean contains(Object o) {
        return indexOf(o) != -1;
    }

    @Override
    public boolean containsAll(Collection c) {
        if (c == null) return false;

        for (Object o : c)
            if (!this.contains(o))
                return false;

        return true;
    }

    @Override
    public Iterator iterator() {
        return new ListItr(0);
    }

    @Override
    public ListIterator listIterator() {
        return new ListItr(0);
    }

    @Override
    public ListIterator listIterator(int index) {
        checkPositionIndex(index);
        return new ListItr(index);
    }

    @Override
    public Object[] toArray() {
       Object[] arr = new Object[size];

        int i = 0;
        for (T t : this)
            arr[i++] = t;

        return arr;
    }

    @Override
    public <E> E[] toArray(E[] a) {
        if (a.length < size)
            a = (E[])java.lang.reflect.Array.newInstance(
                    a.getClass().getComponentType(), size);

        int i = 0;
        ListItr itr = new ListItr(0);

        while(itr.hasNext())
            a[i++] = (E) itr.next();

        return a;
    }

    @Override
    public List subList(int fromIndex, int toIndex) {
        List<T> list = new MyLinkedList<>();

        ListItr itr = new ListItr(fromIndex);
        while(itr.hasNext() && itr.nextIndex < toIndex)
            list.add(itr.next());

        return list;
    }

    @Override
    public void clear() {

        first = null;
        last = null;
        size = 0;
    }

    private class ListItr implements ListIterator<T>{

        ListItr(int index){
            next = (index == size)? null : node(index);
            nextIndex = index;
        }

        @Override
        public boolean hasNext() {
            return nextIndex < size;
        }

        @Override
        public T next() {

            if (!hasNext())
                throw new NoSuchElementException();

            lastReturned = next;
            next = next.next;
            nextIndex++;

            return lastReturned.data;
        }

        @Override
        public boolean hasPrevious() {
            return nextIndex > 0;
        }

        @Override
        public T previous() {

            if (!hasPrevious())
                throw new NoSuchElementException();

            next = (next != null) ? next.prev : last;
            lastReturned = next;
            nextIndex--;

            return lastReturned.data;
        }

        @Override
        public int nextIndex() {
            return nextIndex;
        }

        @Override
        public int previousIndex() {
            return nextIndex - 1;
        }

        @Override
        public void remove() {
            if (lastReturned == null)
                throw new IllegalStateException();

            Node<T> lastNext = lastReturned.next;
            unlink(lastReturned);
            if (next == lastReturned)
                next = lastNext;
            else
                nextIndex--;
            lastReturned = null;
        }

        @Override
        public void set(T o) {
            if (lastReturned == null)
                throw new IllegalStateException();

            lastReturned.data = o;
        }

        @Override
        public void add(T o) {

            lastReturned = null;

            if (next == null)
                linkLast(o);
            else
                linkBefore(o, next);

            nextIndex++;

        }

        private Node<T> next;
        private Node<T> lastReturned;
        private int nextIndex;
    }

    private static class Node<T>
    {
        Node( Node<T> prev, T data, Node<T> next){

            this.prev = prev;
            this.data = data;
            this.next = next;
        }

        T data;
        Node<T> next;
        Node<T> prev;
    }

    Node<T> node(int index) {  // повертає елемент з індексом index
        if (index < (size >> 1)) {
            Node<T> x = first;

            for (int i = 0; i < index; i++)
                x = x.next;

            return x;
        } else {
            Node<T> x = last;

            for (int i = size - 1; i > index; i--)
                x = x.prev;

            return x;
        }
    }

    void linkLast(T e) {//додає е в кінець списку

        final Node<T> l = last;
        final Node<T> newNode = new Node<>(l, e, null);

        last = newNode;

        if (l == null)
            first = newNode;
        else
            l.next = newNode;

        size++;
    }

    void linkBefore(T e, Node<T> node) {//вставляє е перед елементом node

        final Node<T> prev = node.prev;
        final Node<T> newNode = new Node<>(prev, e, node);

        node.prev = newNode;

        if (prev == null)
            first = newNode;
        else
            prev.next = newNode;

        size++;
    }

    T unlink(Node<T> x) {       // видяляє ненульвий елемент х

        final T element = x.data;
        final Node<T> next = x.next;
        final Node<T> prev = x.prev;

        if (prev == null) {
            first = next;
        } else {
            prev.next = next;
            x.prev = null;
        }

        if (next == null) {
            last = prev;
        } else {
            next.prev = prev;
            x.next = null;
        }

        x.data = null;
        size--;

        return element;
    }

    private boolean isElementIndex(int index) {
        return index >= 0 && index < size;
    }

    private boolean isPositionIndex(int index) {
        return index >= 0 && index <= size;
    }

    private String outOfBoundsMsg(int index) {
        return "Index: " + index + ", Size: " + size;
    }

    private void checkElementIndex(int index) {
        if (!isElementIndex(index))
            throw new IndexOutOfBoundsException(outOfBoundsMsg(index));
    }

    private void checkPositionIndex(int index) {
        if (!isPositionIndex(index))
            throw new IndexOutOfBoundsException(outOfBoundsMsg(index));
    }

    private Node<T> first;

    private Node<T> last;

    private int size;
}
