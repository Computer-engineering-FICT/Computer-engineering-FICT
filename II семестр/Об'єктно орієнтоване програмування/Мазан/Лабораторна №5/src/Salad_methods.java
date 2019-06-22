public class Salad_methods extends Salad {


    public void find_by_nutrition(Salad salad, int min_nutr, int max_nutr) {
        Vegetable []salad_elements = salad.salad_elements;
        /*Скільки елементів знайду*/
        int return_numb = 0;
        for (Vegetable i : salad_elements) {
            if (i.nutrition >= min_nutr && i.nutrition <= max_nutr) {
                return_numb++;
            }
        }
        /*Знаходжу овочі та додаю в масив*/
        Vegetable[] found_vegetables = new Vegetable[return_numb];
        int k = 0;
        for (Vegetable i : salad_elements) {
            if (i.nutrition >= min_nutr && i.nutrition <= max_nutr) {
                found_vegetables[k] = i;
                k++;
            }
        }
        System.out.println("Знайдено овочі за калорійністю в діапазоні від " + min_nutr + " до " + max_nutr +"\n");
        new Salad(found_vegetables).print();
    }


    public void by_nutrition_sort(Salad salad) {
        /*Виконаю сортування вибором для калорійності овочів салату*/
        Vegetable []salad_elements = salad.salad_elements;
        int counter = 0;
        int min_index;
        for (int i = 0; i < salad_elements.length; i++) {
            min_index=counter;
            for (int j = counter; j < salad_elements.length; j++) {
                if (salad_elements[j].nutrition < salad_elements[min_index].nutrition) {
                    min_index = j;
                }
            }
            Vegetable temporary = salad_elements[counter];
            salad_elements[counter] = salad_elements[min_index];
            salad_elements[min_index] = temporary;
            counter++;
        }
        System.out.println("\nВідсортований салат: ");
        new Salad(salad_elements).print();
    }


    public void total_nutrition(Salad salad) {
        Vegetable []salad_elements = salad.salad_elements;
        int total_n = 0;
        for (Vegetable i: salad_elements) {
            total_n += i.nutrition;
        }
        System.out.println("Загальна калорійність" + total_n);
    }
}
