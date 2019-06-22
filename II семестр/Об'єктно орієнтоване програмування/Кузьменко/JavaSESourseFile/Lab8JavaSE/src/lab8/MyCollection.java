package lab8;

/**
 * ���� MyCollection ������ ��������� List
 * @author Lenovo
 */
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;


public class MyCollection implements List<Ammunition>, Serializable {
	/**
	 * ����� �������
	 */
	private Ammunition[] ammunitions;
	/**
	 * @param �������
	 *            ��������
	 */
	private int REALSIZE;

	/**
	 * ���� MyListIterator �������� ��������� ListIterator<Ammunition>
	 * 
	 * @author Lenovo
	 * 
	 */
	public class MyListIterator implements ListIterator<Ammunition> {
		/**
		 * next ��������� ������� previous ��������� ������� item ���������
		 * �������
		 */
		Ammunition next;
		Ammunition previous;
		Ammunition item;

		int index = 0;

		/**
		 * ����������� �����, ������ �������� �
		 * 
		 * @param i
		 *            �������� �������������� � ������� �
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
		 * ����������� ����� �������� ������������ � ������� �=0
		 */
		public MyListIterator() {
			index = 0;
			item = ammunitions[index];
			index++;
			next = ammunitions[index];
			previous = null;

		}

		/**
		 * ����� ���� �� �������� ������� �
		 */
		@Override
		public void add(Ammunition e) {
			item = e;
			if (index == ammunitions.length) {
				next = null;
				previous = ammunitions[index];

				index++;

			} else {
				index++;
				previous = ammunitions[index - 1];
			}
			MyCollection.this.add(e);
		}

		/**
		 * ����� �������� �� � � �������� ��������� �������
		 */
		@Override
		public boolean hasNext() {
			return ammunitions[index - 1] != null;

		}

		/**
		 * ����� �������� �� � � �������� ��������� �������
		 */
		@Override
		public boolean hasPrevious() {
			return previous != null;
		}

		/**
		 * ������� ��������� �������
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

		/**������� ������� ���������� ��������*/
		@Override
		public int nextIndex() {
			return index;
		}

		/** ������� ��������� ������� */
		@Override
		public lab8.Ammunition previous() {
			return previous;
		}
		
		/** ������� ������� ������������ �������� */
		@Override
		public int previousIndex() {
			return index - 1;
		}

		/** ������� �������� �������*/
		@Override
		public void remove() {
			MyCollection.this.remove(index - 1);

		}

		/**���������� �� ������� ������� �*/
		@Override
		public void set(Ammunition e) {
			MyCollection.this.set(index - 2, e);
		}
	}

	/**
	 * ����������� �����, ������� ����� ��������
	 */
	public MyCollection() {
		Ammunition[] am = new Ammunition[15];
		ammunitions = am;
		REALSIZE = 0;
	}

	/**
	 * ����������� ����� ������� �������� � ����� ��������� �
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
	 * ����������� �����, ������� �������� � ������ �������� am
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
	 * ����������� �����, ������� �������� � �������� ���� ArrayList<Ammunition>
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
	 * ���� �� �������� ������� e
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
	 * ���� �� �������� ������� element �� ������� index
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
	 * ���� �� �������� �������� �
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
	 * ���� �� �������� �������� � � ������� i
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
	 * ������� �� �������� ��������
	 */
	@Override
	public void clear() {
		Ammunition[] am = new Ammunition[15];
		ammunitions = am;

	}

	/**
	 * �������� �� ��'��� e �������� ��������
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
	 * �������� �� �������� � �������� ��������
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
	 * ������� ������� �������� �� �������� index
	 */
	@Override
	public Ammunition get(int index) {
		if (index < 0 | index > ammunitions.length)
			throw new IndexOutOfBoundsException();

		return ammunitions[index];
	}

	/**
	 * ������� ������� ������� ��'���� � ���� �������� � ��������
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
	 * �������� �� �������� �����
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
	 * ������� ��������
	 */
	@Override
	public Iterator<Ammunition> iterator() {
		MyListIterator itr = new MyListIterator();
		return itr;
	}

	/**
	 * ������� ������ ��������� ��'���� � � ��������
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
	 * ������� ListIterator ��� ��������
	 */
	@Override
	public ListIterator<Ammunition> listIterator() {
		MyListIterator itr = new MyListIterator();
		return itr;
	}

	/**
	 * ������� ListIterator ��� �������� � ������� index
	 */
	@Override
	public ListIterator<Ammunition> listIterator(int index) {
		MyListIterator itr = new MyListIterator(index);
		return itr;

	}

	/**
	 * ������� ���� e � ��������
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
	 * ������� ��'��� �� �������� index
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
	 * ������� � �������� �� ����� �������� �
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
	 * ������� � �������� �� ��'���� �� �� �������� �� �������� c
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
	 * ���������� ������� element �� ������� index
	 */
	@Override
	public Ammunition set(int index, Ammunition element) {
		if ((index > 0) & (index < ammunitions.length))
			ammunitions[index] = element;
		return element;
	}

	/**
	 * ������� ������� �������� ��������
	 */
	@Override
	public int size() {
		return REALSIZE;
	}

	/**
	 * ������� ������ ArrayList �������� � ������� fromIndex �� ������� toIndex
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
	 * ������� ����� � �������� ��������
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
	 * ������� ����� � �������� �������� � ���������� ���� ���� ������ �
	 * ���������� ������ array
	 */
	@SuppressWarnings({ "hiding", "unchecked", "null" })
	@Override
	public <Ammunition> Ammunition[] toArray(Ammunition[] array) {

		int reconciliation_counter = 0;
		for (lab8.Ammunition ammunition : ammunitions) {
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
			for (lab8.Ammunition ammunition : ammunitions) {
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
	 * �������� �� �������� ����� ���� ������� ��� ������ ������
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
