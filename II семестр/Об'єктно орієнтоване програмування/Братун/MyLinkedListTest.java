


import main.java.com.yUvOsIl.lab6.Candy;
import main.java.com.yUvOsIl.lab6.ChocolateCandy;
import main.java.com.yUvOsIl.lab6.Sweets;
import main.java.com.yUvOsIl.lab7.MyLinkedList;
import org.junit.Assert;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;


public class MyLinkedListTest extends Assert {

    private MyLinkedList<Sweets> list;

    private static final ArrayList<Sweets> arr = new ArrayList(){
        {
            add(new Candy("1", 1, 1));
            add(new ChocolateCandy("2", 2, 2, 2));
            add(null);
            add(new Candy("", 2, 3));
        }
    };

        @Test
        public void testSize() throws Exception {

        list = new MyLinkedList<>();

        int i = 10000;

        for (int j = 0; j < i; j++)
            list.add(new Candy(j+"", j, j));
        assertEquals(i + " != " + list.size(), i, list.size());

        list.clear();
        assertEquals(0, list.size());
    }

    @Test
    public void testIsEmpty() throws Exception {

        list = new MyLinkedList<>(new Candy("1", 1, 1));
        assertFalse(list.isEmpty());
        list.clear();
        assertTrue(list.isEmpty());
    }

    @Test
    public void testAdd() throws Exception {
        list = new MyLinkedList<>();
        assertTrue(list.add(new Candy("1", 1 , 1)));
        assertTrue(list.contains(new Candy("1", 1 , 1)));
        assertFalse(list.contains(new Candy("2", 1, 2)));
    }

    @Test
    public void testAdd1() throws Exception {
        list  = new MyLinkedList<>(arr);

        Candy c = new Candy("3", 3, 3);
        list.add(1, c);
        assertTrue(list.contains(c));
        assertEquals(1, list.indexOf(c));
    }

    @Test
    public void testAddAll() throws Exception {
        list = new MyLinkedList<>(new Candy("3", 3, 3));

        list.addAll(arr);
        assertTrue(list.containsAll(arr));
    }

    @Test
    public void testAddAll1() throws Exception {
        int i = 2;
        list = new MyLinkedList<>(new Candy("3", 3, 3));
        list.add(new ChocolateCandy("1", 2, 3, 4));

        list.addAll(i, arr);
        Iterator listItr = list.listIterator(i);
        Iterator arrItr = arr.listIterator();

        while(arrItr.hasNext()){
            assertEquals(arrItr.next(), listItr.next());
        }
    }

    @Test
    public void testRemove() throws Exception {
        list = new MyLinkedList<>(new Candy("1", 1, 1));
        list.add(null);

        assertTrue(list.remove(new Candy("1", 1 , 1)));
        assertTrue(list.remove(null));
    }

    @Test
    public void testRemove1() throws Exception {
        int i = 0;
        list = new MyLinkedList<>(arr);

        assertEquals(list.get(i), list.remove(i));
    }

    @Test
    public void testRemoveAll() throws Exception {
        list = new MyLinkedList<>(arr);

        list.removeAll(arr);

        assertTrue(list.isEmpty());
    }

    @Test
    public void testRetainAll() throws Exception {
        list = new MyLinkedList<>(arr);

        list.add(new Candy("3", 3, 3));

        list.retainAll(arr);
        assertTrue(list.containsAll(arr));
        assertTrue(!list.contains(new Candy("3", 3, 3)));
    }

    @Test
    public void testGet() throws Exception {
        int index = 2;
        list = new MyLinkedList<>(arr);

        Candy c = new Candy("!" , 0, 20);
        list.add(index, c);

        assertEquals(c, list.get(index));
    }

    @Test
    public void testSet() throws Exception {
        int index = 2;
        list = new MyLinkedList<>(arr);


        Sweets c = list.get(index);

        assertEquals(c, list.set(index, new Candy("24", 12, 13)));
        assertNotEquals(c, list.get(index));
        assertEquals(new Candy("24", 12, 13), list.get(index));
    }

    @Test
    public void testIndexOf() throws Exception {
        list  = new MyLinkedList<>(arr);

        assertEquals(0, list.indexOf(new Candy("1", 1, 1)));
        assertEquals(1, list.indexOf(new ChocolateCandy("2", 2, 2, 2)));
        assertEquals(2, list.indexOf(null));
    }

    @Test
    public void testLastIndexOf() throws Exception {
        list = new MyLinkedList<>(arr);

        list.add(3, new ChocolateCandy("2", 2, 2, 2));

        assertNotEquals(list.indexOf(new ChocolateCandy("2", 2, 2, 2)) , list.lastIndexOf(new ChocolateCandy("2", 2, 2, 2)));
        assertEquals(3, list.lastIndexOf(new ChocolateCandy("2", 2, 2, 2)));
    }

    @Test
    public void testContains() throws Exception {
        list = new MyLinkedList<>();

        assertFalse(list.contains(null));
        list.add(null);
        assertTrue(list.contains(null));
        list.add(new Candy("1", 1, 1));
        assertTrue(list.contains(new Candy("1", 1, 1)));
    }

    @Test
    public void testContainsAll() throws Exception {
        list = new MyLinkedList<>();

        list.add(null);
        list.addAll(arr);
        list.add(new ChocolateCandy("", 12, 34, 21));

        assertTrue(list.containsAll(arr));
        list.removeAll(arr);
        assertFalse(list.contains(arr));
    }

    @Test
    public void testIterator() throws Exception {
        list = new MyLinkedList<>();
        assertTrue(list.iterator() instanceof ListIterator);
    }

    @Test
    public void testListIterator() throws Exception {
        list = new MyLinkedList<>(arr);

        ListIterator itr = list.listIterator();

        assertTrue(itr instanceof ListIterator);
        assertEquals(0, itr.nextIndex());
        assertEquals(list.get(0), itr.next());
        assertEquals(1, itr.nextIndex());
    }

    @Test
    public void testListIterator1() throws Exception {
        list = new MyLinkedList<>(arr);
        int index = 2;

        ListIterator itr = list.listIterator(2);

        assertTrue(itr instanceof ListIterator);
        assertEquals(index, itr.nextIndex());
        assertEquals(list.get(index), itr.next());
        assertEquals(index + 1, itr.nextIndex());
    }

    @Test
    public void testToArray() throws Exception {
        list = new MyLinkedList<>(arr);

        assertArrayEquals(arr.toArray(), list.toArray());
    }

    @Test
    public void testToArray1() throws Exception {
        list = new MyLinkedList<>(arr);

        Sweets[] arrArr = arr.toArray(new Sweets[1]);
        Sweets[] listArr = list.toArray(new Sweets[2]);

        assertTrue(arrArr.getClass().equals(listArr.getClass()));
        assertArrayEquals(arrArr, listArr);
    }

    @Test
    public void testSubList() throws Exception {
        list = new MyLinkedList<>(arr);
        List<Sweets> subList = list.subList(1 ,list.size());

        ListIterator itr = list.listIterator(1);
        ListIterator subItr = subList.listIterator();
        while(subItr.hasNext())
            assertEquals(itr.next(), subItr.next());

        assertTrue(subList.contains(list.get(list.size() - 1)));
    }

    @Test
    public void testClear() throws Exception {
        list = new MyLinkedList<>(arr);

        assertFalse(list.isEmpty());

        list.clear();

        assertTrue(list.isEmpty());
    }
}