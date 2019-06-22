import java.util.ArrayList;
//import java.util.LinkedList;
//import java.util.ListIterator;

public class test {
    public static void main(String[] args) {
        MyList<Integer> a = new MyList<>();
        ArrayList<Integer> i = new ArrayList<>();
        i.add(0);
        i.add(1);
        i.add(2);
        a.add(3);
        a.add(4);
        a.addAll(0, i);
//        ListIterator<Integer> itr = a.listIterator();
//        System.out.println(itr.next());
//        System.out.println(itr.next());
//        System.out.println(itr.next());
//        System.out.println(itr.previous());
//        itr.remove();
        System.out.println(a);
        i.add(5);
        System.out.println(i);
        System.out.println(a.retainAll(i));
        System.out.println(a);
    }
}
