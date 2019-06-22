import java.util.Iterator;

/**

 * Класс реализирующий интерфейс итератора.

 * @author Slava Golowenko

 */

public class MyIterator implements Iterator&lt;Flower&gt; {

private Flower a[];// Массив из элементов коллекции

private int count;// Количество элементов коллекции

private int point;//Позиция итератора

/**

 * Конструктор, в который передается массив из элементов коллекции и их

 * количество.

 */

public MyIterator(Flower[] a, int count){

        this.a = a;

        this.count = count;

        point = 0;

        }

/**

 * Метод показывает есть ли следующий элемент в коллекции.

 */

public boolean hasNext() {

        if (point&gt;=count) return false; else

        return true;

        }

/**

 * Метод передвигает курсор на позицию вправо.

 */

@Override

public Flower next() {

        if (hasNext()) return a[point++]; else

        return null;

        }

/**

 * Метод удаляет текущий элемент.

 */

@Override

public void remove() {

        if (point&lt;count){

        System.arraycopy(a, point+1, a, point, count-point-1);

        count-- ;

        }

        }

        }
