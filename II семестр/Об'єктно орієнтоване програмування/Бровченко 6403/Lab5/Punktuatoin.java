package Lab5;

/**
 * Created by Nastya on 25.04.2017.
 */
public class Punktuatoin {
    private char data1;
    protected String symb;

    public Punktuatoin(char sumbol) {
        data1 = sumbol;
        symb = String.valueOf(sumbol);
    }


    // метод повертає заданий символ
    public char getPunktuation() {
        return data1;
    }

}
