import java.io.Serializable;

/** Class Vegetablen defines a vegetable with its name and nutrition.
 * VegetablesCollection implements interface Set
 */
public class Vegetable implements Serializable {
    private String name = "";
    private int nutrition = 0;

    /**
     * Constructor of empty vegetable
     */
    public Vegetable(){}

    /**
     * Standard constructor of vegetable
     */
    public Vegetable(String name, int calories_value) throws MyException {
        if (calories_value<0) {
            throw new MyException();
        }
        else {
            this.name = name;
            this.nutrition = calories_value;
        }
    }

    /**
     * Method to print attributes of the vegetable
     * @return void
     */
    public String toString() {
        return "Овоч: " + name + " Поживність: " + nutrition + " кал";
    }

    @Override
    public boolean equals(Object obj){
        boolean typeEquality = obj instanceof Vegetable;
        boolean nameEquality = ((Vegetable) obj).name.equals(name);
        boolean nutritionEquality = ((Vegetable) obj).nutrition==(nutrition);
        return typeEquality && nameEquality && nutritionEquality;
    }
}
