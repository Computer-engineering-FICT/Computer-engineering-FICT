public class Main {

    public static void main(String[] args) {

        Vegetable tomato = new Vegetable("Помідор", 18);
        Vegetable cucumber = new Vegetable("Огірок", 16);
        Vegetable onion = new Vegetable("Цибуля", 40);
        Vegetable cabbage = new Vegetable("Капуста", 25);
        Vegetable carrot = new Vegetable("Морква", 41);
        Vegetable potato = new Vegetable("Картопля", 77);
        Vegetable Renji = new Vegetable("Ренджі", 0);
        Vegetable radish = new Vegetable("Редька", 15);
        Vegetable selera = new Vegetable("Селера", 16);

        VegetablesCollection<Vegetable> salad = new VegetablesCollection<>();
        VegetablesCollection<Vegetable> salad2 = new VegetablesCollection<>(onion);

        salad2.add(radish);
        salad2.add(selera);
        salad2.add(potato);

        salad.add(tomato);
        salad.add(cucumber);
        salad.add(cabbage);
        salad.add(carrot);
        salad.add(onion);
        salad.add(potato);
        salad.add(potato);
        salad.add(potato);
        salad.add(potato);
        salad.add(potato);
        salad.add(potato);
        salad.remove(tomato);
        salad.add(Renji);

        VegetablesCollection<Vegetable> salad3 = new VegetablesCollection<>(salad2);
        salad3.remove(radish);
        salad3.remove(selera);

        System.out.println("Салат");
        for (Vegetable i: salad) {
            i.print();
        }

        System.out.println("Салат 2");
        for (Vegetable i: salad2) {
            i.print();
        }

        System.out.println("Салат 3");


        for (Vegetable i: salad3) {
            i.print();
        }
        System.out.println("Чи входять всі елементи salad3 в salad2: " + salad2.containsAll(salad3));
        System.out.println("Чи входять всі елементи salad2 в salad: " + salad.containsAll(salad2));

        salad.removeAll(salad2);

        System.out.println("З салату видалено всі інгредієнти салату 2");
        for (Vegetable i: salad) {
            i.print();
        }

        salad.addAll(salad3);

        System.out.println("До салату додано всі інгредієнти салату 3");
        for (Vegetable i: salad) {
            i.print();
        }

        salad.retainAll(salad3);

        System.out.println("З салату видалено все, що не входить у салат 3");
        for (Vegetable i: salad) {
            i.print();
        }
        System.out.printf("Розміри салатів:\n1-ший: %5d\n2-гий: %5d\n3-тій: %5d\n",salad.size(),salad2.size(),salad3.size());
    }
}
