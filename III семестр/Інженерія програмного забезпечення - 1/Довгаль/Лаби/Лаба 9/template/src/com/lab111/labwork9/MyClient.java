package lab111.labwork9;

/**
 * @author Dima
 * @version 21.10.2014
 * Realize Builder design pattern. This is the Client.
 */
public class MyClient {

    /**
     * Builder, wich we will use
     */
    ElementBuilder eb;

    /**
     * seter for our builder
     * @param eb builder to set.
     */
    public void setBuilder(ElementBuilder eb) {
        this.eb = eb;
    }

    /**
     * Getter for our element
     * @return our element
     */
    public MyElement getMyEl(){
        return eb.getMyEl();
    }

    /**
     * Do all operations to finally construct our element.
     */
    public void constructElement() {
        eb.createElement();
        eb.createColor();
        eb.createTransperencyPT();
        eb.createType();
    }

    /**
     * Loads config from our ConfigFile.
     * @param cf our ConfigFile.
     */
    public void loadConfigfromFile(ConfigFile cf){
        setBuilder(cf.getEb());
    }

}
