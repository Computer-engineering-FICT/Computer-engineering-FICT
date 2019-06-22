/**Класс, выполняющий задание седьмой лабораторной работы.

 * @author Slava Golowenko

 */

public class Bouquet {
    public static String printFlowerParametrs(Flower f){

        return &quot;Flower \&quot;&quot; + f.getNameOfFlower() + &quot;\&quot; cost &quot; + f.getPrice() + &quot;

        UAH&quot; + &quot;, her length is &quot; + f.getLength() + &quot; cm&quot; + &quot;, her freshness is &quot; +

                f.getFreshness() + &quot; days.&quot;;

    }

    /**

     * Метод, выводящий результы работы программы на консоль.

     */

    public static void outputArray(MyCollection bouquet){

        for (int i = 0; i &lt; bouquet.size(); i++){

            System.out.println(printFlowerParametrs(bouquet.get(i)));

        }

    }

    /**

     * Метод поиска цветка по длинне.

     */

    public static Flower searchByFlowerLength(MyCollection bouquet, double

            length1, double length2){

        Flower result = bouquet.get(0);

        for (int i = 0; i &lt; bouquet.size(); i++){

            if (bouquet.get(i).getLength() &gt;= length1 &amp;&amp;

            bouquet.get(i).getLength() &lt;= length2)

            result = bouquet.get(i);

        }

        return result;

    }

    /**

     * Метод, который считает сумму за букет цветов.

     */

    public static int totalBouquetPrice(MyCollection bouquet) {

        int totalPrice = 0;

        for (int i = 0; i &lt; bouquet.size(); i++) {

            totalPrice += bouquet.get(i).getPrice();

        }

        System.out.println(&quot;Total bouquet price: &quot; + totalPrice + &quot; UAH&quot;);

        return totalPrice;

    }

    /**

     * Метод сортировки цветов по свежести.

     */

    public static void sortByFreshness(MyCollection bouquet, int k) {

        System.out.println(&quot;Bouquet is sorted by decrision of freshness:&quot;);

        Flower buf;

        for (int i = 0; i &lt;= k - 1; i++) {

            for (int j = 0; j &lt;= k - 1; j++) {

                if (bouquet.get(i).getFreshness() &gt;

                bouquet.get(j).getFreshness()) {

                    buf = bouquet.get(i);

                    bouquet.set(i,bouquet.get(j));

                    bouquet.set(j,buf);

                }

            }

        }

    }

    /**

     * Основной класс.

     */

    public static void main(String[] args) {

        final int count = 7;

/**

 * Коллекция цветов.

 */

        MyCollection bouquet=new MyCollection();

        bouquet.add (new Rose(3,50.5,80));

        bouquet.add (new Rose(4,49.6,80));

        bouquet.add (new Rose(3,48.0,80));

        bouquet.add (new Orchid(2,28.3,120));

        bouquet.add (new Orchid(2,27.9,110));

        bouquet.add (new Lily(1,15.4,50));

        bouquet.add (new Rose());

/**

 * Вывод коллекции цветов на консоль.

 */

        System.out.println(&quot;Bouqeot consist of:&quot;);

        outputArray(bouquet);

/**

 * Вывод отсортированной по свежести коллекции цветов.

 */

        System.out.println();

        sortByFreshness(bouquet, count);

        outputArray(bouquet);

/**

 * Вывод на консоль результата из поиска цветка по длинне.

 */

        System.out.println();

        System.out.println(&quot;Serched Flower by length:&quot;);

        System.out.println(printFlowerParametrs(searchByFlowerLength(bouquet,

                27.0, 28.0)));

        System.out.println();

        totalBouquetPrice(bouquet);

    }

}