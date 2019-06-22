public class Salad {
    Vegetable[] salad_elements;


    public Salad(Vegetable... vegetable) {
        salad_elements = vegetable;
    }


    public void print() {
        System.out.println("Салат: ");
        System.out.printf("%s %41s", "Овоч:", "Калорійність овоча:\n");
        for (Vegetable i: salad_elements) {
            i.print();
        }
    }
}
