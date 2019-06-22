import java.util.Arrays;
import java.util.Comparator;


public class Flowers {
    private int days;
    private int price;
    private String sort;


    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }




    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }




    public String getSort() {
        return new String(sort);
    }

    public void setSort(String sort) {
        this.sort = new String(sort);
    }


    public Flowers(int d, int p, String s) {
        setDays(d);
        setPrice(p);
        setSort(s);
    }
/*
    public Flowers(Flowers obj) {
        setDays(obj.getDays());
        setPrice(obj.getPrice());
        setSort(obj.getSort());
    }
*/
    public static int cost(Flowers[] m) {
        int price = 0;
        for (int i = 0; i < m.length; i++) {
            price = price + m[i].getPrice();
        }
        return price;
    }


    public static void sortedByDays(Flowers[] m) {
        Arrays.sort(m, new Comparator<Flowers>() {
            public int compare(Flowers m1, Flowers m2) {
                return m1.getDays() - m2.getDays();
            }
        });
    }


    public static Flowers[] priceRange(Flowers[] m, int a, int b) {
        int length = 0;
        for (int i = 0; i < m.length; i++) {
            if (m[i].getPrice() >= a && m[i].getPrice() <= b) {
                length++;
            }
        }

        Flowers[] m1 = new Flowers[length];
        for (int i = 0; i < m.length; i++) {
            if (m[i].getPrice() >= a && m[i].getPrice() <= b) {
                m1[i] = m[i];
            }
        }

        if (length == 0) {
            return null;
        } else {
            return m1;
        }
    }

}
