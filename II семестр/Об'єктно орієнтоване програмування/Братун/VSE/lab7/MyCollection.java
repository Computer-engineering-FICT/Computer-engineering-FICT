import java.util.Arrays;

import java.util.Collection;

import java.util.Iterator;

import java.util.List;

import java.util.ListIterator;

/**

 * Класс, реализирующий коллекцию.

 * @author Slava Golowenko

 */

public class MyCollection implements List&lt;Flower&gt; {

private Object[] elements; // Массив из объектов.

private int size; // Количество добавленных эллементов в массив.

private Flower[] a = new Flower[15] ; // Объект для итератора.

private int count = 0; // Значение счётчика для итератора.

/**

 * Пустой конструктор.

 */

public MyCollection() {

    elements = new Flower[15];
    size = 0;
}

/**

 * Конструктор, в который передаётся 1 объект обобщённого класса.

 * @param o объект обобщённого класса.

 */

public MyCollection(MyCollection o) {
    this();
    size++;
    elements[0] = o;
}

/**

 * Конструктор, в который передаётся стандартная коллекции объектов.

 * @param c стандартная коллекции объектов.

 */

public MyCollection(Collection&lt;Flower&gt; c) {
    elements = c.toArray();
    size = elements.length;
    checkCapacity(15);
}

/**

 * Добавляет элемент в конец массива и в случае удачного добавления элемента

 возвращает true, в противном случае false.

 */

@Override

public boolean add(Flower o) {
    if (o != null &amp;&amp; contains(o)) {
        checkCapacity(size + 1);
        elements[size] = o;
        size++;
        return true;
    }
    else
        {
            return false;
        }
}

/**

 * Добавляет элемент в массив по указанному индексу, сдвигая идущие после него

 элементы.

 */

@Override

public void add(int index, Flower o) {

        checkCapacity(index + 1);

        System.arraycopy(elements, index, elements, index + 1, size - index);

        elements[index] = o;

        size++;

        }

/**

 * Добавляет все элементы в указанной коллекции в этой коллекции.

 * @return true, если все элементы в указанной коллекции добавлены.

 */

@Override

public boolean addAll(Collection&lt;? extends Flower&gt; c) {

        Object[] a = c.toArray();

        checkCapacity(size + a.length);

        System.arraycopy(a, 0, elements, size, a.length);

        return a.length != 0;

        }

/**

 * Добавляет все элементы в указанный массив в этой коллекции начиная с index.

 * @return true, если все элементы в указанном массиве добавлены.

 */

@Override

public boolean addAll(int index, Collection&lt;? extends Flower&gt; c) {

        int newSize = size()+c.size();

        Object[] tmpArray = c.toArray();

        for(int i=0; i&lt;tmpArray.length; i++){

        add(index, (Flower) tmpArray[i]);

        index++;

        }

        return newSize==size();

        }

/**

 * Полностью очищает массив.

 */

@Override

public void clear() {

        for (int i = 0; i &lt; size; i++)

        elements[i] = null;

        size = 0;

        }

/**

 * Возвращает true, если этот массив содержит указанный элемент.

 */

@Override

public boolean contains(Object o) {

        int i = 0;

        while ((i &lt; size) &amp;&amp; (elements[i] != o))

        i++;

        if (i == size)

        return true;

        return false;

        }

/**

 * Возвращает true, если этот массив содержит все элементы указанной коллекции.

 */

@Override

public boolean containsAll(Collection&lt;?&gt; c) {

        Object[] a = c.toArray();

        for (int i = 0; i &lt; a.length; i++)

        if (contains(a[i]) == false)

        return false;

        return true;

        }

/**

 * Возвращает элемент в указанной позиции в этом массиве.

 */

@Override

public Flower get(int index) {

        return (Flower) elements[index];

        }

/**

 * Возвращает индекс первого вхождения заданного элемента в этом массиве, или -1,

 если этот массив не содержит элементов.

 */

@Override

public int indexOf(Object o) {

        for (int i = 0; i &lt; size; i++) {

        if (o.equals(elements[i]))

        return i;

        }

        return -1;

        }

/**

 * Возвращает true, если этот массив пустой и false если в массиве есть хотя бы

 один элемент.

 */

@Override

public boolean isEmpty() {

        return size() == 0;

        }

/**

 * Возвращает индекс последнего вхождения заданного элемента в этом массиве, или

 -1, если этот массив не содержит элементов.

 */

@Override

public int lastIndexOf(Object o) {

        int checkIndex = -1;

        if (o != null) {

        for (int i = 0; i &lt; size(); i++) {

        if (o.equals(elements[i])) {

        checkIndex = i;

        }

        elements[i] = elements[i+1];

        }

        return checkIndex;

        }

        return -1;

        }

/**

 * Удаляет первое вхождение указанного элемента из этого массива, если он

 присутствует, в случае

 * @return true, если элемент массива был удален.

 */

@Override

public boolean remove(Object o) {

        int i = 0;

        while (o != elements[i])

        i++;

        if (i == 0)

        return false;

        int numMoved = size - i - 1;

        if (numMoved &gt; 0)

        System.arraycopy(elements, i + 1, elements, i, numMoved);

        elements[--size] = null;

        return true;

        }

/**

 * Удаляет элемент массива по указаному индексу.

 * @return элемент в ранее указанной позиции.

 */

@Override

public Flower remove (int index) {

        int numMoved = size - index - 1;

        if (numMoved &gt; 0)

        System.arraycopy(elements, index + 1, elements, index, numMoved);

        elements[--size] = null;

        return null;

        }

/**

 * Удаляет все элементы, которые содержатся в указанной коллекции.

 * @return true, если элементы удалены.

 */

@Override

public boolean removeAll(Collection&lt;?&gt; c) {

        Object[] a = c.toArray();

        boolean check = false;

        for (int i = 0; i &lt; a.length; i++) {

        remove(a[i]);

        if (remove(a[i]))

        check = true;

        }

        return check;

        }

/**

 * Сохраняет только те элементы, которые содержатся в указанной коллекции.

 * @return true, если этот массив изменился в результате вызова.

 */

@Override

public boolean retainAll(Collection&lt;?&gt; c) {

        Object[] a = c.toArray();

        boolean check = false;

        for (int i = 0; i &lt; a.length; i++)

        if (contains(a[i]) == false) {

        remove(a[i]);

        if (remove(a[i]))

        check = true;

        }

        return check;

        }

/**

 * Изменяет элемент массива по указаном индексу.

 * @return элемент ранее в указанной позиции.

 */

@Override

public Flower set (int index, Flower o) {

        if (checkCapacity(index) &amp;&amp; elements[index] == null)

        size++;

        elements[index] = o;

        return o;

        }

/**

 * Возвращает размер массива.

 */

@Override

public int size() {

        return size;

        }

/**

 * Метод проверяет достаточно ли места для записи нового элемента. И если не

 * достаточно, то увеличивает размер массива на 30%.

 */

private boolean checkCapacity(int takenCapacity) {

        int oldCapacity = elements.length;

        if (takenCapacity &gt; oldCapacity) {

        int newCapacity = oldCapacity + (oldCapacity * (int)0.3);

        if (newCapacity &lt; takenCapacity)

        newCapacity = takenCapacity;

        elements = Arrays.copyOf(elements, newCapacity);

        return true;

        }

        return false;

        }

/**

 * Возвращает видимую часть этого массива между указанными fromIndex и toIndex.

 */

@Override

public List&lt;Flower&gt; subList(int fromIndex, int toIndex) {

        MyCollection deposit = new MyCollection();

        List&lt;Flower&gt; ar = deposit.subList(1,4);

        System.out.println(&quot;Мини-коллекция&quot; + ar);

        return deposit;

        }

/**

 * Возвращает массив, содержащий все элементы в этой коллекции в правильной

 последовательности.

 */

@Override

public Object[] toArray() {

        return Arrays.copyOf(elements, size);

        }

/**

 * Возвращает массив, содержащий все элементы в этой коллекции в правильной

 последовательности

 * возвращаемым типом массива является то, что переданно в качестве параметра.

 */

@SuppressWarnings(&quot;unchecked&quot;)

@Override

public &lt;T&gt; T[] toArray(T[] a) {

        if (a.length &lt; size)

        return (T[]) Arrays.copyOf(elements, size, a.getClass());

        System.arraycopy(elements, 0, a, 0, size);

        if (a.length &gt; size)

        a[size] = null;

        return a;

        }

/**

 * Метод инициализирует итератор.

 */

@Override

public Iterator&lt;Flower&gt; iterator() {

        return new MyIterator(a,count);

        }

/**

 * @return возвращает итератор, установленый на начало списка.

 */

@Override

public ListIterator&lt;Flower&gt; listIterator() {

        return listIterator();

        }

/**

 * @param g индекс, на который нужно установить итератор.

 * @return возвращает итератор, установленый на задней позиции.

 */

@Override

public ListIterator&lt;Flower&gt; listIterator(int g) {

        return listIterator(g);

        }

        }
