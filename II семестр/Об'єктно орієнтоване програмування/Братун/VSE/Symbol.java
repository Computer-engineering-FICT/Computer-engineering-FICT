public class Symbol
{
    public Symbol(char symbol)
    {
        this.symbol = symbol;
    }

    @Override
    public String toString() {
        return symbol + "";
    }

    public char getSymbol() {
        return symbol;
    }

    public void setSymbol(char symbol) {
        this.symbol = symbol;
    }

    private char symbol;
}
