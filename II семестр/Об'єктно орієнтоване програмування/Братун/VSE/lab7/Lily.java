/**Дочерный класс по отношению к классу Flower.

 * @author Slava Golowenko

 */

public class Lily extends Flower{

    /**

     * Унаследованные конструкторы от класса Flower.

     */

    public Lily(){

        super();

        setNameOfFlower(&quot;Lily&quot;);

    }

    public Lily(int f, double l, int p){

        super(f, l, p);

        setNameOfFlower(&quot;Lily&quot;);

    }

}