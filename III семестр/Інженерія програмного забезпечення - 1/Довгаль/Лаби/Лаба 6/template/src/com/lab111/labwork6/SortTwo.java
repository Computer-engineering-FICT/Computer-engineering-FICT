package lab111.labwork6;

/**
 * Реализуем алгоритм с использованием интерфейса стратегии
 *
 * @author Error_404
 */
public class SortTwo implements Strategy{

    @Override
    public void sort(Object[] mas) {
        System.out.println("Отсортировано вторым");
    }
}
