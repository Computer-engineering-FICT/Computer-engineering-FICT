public class Vegetable extends Salad {
    public String name = "";
    public int nutrition = 0;


    public Vegetable(String name, int calories_value) {
        try {
            this.name = name;
            this.nutrition = calories_value;
        }
        catch (Exception exc) {
            System.out.println("Ви ввели неправильні дані для описання овоча");
        }
    }


    @Override
    public void print() {
        System.out.printf("%10s; %20d кал\n", name, nutrition);
    }


    public void find_by_nutrition() {

    }
}
