public class Main {
    public static void main(String[] args) {
        Text s = new Text("Дванадцять   стільців. Аніме      Бліч? Rosham? Leon and and Castylia versus Aragon (that owns Catalonia as its part)? Вісімнадцять братів... А ти дивишся сюди?");
        System.out.println("Вхідний текст:");
        s.print();
        System.out.println("\nТекст, очищений від пробілів:");
        s.clear_from_spaces().print();
        Task_to_do Result = new Task_to_do();
        Result.result(s);
        }
    }