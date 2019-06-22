package ua.kpi.io33.zakolenko.lab7;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/**
 * Class DoubleList implements interface List. This class describe data about
 * object DoubleList.
 * 
 * @author Roman Zakolenko.
 * @version 1,6 20 May 2014.
 */
public class DoubleList implements List<Munitions> {
	/**
	 * The field "first" contains link on the top of the list.
	 */
	private Cell first;

	/**
	 * Empty constructor.
	 */
	public DoubleList() {
	}

	/**
	 * @param obj
	 *            contains data about object be placed in the top of the list.
	 */
	public DoubleList(Munitions obj) {
		setFirst(new Cell(obj));
	}

	/**
	 * @param collection
	 *            contains objects which will be placed on the list.
	 */
	public DoubleList(Collection<? extends Munitions> collection) {
		addAll(collection);
	}

	/**
	 * @return link of first element of list.
	 */
	public Cell getFirst() {
		return first;
	}

	/**
	 * @param cell
	 *            assigned with the fields first.
	 */
	public void setFirst(Cell cell) {
		this.first = cell;
	}

	/**
	 * @return string which contains information about object of class
	 *         DoubleList.
	 */
	@Override
	public String toString() {
		StringBuffer s = new StringBuffer();
		if (isEmpty()) {
			s.append("The list is empty." + "\n");
		} else {
			s.append("The list contains " + size() + " elements:" + "\n");
			ListIterator<Munitions> iter = listIterator();
			while (iter.hasNext()) {
				s.append("Munition " + iter.nextIndex() + " - "
						+ iter.next().toString() + "\n");
			}
		}
		return s.toString();
	}

	/**
	 * Appends the object of class Munitions to the end of this list.
	 */
	@Override
	public boolean add(Munitions e) {
		Cell a = first;
		if (a == null) {
			setFirst(new Cell(null, null, e));
		} else {
			while (a.getNext() != null) {
				a = a.getNext();
			}
			a.setNext(new Cell(e));
			a.getNext().setPrevious(a);
		}
		return true;
	}

	/**
	 * Inserts the object of class Munitions at the specified position in this
	 * list.
	 */
	@Override
	public void add(int index, Munitions element) {
		if (index <= this.size()) {
			if (index == 0) {
				setFirst(new Cell(null, first, element));
				try {
					getFirst().getNext().setPrevious(getFirst());
				} catch (NullPointerException e) {
					System.out.println(e.toString());
				}
			} else {
				ListIterator<Munitions> iter = this.listIterator();
				while (iter.hasNext()) {
					iter.next();
					if (iter.nextIndex() == index) {
						iter.add(element);
					}
				}
			}
		}
	}

	/**
	 * Appends all of the elements in the specified collection to the end of
	 * this list.
	 */
	@Override
	public boolean addAll(Collection<? extends Munitions> c) {
		Iterator<? extends Munitions> iter = c.iterator();
		while (iter.hasNext()) {
			this.add(iter.next());
		}
		return true;
	}

	/**
	 * Inserts all of the elements in the specified collection into this list at
	 * the specified position.
	 */
	@Override
	public boolean addAll(int index, Collection<? extends Munitions> c) {
		Iterator<? extends Munitions> iter = c.iterator();
		while (iter.hasNext()) {
			this.add(index, iter.next());
			index++;
		}
		return true;
	}

	/**
	 * Removes all of the elements from this list.
	 */
	@Override
	public void clear() {
		setFirst(null);
	}

	/**
	 * @return true if this list contains the specified element.
	 */
	@Override
	public boolean contains(Object o) {
		return this.lastIndexOf(o) > -1;
	}

	/**
	 * @return true if this list contains all of the elements of the specified
	 *         collection.
	 */
	@Override
	public boolean containsAll(Collection<?> c) {
		Iterator<?> iter = c.iterator();
		boolean b = true;
		while (iter.hasNext()) {
			if (!this.contains(iter.next())) {
				b = false;
			}
		}
		return b;
	}

	/**
	 * @return the element at the specified position in this list.
	 */
	@Override
	public Munitions get(int index) {
		ListIterator<Munitions> iter = this.listIterator();
		Munitions obj = null;
		while (iter.hasNext() && obj == null) {
			if (iter.nextIndex() == index)
				obj = iter.next();
			else
				iter.next();
		}
		return obj;
	}

