import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Queue;

/**
 * Implementation of queue backed by array.
 * @author Glushko Olga
 */
public class AcademicArrayQueue implements Queue<Academic>, Externalizable {

	private Academic[] array;
	private int head;
	private int tail;
	private int length;

	/**
	 * Default constructor
	 */
	public AcademicArrayQueue() {
		array = new Academic[16];
		length = 0;
	}

	/**
	 * Creates a queue containing one element
	 * @param a an element to place into created queue
	 */
	public AcademicArrayQueue(Academic a) {
		array = new Academic[16];
		array[0] = a;
		head = tail = 0;
		length = 1;
	}
	
	/**
	 * Creates a queue containing all elements from given list 
	 * @param list list of elements to place into created queue
	 */
	public AcademicArrayQueue(List<? extends Academic> list) {
		int i, size = 16;
		length = list.size();
		while (size < length)
			size *= 2;
		array = new Academic[size];
		Iterator<? extends Academic> it = list.iterator();
		for (i=0; it.hasNext(); i++)
			array[i] = it.next();
		tail = list.size() - 1;
		head = 0;
	}

	/* (non-Javadoc)
	 * @see java.util.Queue#add(java.lang.Object)
	 */
	@Override
	public boolean add(Academic a) {
		if (a == null) // nulls are not permitted
			throw new NullPointerException();
		if (length == 0) {
			head = 0;
			tail = 0;
		}
		else {
			if (length == array.length) { // need to resize an array
				if (!grow(length + 1))
					throw new IllegalStateException();
			}
			if (tail == array.length -1)
				tail = 0;
			else
				tail++;
		}
		array[tail] = a;
		length++;
		return true;
	}

	/* (non-Javadoc)
	 * @see java.util.Queue#element()
	 */
	@Override
	public Academic element() {
		if (length == 0)
			throw new NoSuchElementException();
		return array[head];
	}

	/* (non-Javadoc)
	 * @see java.util.Queue#offer(java.lang.Object)
	 */
	@Override
	public boolean offer(Academic a) {
		if (a == null) // nulls are not permitted
			throw new NullPointerException();
		if (length == 0) {
			head = 0;
			tail = 0;
		}
		else {
			if (length == array.length) { // need to resize an array
				if (!grow(length + 1))
					return false;
			}
			if (tail == array.length -1)
				tail = 0;
			else
				tail++;
		}
		array[tail] = a;
		length++;
		return true;
	}

	/* (non-Javadoc)
	 * @see java.util.Queue#peek()
	 */
	@Override
	public Academic peek() {
		return (length == 0) ? null : array[tail];
	}

	/* (non-Javadoc)
	 * @see java.util.Queue#poll()
	 */
	@Override
	public Academic poll() {
		if (length == 0)
			return null;
		Academic a = array[head];
		length--;
		head++;
		if (head == array.length)
			head = 0;
		return a;
	}

	/* (non-Javadoc)
	 * @see java.util.Queue#remove()
	 */
	@Override
	public Academic remove() {
		if (length == 0)
			throw new NoSuchElementException();
		Academic a = array[head];
		length--;
		head++;
		if (head == array.length)
			head = 0;
		return a;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#addAll(java.util.Collection)
	 */
	@Override
	public boolean addAll(Collection<? extends Academic> coll) {
		if (length + coll.size() > array.length)
			grow(length + coll.size());
		for (Academic a : coll) {
			if (a == null) // nulls are not permitted
				throw new NullPointerException();
			tail = next(tail);
			array[tail] = a;
		}
		length += coll.size();
		return false;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#clear()
	 */
	@Override
	public void clear() {
		while (length > 0) { // we must set an array elements to null just to release the objects
			array[head] = null;
			head = next(head);
			length--;
		}
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#contains(java.lang.Object)
	 */
	@Override
	public boolean contains(Object arg) {
		if (length == 0)
			return false;
		int i, l;
		for (l=0, i=head; l<length; l++, i=next(i)) {
			if (array[i].equals(arg))
				return true;
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#containsAll(java.util.Collection)
	 */
	@Override
	public boolean containsAll(Collection<?> coll) {
		for (Object o: coll) {
			if (!contains(o))
				return false;
		}
		return true;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#isEmpty()
	 */
	@Override
	public boolean isEmpty() {
		return (length == 0);
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#iterator()
	 */
	@Override
	public Iterator<Academic> iterator() {
		// there is no reasons to iterate through queue
		return null;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#remove(java.lang.Object)
	 */
	@Override
	public boolean remove(Object arg) {
		if (length == 0)
			return false;
		int i, l;
		for (l=0, i=head; l<length; l++, i=next(i)) { // try to find such object
			if (array[i].equals(arg)) { // we've found an object - remove it
				for(int j=l; j<length; j++, i=next(i)) // move followed elements forward
					array[i] = array[next(i)];
				/* at this point 'i' should be equals tail.
				 * remove unused link to stored object */
				array[i] = null;
				length--;
				if (tail == 0)
					tail = array.length - 1;
				else
					tail--;
				return true;
			}
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#removeAll(java.util.Collection)
	 */
	@Override
	public boolean removeAll(Collection<?> arg0) {
		throw new UnsupportedOperationException();
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#retainAll(java.util.Collection)
	 */
	@Override
	public boolean retainAll(Collection<?> arg0) {
		throw new UnsupportedOperationException();
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#size()
	 */
	@Override
	public int size() {
		return length;
	}

	/* (non-Javadoc)
	 * @see java.util.Collection#toArray()
	 */
	@Override
	public Object[] toArray() {
		if (length == 0)
			return null;
		Object arr[] = new Object[length];
		int i, l;
		for(i=head, l=0; l<length; l++, i=next(i))
			arr[l] = array[i];
		return arr;
	}

	@Override
	public <T> T[] toArray(T[] a) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Counts index that is next to given as a parameter
	 * @param i index to count next from
	 * @return index next to passed
	 */
	protected final int next(int i) {
		i++;
		if (i == array.length)
			i=0;
		return i;
	}

	/**
	 * Grows internal array to store at least <code>least</code> elements
	 * @param least requested number of elements
	 * @return <code>true</code> on success, <code>false</code> on failure
	 */
	protected boolean grow(int least) {
		int newlen = array.length;
		while (newlen < least)
			newlen *= 2;
		Academic[] newarr = new Academic[newlen];
		if (newarr == null)
			return false;
		for (int i=0, j=head; i<length; i++) {
			newarr[i] = array[j];
			j++;
			if (j == array.length)
				j = 0;
		}
		head = 0;
		tail = length - 1;
		array = newarr;
		return true;
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException,
			ClassNotFoundException {
		length = in.readInt();
		int size;
		for(size=16; size < length; size *=2);
		array = new Academic[size];
		for (int i=0; i<length; i++)
			array[i] = (Academic)in.readObject();
		head = 0;
		tail = length - 1;
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		out.writeInt(length);
		int i, ix;
		for (i=0, ix=head; i<length; i++, ix=next(ix))
			out.writeObject(array[ix]);
	}

}
