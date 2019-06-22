package Lab7;

/**
 * Клас MyCollection реалізує інтерфейс List
 */
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class MyCollection implements List<Ammunition> {
	/**
	 * Масив Амуніції
	 */
	private Ammunition[] ammunitions;
	/**
	 * @param кількість
	 *            елементів
	 */
	private int REALSIZE;

	/**
	 * Клас MyListIterator реалізовує інтерфейс ListIterator<Ammunition>
	 *
	 */
	public class MyListIterator implements ListIterator<Ammunition> {
		/**
		 * next наступний елемент
		 * previous попередній елемент
		 * item теперішшній елемент
		 */
		Ammunition next;
		Ammunition previous;
		Ammunition item;

		int index = 0;

		/**
		 * Конструктор класу, отримує параметр і
		 *
		 * @param i ітератор встановлюється в позицію і
		 */
		public MyListIterator(int i) {
			index = i;
			item = ammunitions[index];
			index++;
			next = ammunitions[index];
			if (i == 0) {
				previous = null;
			} else {
				previous = ammunitions[i - 1];
			}
		}

		/**
		 * конструктор класу ітератор встановлений в позицію і=0
		 */
		public MyListIterator() {
			index = 0;
			item = ammunitions[index];
			index++;
			next = ammunitions[index];
			previous = null;

		}

		/**
		 * метод додає до колекції елемент е
		 */
		@Override
		public void add(Ammunition e) {
			item = e;
			if (index == ammunitions.length) {
				next = null;
				previous = ammunitions[index];

				index++;
			}

			else {
				index++;
				previous = ammunitions[index - 1];
			}
			MyCollection.this.add(e);
		}

		/**
		 * метод перевіряє чи є у колекції наступний елемент
		 */
		@Override
		public boolean hasNext() {
			return ammunitions[index - 1] != null;

		}

		/**
		 * метод перевіряє чи є у колекції попередній елемент
		 */
		@Override
		public boolean hasPrevious() {
			return previous != null;
		}

		/**
		 * повертає наступний елемент
		 */
		@Override
		public Ammunition next() {
			Ammunition it = item;
			item = next;
			previous = it;

			if (index == ammunitions.length) {
				next = null;

			} else {
				index++;
				next = ammunitions[index];
				previous = ammunitions[index - 1];
			}
			return it;

		}

		/**повертає позицію наступного елемента*/
		@Override
		public int nextIndex() {
			return index;
		}

		/** повертає попередній елемент */
		@Override
		public Lab7.Ammunition previous() {
			return previous;
		}

		/** повертає позицію попереднього елемента */
		@Override
		public int previousIndex() {
			return index - 1;
		}

		/** видаляє теперішній елемент*/
		@Override
		public void remove() {
			MyCollection.this.remove(index - 1);

		}

		/**встановлює на позицію елемент е*/
		@Override
		public void set(Ammunition e) {
			MyCollection.this.set(index - 2, e);
		}
	}

	/**
	 * конструктор класу, створює пусту колекцію
	 */
	public MyCollection() {
		Ammunition[] am = new Ammunition[15];
		ammunitions = am;
		REALSIZE = 0;
	}

	/**
	 * конструктор класу створює колекцію з одним елементом е
	 *
	 * @param e
	 */
	public MyCollection(Ammunition e) {
		Ammunition[] am = new Ammunition[15];
		REALSIZE = 0;
		am[REALSIZE] = e;
		REALSIZE = 1;
		ammunitions = am;
	}

	/**
	 * конструктор класу, створює колекцію з масиву елементів am
	 *
	 * @param am
	 */
	public MyCollection(Ammunition[] am) {
		int i = 0;
		Ammunition[] ambuf = new Ammunition[15];
		for (Ammunition ammunition : am) {
			ambuf[i] = ammunition;
			i++;
		}
		REALSIZE = i;
		ammunitions = ambuf;
		ambuf = null;
	}

	/**
	 * Конструктор класу, створює колекцію з колекції типу ArrayList<Ammunition>
	 *
	 * @param arList
	 */
	public MyCollection(ArrayList<Ammunition> arList) {
		Ammunition[] ambuf = new Ammunition[15];
		int k = 0;
		for (Ammunition ammunition : arList) {
			ambuf[k] = ammunition;
			k++;
		}
		REALSIZE = k;
		ammunitions = ambuf;
	}

	/**
	 * додає до колекції елемент e
	 */
	public boolean add(Ammunition e) {
		if (e != null) {
			if (ammunitions.length - 2 < size()) {
				ammunitions = Arrays.copyOf(ammunitions, ammunitions.length
						+ (int) (ammunitions.length * 0.3));
			}

			if (REALSIZE >= 0) {
				ammunitions[REALSIZE] = e;
				REALSIZE++;
				return true;
			} else
				return false;

		} else
			throw new NullPointerException();
	}

	/**
	 * додає до колекції елемент element на позицію index
	 */
	@Override
	public void add(int index, Ammunition element) {
		if (element == null)
			throw new NullPointerException();
		else if (index < 0 | index > ammunitions.length) {
			throw new ArrayIndexOutOfBoundsException();
		} else if (ammunitions.length - 2 < size()) {
			ammunitions = Arrays.copyOf(ammunitions, ammunitions.length
					+ (int) (ammunitions.length * 0.3));
		}
		Arrays.fill(ammunitions, REALSIZE, REALSIZE + 1, element);
		REALSIZE++;
	}

	/**
	 * додає до колекції колекцію с
	 */
	@Override
	public boolean addAll(Collection<? extends Ammunition> c) {
		if (ammunitions.length - 2 < size()) {
			ammunitions = Arrays.copyOf(ammunitions, ammunitions.length
					+ (int) (ammunitions.length * 0.3));
		}
		int b = size();
		Object[] am = c.toArray();
		for (Object object : am) {
			try {
				Arrays.fill(ammunitions, object);
				REALSIZE++;
			} catch (NullPointerException e) {
			}
		}
		if (size() - b == 0)
			return false;
		else
			return true;

	}

	/**
	 * додає до колекції колекцію с з позиції i
	 */
	@Override
	public boolean addAll(int index, Collection<? extends Ammunition> c) {
		if (ammunitions.length - 2 < size()) {
			ammunitions = Arrays.copyOf(ammunitions, ammunitions.length
					+ (int) (ammunitions.length * 0.3));
		}
		int b = size();
		System.out.println(size());
		Object[] am = c.toArray();
		for (Object object : am) {
			try {
				Arrays.fill(ammunitions, index, index + am.length, object);
				REALSIZE++;
			} catch (NullPointerException e) {

			}
		}
		if (size() - b == 0)
			return false;
		else
			return true;
	}

	/**
	 * видаляє всі елементи колекції
	 */
	@Override
	public void clear() {
		Ammunition[] am = new Ammunition[15];
		ammunitions = am;

	}

	/**
	 * перевіряє чи об'єкт e належить колекції
	 */
	@Override
	public boolean contains(Object e) {
		if (e == null)
			throw new NullPointerException();
		else {
			boolean q = false;
			for (Ammunition ammunition : ammunitions) {
				if (ammunition.equals(e)) {
					q = true;
				}
			}
			return q;
		}
	}

	/**
	 * перевіряє чи колекція с належить колекції
	 */
	@Override
	public boolean containsAll(Collection<?> c) {
		boolean q = true;
		int i = 0;
		Object[] amm = c.toArray();
		for (int j = 0; j < amm.length; j++) {
			i = 0;
			q = true;
			while ((ammunitions[i] != null) & (q)) {
				if (ammunitions[i].equals(amm[j])) {
					q = false;
					i++;
					amm[j] = null;
				}
			}
		}
		q = true;
		for (Object ammunition : amm) {
			if (ammunition == null) {
				q = true;
			} else
				q = false;
		}
		return q;
	}

	/**
	 * повертає елемент колекції за позицією index
	 */
	@Override
	public Ammunition get(int index) {
		if (index < 0 | index > ammunitions.length)
			throw new IndexOutOfBoundsException();

		return ammunitions[index];
	}

	/**
	 * повертає позицію першого об'єкта е який зустрівся в колекції
	 */
	@Override
	public int indexOf(Object e) {
		boolean q = true;
		int positon = 0;
		ListIterator<Ammunition> itr = listIterator();
		if (q)
			while ((itr.hasNext())) {
				Ammunition ammunition = itr.next();
				if (e.equals(ammunition)) {
					q = false;
					positon = itr.nextIndex() - 2;
				}
			}
		if (q) {
			return -1;
		} else
			return positon;
	}

	/**
	 * преевіряє чи колекція пуста
	 */
	@Override
	public boolean isEmpty() {
		boolean q = true;
		for (Ammunition ammunition : ammunitions) {
			if (!(ammunition == null)) {
				q = false;
				;
			}
		}
		return q;
	}

	/**
	 * повертає ітератор
	 */
	@Override
	public Iterator<Ammunition> iterator() {
		MyListIterator itr = new MyListIterator();
		return itr;
	}

	/**
	 * повертає останнє входження об'єкта е в колекцію
	 */
	@Override
	public int lastIndexOf(Object e) {
		boolean q = true;
		int i = REALSIZE;
		while ((q) & (ammunitions[i] != null)) {
			if (ammunitions[i].equals(e)) {
				q = false;
			} else
				i--;
		}
		if (i == 0)
			return -1;
		else
			return i - 1;
	}

	/**
	 * повертає ListIterator для колекції
	 */
	@Override
	public ListIterator<Ammunition> listIterator() {
		MyListIterator itr = new MyListIterator();
		return itr;
	}

	/**
	 * повертає ListIterator для колекції з позиції index
	 */
	@Override
	public ListIterator<Ammunition> listIterator(int index) {
		MyListIterator itr = new MyListIterator(index);
		return itr;

	}

	/**
	 * видаляє обєкт e з колекції
	 */
	@Override
	public boolean remove(Object e) {
		if (e == null)
			throw new NullPointerException();
		else {
			int i = 0;
			if (indexOf(e) != -1) {
				Ammunition[] am = new Ammunition[ammunitions.length];
				ListIterator<Ammunition> itr = listIterator();
				while (itr.hasNext()) {
					Ammunition ammunition = itr.next();
					if (!ammunition.equals(e)) {
						am[i] = ammunition;
						i++;
					}
				}
				ammunitions = null;
				ammunitions = am;
				REALSIZE--;
				return true;
			} else
				return false;
		}
	}

	/**
	 * видаляє об'єкт за позицією index
	 */
	@Override
	public Ammunition remove(int index) {
		if (index < 0 | index > ammunitions.length)
			throw new IndexOutOfBoundsException();
		else {
			Ammunition[] newam = new Ammunition[ammunitions.length];
			int k = 0;
			for (int i = 0; i < ammunitions.length; i++) {
				if (i != index) {
					newam[k] = ammunitions[i];
					k++;
				}
			}
			Ammunition buf = ammunitions[index];
			ammunitions = null;
			ammunitions = newam;
			REALSIZE--;
			return buf;
		}
	}

	/**
	 * видаляє з колекції всі обєкти колекції с
	 */
	@Override
	public boolean removeAll(Collection<?> c) {
		Object[] am = c.toArray();
		ListIterator<Ammunition> itr1 = listIterator();
		while (itr1.hasNext()) {
			Ammunition ammunition = itr1.next();
			for (Object object : am) {
				if (ammunition.equals(object)) {
					remove(ammunition);
				}
			}

		}
		return true;
	}

	/**
	 * видаляє з колекції всі об'єкти що не належить до колекції c
	 */
	@Override
	public boolean retainAll(Collection<?> c) {
		Object[] am = c.toArray();
		Ammunition[] newam = new Ammunition[ammunitions.length];
		int k = 0;
		for (int i = 0; i < am.length; i++) {
			if (indexOf(am[i]) != -1) {
				newam[k] = (Ammunition) am[i];
				k++;
			}
		}
		if (newam[0] != null) {
			ammunitions = null;
			ammunitions = newam;
			return true;
		} else
			return false;
	}

	/**
	 * встановлює елемент element на позицію index
	 */
	@Override
	public Ammunition set(int index, Ammunition element) {
		if ((index > 0) & (index < ammunitions.length))
			ammunitions[index] = element;
		return element;
	}

	/**
	 * повертає кількість елементів колекції
	 */
	@Override
	public int size() {
		return REALSIZE;
	}

	/**
	 * повертає список ArrayList колекції з позиції fromIndex до позиції toIndex
	 */
	@Override
	public ArrayList<Ammunition> subList(int fromIndex, int toIndex) {
		ArrayList<Ammunition> am = new ArrayList<Ammunition>();
		for (int i = fromIndex; i < toIndex; i++) {
			am.add(ammunitions[i]);
		}
		return am;
	}

	/**
	 * повертає масив з елементів колекції
	 */
	@Override
	public Ammunition[] toArray() {
		int i = 0;
		Ammunition[] am = new Ammunition[size()];
		ListIterator<Ammunition> itr = listIterator();
		while (itr.hasNext()) {
			Ammunition ammunition = itr.next();
			am[i] = ammunition;
			i++;
		}
		return am;

	}

	/**
	 * повертає масив з елементів колекції з елементами клас яких співпав з
	 * елементами масиву array
	 */
	@SuppressWarnings({ "hiding", "unchecked", "null" })
	@Override
	public <Ammunition> Ammunition[] toArray(Ammunition[] array) {

		int reconciliation_counter = 0;
		for (Lab7.Ammunition ammunition : ammunitions) {
			for (Ammunition ams : array) {
				if (ammunition.getClass().equals(ams.getClass())) {
					reconciliation_counter++;
				}
			}
		}
		if (reconciliation_counter == array.length) {
			return array;
		} else {
			Ammunition[] newam = null;
			int k = 0;
			for (Lab7.Ammunition ammunition : ammunitions) {
				for (Ammunition ams : array) {
					if (ammunition.getClass().equals(ams.getClass())) {
						newam[k] = (Ammunition) ammunition;
					}
				}
			}
			return newam;
		}
	}

	/**
	 * перевіряє чи підходить даний набір амуніції для одного лицаря
	 */
	public boolean isCorrectAmmunition() {
		boolean bul = true;
		int i = 0;
		ListIterator<Ammunition> itr = listIterator();
		if (size() <= 4) {
			while (itr.hasNext()) {
				Ammunition ammunition = itr.next();

				ListIterator<Ammunition> itr1 = listIterator();
				i = 0;
				while (itr1.hasNext()) {
					Ammunition ammunition2 = itr1.next();
					if ((ammunition.getClass()).equals(ammunition2.getClass())) {
						i++;
					}
				}
				if (i >= 2) {
					bul = false;
				}
			}
			return bul;
		} else
			return false;

	}
}
