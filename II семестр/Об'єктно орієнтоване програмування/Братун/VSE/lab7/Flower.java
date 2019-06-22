/**Класс является родительским классом цветов.

 * @author Slava Golowenko

 */

public class Flower {

    /**

     * Свежесть цветка, указывается в количестве дней хранения.

     */

    private int freshness;

    /**

     * Длинна цветка, указывается в сантиметрах.

     */

    private double length;

    /**

     * Цена цветка, указывается в гривнах.

     */

    private int price;

    /**

     * Название цветка.

     */

    private String nameOfFlower;

    /**

     * Максимальный срок хранения (свежесть) цветка.

     */

    private int MAX_FRESHNESS = 5;

    /**

     * Максимальная длинна цветка.

     */

    private double MAX_LENGTH = 100;

    /**

     * Максимальная цена цветка.

     */

    private int MAX_PRICE = 120;

    /**

     * Гэтер возвращает свежесть (срок хранения) цветка.

     * @return сколько дней хранится цветок.

     */

    public int getFreshness(){

        return freshness;

    }

    /**

     * Гэтер возвращает длинну цветка.

     * @return длинна цветка.

     */

    public double getLength(){

        return length;

    }

    /**

     * Гэтер возвращает цену цветка.

     * @return цена цветка.

     */

    public int getPrice(){

        return price;

    }

    /**

     * Гэтер возвращает название цветка.

     * @return название цветка.

     */

    public String getNameOfFlower(){

        return nameOfFlower;

    }

    /**

     * Сэтер устанавливает свежесть цветка.

     * @param f устанавливает свежесть цветка.

     */

    public void setFreshness(int f){

        if (f & lt; = MAX_FRESHNESS){

            freshness = f;

        }

    }

    /**

     * Сэтер устанавливает длинну цветка.

     * @param l устанавливает длинну цветка.

     */

    public void setLength(double l){

        if (l &lt;= MAX_LENGTH){

            length = l;

        }

    }

    /**

     * Сэтер устанавливает цену цветка.

     * @param p устанавливает цену цветка.

     */

    public void setPrice(int p){

        if (p &lt;= MAX_PRICE){

            price = p;

        }

    }

    /**

     * Сэтер устанавливает название цветка.

     * @param fl название цветка.

     */

    public void setNameOfFlower(String fl){

        nameOfFlower = fl;

    }

    /**

     * Конструктор без параметров, устаналивает значения полей класса, ввёденных в

     конструкторе.

     */

    public Flower(){

        freshness = 5;

        length = 25.5;

        price = 100;

        nameOfFlower = &quot;Hrizantema&quot;;

    }

    /**

     * Конструктор с параметрами, устанавливает значения полей класса, ввёденных

     как параметры конструктора при его вызове.

     * @param f Свежесть цветка.

     * @param l Длинна цветка.

     * @param p Цена цветка.

     */

    public Flower(int f, double l, int p){

        if (f &lt;= MAX_FRESHNESS) freshness = f;

        if (l &lt;= MAX_LENGTH) length = l;

        if (p &lt;= MAX_PRICE) price = p;

        nameOfFlower = &quot;Hrizantema&quot;;

    }

    /**

     * Метод возвращает цену букета.

     * @return возвращает цену букета.

     */

    public int bouquetTotalPrice(){

        int totalPrice = getPrice();

        return totalPrice;

    }

}
