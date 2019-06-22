import java.util.*;

public class AmmunitionsList<E> implements List<E>, Iterable<E>{
    private int size = 0;
    private Node<E> previous;
    private Node<E> next;
    private Node<E> first;

    @Override
    public int size() {
        return this.size;
    }

    @Override
    public boolean isEmpty() {
        return size() == 0;
    }

    @Override
    public boolean contains(Object o) {
        for (int i = 0; i < size(); i++) {
            if (get(i).equals(o)){
                return true;
            }
        }
        return false;
    }

    @Override
    public Iterator<E> iterator() {
        return new Iterator<E>() {
            private Node<E> current = first;

            @Override
            public boolean hasNext() {
                return current.hasNext();
            }

            @Override
            public E next()/* throws IndexOutOfBoundsException */{
                E result = current.getT();
                if (!current.hasNext()) throw new IndexOutOfBoundsException("End of list.");
                current = current.getNext();
                return result;
            }
        };
    }

    @Override
    public Ammunition[] toArray() {
        Ammunition[] array = new Ammunition[size];
        for (int i = 0; i < size; i++) {
            array[i] = getByIndex(i).getT();
        }
        return array;
    }

    @Override
    public <Ammunition> Ammunition[] toArray(Ammunition[] a) {
        if (a.length < size){
            Ammunition[] array = new Ammunition[size];
            for (int i = 0; i < size; i++) {
                array[i] = getByIndex(i).getT();
            }
            return array;
        }
        if (a.length > size)
            for(int i=size; i<a.length; i++){
                a[i] = null;
            }
        return a;
    }

    @Override
    public boolean add(E e) {
/*
        Node<E> node = new Node<E>(e);
        if(first == null){
            first = node;
        }else{
            previous = first;
        }
        if(size() == 1){
            first.setNext(node);
        }
        size++;

        return true;
*/
        return false;
    }

    @Override
    public boolean remove(Object o) {
        Node<E> node = first;
        for(int i=0; i<size(); i++){
            if(node.equals(o)){
                node.getPrevious().setNext(node.getNext());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        return false;
    }

    @Override
    public boolean addAll(Collection<? extends E> c) {
        return false;
    }

    @Override
    public boolean addAll(int index, Collection<? extends E> c) {
        return false;
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        return false;
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        return false;
    }

    @Override
    public void clear() {

    }

    private Node<E> getByIndex(int index) {
        Node<E> node = null;
        if (!isEmpty() && (index >= 0 && index < size)) {
            node = first;
            for(int i=1; i<=index; i++){
                node = node.getNext();
            }
        }
        return node;
    }

    @Override
    public E get(int index) {
        E element;
        if (index >= 0 && index < size()) {
            element = getByIndex(index).getT();
        } else throw new IndexOutOfBoundsException();
        return element;
    }

    @Override
    public E set(int index, E element) {
        return null;
    }

    @Override
    public void add(int index, E element) {

    }

    @Override
    public E remove(int index) {
        return null;
    }

    @Override
    public int indexOf(Object o) {
        return 0;
    }

    @Override
    public int lastIndexOf(Object o) {
        return 0;
    }

    @Override
    public ListIterator<E> listIterator() {
        return null;
    }

    @Override
    public ListIterator<E> listIterator(int index) {
        return null;
    }

    @Override
    public List<E> subList(int fromIndex, int toIndex) {
        return null;
    }

}
