import java.util.Comparator;

public class SortByPrice implements Comparator<Car> {

    public int compare(Car obj1, Car obj2) {
        return obj1.price - obj2.price;
    }
}
