import java.util.Comparator;

public class SortByMileage implements Comparator<Car> {

    public int compare(Car obj1, Car obj2) {
        return obj1.mileage - obj2.mileage;
    }
}
