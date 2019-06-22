public class Main {
    public static void main(String[] args) {
        //ініціалізація
        Vegetable tomato = new Vegetable("Помідор", 18);
        Vegetable cucumber = new Vegetable("Огірок", 16);
        Vegetable onion = new Vegetable("Цибуля", 40);
        Vegetable cabbage = new Vegetable("Капуста", 25);
        Vegetable carrot = new Vegetable("Морква", 41);
        Vegetable potato = new Vegetable("Картопля", 77);

        Salad salad = new Salad(tomato, tomato, cucumber, onion,
                cabbage, carrot, potato);
        Salad_methods operations = new Salad_methods();

        //операції над салатом
        salad.print();
        operations.by_nutrition_sort(salad);
        operations.total_nutrition(salad);
        operations.find_by_nutrition(salad,20,45);
    }
}
