package Lab6;

/**
 * Created by Nastya on 09.05.2017.
 */
public class Helmet extends Ammunition {
    /**
     *
     * @param n назва шолома
     * @param p ціна шолома
     * @param w вага шолома
     */
    public Helmet(String n, int p, double w) {
        super(n, p, w);
    }
    /**Тип шолом */
    private String name = "Шолом";
    /**
     * @ return інформацю
     */
    public String getInformation(){
        return "Тип "+ name + " "+super.getInformation();
    }
}
