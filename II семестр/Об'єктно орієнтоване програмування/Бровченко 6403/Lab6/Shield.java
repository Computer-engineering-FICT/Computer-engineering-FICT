package Lab6;

/**
 * Created by Nastya on 09.05.2017.
 */

public class Shield extends Ammunition {
    /**
     *
     * @param n назва щита
     * @param p	ціна щита
     * @param w	вага щита
     */
    public Shield(String n, int p, double w) {
        super(n, p, w);
    }

    /**
     *
     * @param тип амуніції - Щит
     */
    private String name = "Щит";
    /**
     * @ return інформацю
     */
    public String getInformation(){
        return "Тип "+ name + " "+super.getInformation();
    }
}
