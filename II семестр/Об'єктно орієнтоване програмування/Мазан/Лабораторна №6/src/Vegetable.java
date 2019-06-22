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
    public Vegetable(String name, int calories_value) {
        try {
            this.name = name;
            this.nutrition = calories_value;
        }
        catch (Exception exc) {
            System.out.println("Ви ввели неправильні дані для описання овоча");
        }
    }

    /**
     * Method to print attributes of the vegetable
     * @return void
     */
    public void print() {
        System.out.printf("%10s; %20d кал\n", name, nutrition);
    }

}
