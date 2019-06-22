public class MyMain {

    public static void main(String[] args) {
        Rose r = new Rose(35, 200, "Біла");
        Aloe a = new Aloe(25, 140, "Деревоподібне");
        Iris ir = new Iris(10, 115, "Маргарита");
        Flowers[] flowers = { r, a, ir };


        System.out.println("Ціна букету: " + Flowers.cost(flowers));

        System.out.println("");


        Flowers.sortedByDays(flowers);
        System.out.println("Сортовані квіти за рівнем свіжості:");


        for (int i = 0; i < flowers.length; i++) {
            System.out.print(flowers[i].getSort() + " " + flowers[i].getDays() + "\n");
        }


        System.out.println();


        Flowers d[];
        d = Flowers.priceRange(flowers, 50, 150);
        System.out.println("Квітка що відповідає заданаму діапазону цін:");


        if (d != null) {
            for (int i = 0; i < d.length; i++) {
                System.out.print(d[i].getSort() + " " + d[i].getPrice() + "\n");
            }
        }else {
            System.out.println("Квіток в даному діапазоні цін немає");
        }
    }
}

