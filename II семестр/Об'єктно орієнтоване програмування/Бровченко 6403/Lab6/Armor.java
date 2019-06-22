package Lab6;

/**
 * Created by Nastya on 09.05.2017.
 */
public class Armor extends Ammunition {
    /**
     *
     * @param n назва кольчуги
     * @param p	ціна кольчуги
     * @param w вага кольчуги
     */
    public Armor(String n, int p, double w) {
        super(n, p, w);
    }
    /**тип кольчуга*/
    private String name = "Кольчуга";
    /**
     * @ return інформацю
     */
    public String getInformation(){
        return "Тип "+ name + " "+super.getInformation();
    }
}