	/**
	 * @return the index of the first occurrence of the specified element in
	 *         this list, or -1 if this list does not contain the element.
	 */
	@Override
	public int indexOf(Object o) {
		int pos = -1;
		Cell a = this.first;
		for (int i = 0; i < this.size() && pos == -1; i++) {
			if (a.getData().equals(o)) {
				pos = i;
			}
			a = a.getNext();
		}
		return pos;
	}

	/**
	 * @return true if this list contains no elements.
	 */
	@Override
	public boolean isEmpty() {
		return this.first == null;
	}

	/**
	 * @return an iterator over the elements in this list in proper sequence.
	 */
	@Override
	public Iterator<Munitions> iterator() {
		return new Iterator<Munitions>() {
			public Cell present = new Cell(null, first, null);

			/**
			 * Removes from the underlying collection the last element returned
			 * by this iterator.
			 */
			@Override
			public void remove() {
				if (present == first) {
					if (present.getNext() != null) {
						setFirst(new Cell(null, present.getNext().getNext(),
								present.getNext().getData()));
						getFirst().getNext().setPrevious(getFirst());
						present = getFirst();
					}
				} else {
					if (present.getNext() != null) {
						present.getPrevious().setNext(present.getNext());
						present.getNext().setPrevious(present.getPrevious());
						present = present.getPrevious();
					} else {
						present.getPrevious().setNext();
						present = present.getPrevious();
					}
				}
			}

			/**
			 * @return the next element in the iteration.
			 */
			@Override
			public Munitions next() {
				if (hasNext()) {
					present = present.getNext();
					return present.getData();
				} else
					return null;
			}

			/**
			 * @return true if the iteration has more elements.
			 */
			@Override
			public boolean hasNext() {
				return present.getNext() != null;
			}
		};
	}

	/**
	 * @return the index of the last occurrence of the specified element in this
	 *         list, or -1 if this list does not contain the element.
	 */
	@Override
	public int lastIndexOf(Object o) {
		int pos = -1;
		Cell a = this.first;
		for (int i = 0; i < this.size(); i++) {
			if (a.getData().equals(o)) {
				pos = i;
			}
			a = a.getNext();
		}
		return pos;
	}

	/**
	 * @return a list iterator over the elements in this list.
	 */
	@Override
	public ListIterator<Munitions> listIterator() {
		return new ListIterator<Munitions>() {
			/**
			 * The field "present" contains link on present cell of list.
			 */
			public Cell present = new Cell(null, first, null);
			/**
			 * The field "index" contains position of cursor in list.
			 */
			public int index = -1;

			/**
			 * Inserts the specified element into the list.
			 */
			@Override
			public void add(Munitions arg0) {
				Cell a = new Cell(present, present.getNext(), arg0);
				try {
					a.getNext().setPrevious(a);
				} catch (NullPointerException e) {
					System.out.println(e.toString());
				} finally {
					present.setNext(a);
					present = present.getNext();
				}
			}

			/**
			 * @return true if this list iterator has more elements when
			 *         traversing the list in the forward direction.
			 */
			@Override
			public boolean hasNext() {
				return present.getNext() != null;
			}

			/**
			 * @return true if this list iterator has more elements when
			 *         traversing the list in the reverse direction.
			 */
			@Override
			public boolean hasPrevious() {
				return present.getPrevious() != null;
			}

			/**
			 * @return the next element in the list and advances the cursor
			 *         position.
			 */
			@Override
			public Munitions next() {
				if (hasNext()) {
					present = present.getNext();
					index++;
					return present.getData();
				} else
					return null;
			}

			/**
			 * @return the index of the element that would be returned by a
			 *         subsequent call to next().
			 */
			@Override
			public int nextIndex() {
				return index + 1;
			}

			/**
			 * @return the previous element in the list and moves the cursor
			 *         position backwards.
			 */
			@Override
			public Munitions previous() {
				if (hasPrevious()) {
					present = present.getPrevious();
					index--;
					return present.getData();
				} else
					return null;
			}

			/**
			 * @return the index of the element that would be returned by a
			 *         subsequent call to previous().
			 */
			@Override
			public int previousIndex() {
				if (hasPrevious()) {
					return index - 1;
				} else
					return -1;
			}

			/**
			 * Removes from the list the last element that was returned by
			 * next() or previous().
			 */
			@Override
			public void remove() {
				if (present == first) {
					try {
						setFirst(new Cell(null, present.getNext().getNext(),
								present.getNext().getData()));
						getFirst().getNext().setPrevious(getFirst());
						present = getFirst();
					} catch (NullPointerException e) {
						System.out.println(e.toString());
						setFirst(null);
					}
				} else {
					try {
						present.getPrevious().setNext(present.getNext());
						present.getNext().setPrevious(present.getPrevious());
					} catch (NullPointerException e) {
						System.out.println(e.toString());
						present.getPrevious().setNext();
					} finally {
						present = present.getPrevious();
					}
				}
			}

			/**
			 * Replaces the last element returned by next() or previous() with
			 * the specified element.
			 */
			@Override
			public void set(Munitions data) {
				present.setData(data);
			}
		};
	}

