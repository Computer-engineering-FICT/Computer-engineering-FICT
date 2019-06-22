/**Дочерный класс по отношению к классу Flower.

 * @author Slava Golowenko

 */

public class Orchid extends Flower{

    /**

     * Унаследованные конструкторы от класса Flower.

     */

    public Orchid(){

        super();

        setNameOfFlower(&quot;Orchid&quot;);

    }

    public Orchid(int f, double l, int p){

        super(f, l, p);

        setNameOfFlower(&quot;Orchid&quot;);

    }

}