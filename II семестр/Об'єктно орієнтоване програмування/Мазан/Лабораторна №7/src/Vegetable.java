/** Class Vegetablen defines a vegetable with its name and nutrition.
 * VegetablesCollection implements interface Set
 */
public class Vegetable {
    public String name = "";
    public int nutrition = 0;

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
        return "Овоч: " + name + "; Поживність: " + nutrition + " кал";
    }

}
