import java.util.Arrays;
public class Lab4 {
     public static void main(String[] args) {
         Car car1 = new Car("Ford", 15000, "black", 33366, "China");
         Car car2 = new Car("BNW", 20000, "gray", 7200, "Germany");
         Car car3 = new Car("Lada", 2000, "green", 23000, "England");
         Car car4 = new Car("Daewoo", 4252, "white", 12230, "Italy");
         Car car5 = new Car("Subaru", 25000, "red", 50330, "Ukraine");


         Car Array[] = {car1, car2, car3, car4, car5};


         Arrays.sort(Array, new SortByPrice());
         System.out.println("Sorting by Price:");
         for (int i = 0; i < Array.length; i++) {
             System.out.println(Array[i].name + " price " + Array[i].price);
         }
         System.out.println();

         Arrays.sort(Array, new SortByMileage());
         System.out.println("Sorting by Mileage:");
         for (int i = 0; i < Array.length; i++) {
             System.out.println(Array[i].name + " mileage " + Array[i].mileage);
         }
     }
 }

