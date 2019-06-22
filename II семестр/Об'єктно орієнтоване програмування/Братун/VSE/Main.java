import java.util.Arrays;

public class Main
{
    public static void main(String[] args)
    {
        int c13 = 5318%13; // = 1 -> ієрархія цукерок

        Candy[] sweets = new Candy[4];
        sweets[0] = new ChocolateCandy("Candy1", 200, 20, 77);
        sweets[1] = new Candy("Candy2", 100, 30);
        sweets[2] = new JellyCandy("Candy3", 50, 50, 79);
        sweets[3] = new ChocolateCandy("Candy4", 500, 30, 45);

        Arrays.sort(sweets);
        for (Sweets s:sweets)
            System.out.println(s);

        System.out.println("Перша знайдена шоколадна цукерка : " + Candy.getChocolateCandy(sweets, 40, 56));
        System.out.println("Сумарна вага цук" +
                "ерок: " + Candy.getAllWeight(sweets));
    }
}
