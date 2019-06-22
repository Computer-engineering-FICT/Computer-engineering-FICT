/**Дочерный класс по отношению к классу Flower.

 * @author Slava Golowenko

 */

public class Rose extends Flower{

    /**

     * Унаследованные конструкторы от класса Flower.

     */

    public Rose(){

        super();

        setNameOfFlower(&quot;Rose&quot;);

    }

    public Rose(int f, double l, int p){

        super(f, l, p);

        setNameOfFlower(&quot;Rose&quot;);

    }

}