	/**
	 * @return a list iterator of the elements in this list, starting at the
	 *         specified position in this list.
	 */
	@Override
	public ListIterator<Munitions> listIterator(int index) {
		ListIterator<Munitions> iter = this.listIterator();
		while (iter.hasNext() && iter.nextIndex() <= index) {
			iter.next();
		}
		return iter;
	}

	/**
	 * Removes the element at the specified position in this list.
	 */
	@Override
	public boolean remove(Object o) {
		ListIterator<Munitions> iter = this.listIterator();
		boolean b = false;
		while (iter.hasNext() && !b) {
			if (iter.next().equals(o)) {
				iter.remove();
				b = true;
			}
		}
		return b;
	}

	/**
	 * Removes the first occurrence of the specified element from this list, if
	 * it is present.
	 */
	@Override
	public Munitions remove(int index) {
		ListIterator<Munitions> iter = this.listIterator();
		Munitions b = null;
		while (iter.hasNext() && b == null) {
			if (iter.nextIndex() == index) {
				b = iter.next();
				iter.remove();
			} else
				iter.next();
		}
		return b;
	}

	/**
	 * Removes from this list all of its elements that are contained in the
	 * specified collection.
	 */
	@Override
	public boolean removeAll(Collection<?> c) {
		boolean b = true;
		Iterator<?> iter = c.iterator();
		while (iter.hasNext()) {
			b = this.remove(iter.next());
		}
		return b;
	}

	/**
	 * Retains only the elements in this list that are contained in the
	 * specified collection.
	 */
	@Override
	public boolean retainAll(Collection<?> c) {
		boolean b = false;
		ListIterator<Munitions> iter = this.listIterator();
		while (iter.hasNext()) {
			if (!c.contains(iter.next())) {
				iter.remove();
				b = true;
			}
		}
		return b;
	}

	/**
	 * Replaces the element at the specified position in this list with the
	 * specified element.
	 */
	@Override
	public Munitions set(int index, Munitions element) {
		ListIterator<Munitions> iter = this.listIterator();
		Munitions result = null;
		while (iter.hasNext() && result == null) {
			if (iter.nextIndex() == index) {
				result = iter.next();
				iter.set(element);
			} else
				iter.next();
		}
		return result;
	}

	/**
	 * @return the number of elements in this list.
	 */
	@Override
	public int size() {
		ListIterator<Munitions> iter = this.listIterator();
		while (iter.hasNext()) {
			iter.next();
		}
		return iter.nextIndex();
	}

	/**
	 * @return the sublist from a fromIndex on toIndex.
	 */
	@Override
	public List<Munitions> subList(int fromIndex, int toIndex) {
		List<Munitions> result = new ArrayList<Munitions>();
		if (fromIndex == toIndex) {
			return result;
		} else {
			ListIterator<Munitions> iter = this.listIterator();
			while (iter.hasNext()) {
				if (iter.nextIndex() >= fromIndex && iter.nextIndex() < toIndex) {
					result.add(iter.next());
				} else
					iter.next();
			}
			return result;
		}
	}

	/**
	 * @return an array containing all of the elements in this list in proper
	 *         sequence.
	 */
	@Override
	public Object[] toArray() {
		Object obj[] = new Object[this.size()];
		Cell a = this.first;
		for (int i = 0; i < obj.length; i++) {
			obj[i] = a.getData();
			a = a.getNext();
		}
		return obj;
	}

	/**
	 * @return an array containing all of the elements in this list in proper
	 *         sequence.
	 */
	@Override
	public <T> T[] toArray(T[] a) {
		if (a instanceof Munitions[]) {
			try {
				System.arraycopy(toArray(), 0, a, 0, size());
			} catch (IndexOutOfBoundsException e) {
				a = (T[]) new Munitions[size()];
				System.arraycopy(toArray(), 0, a, 0, size());
			}
		}
		return a;
	}
}
