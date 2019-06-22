package lab111.labwork2;

/**
 * Class which implements interface If2, consists of field of If1's type,
 * methods which allow to print information about class and method on console
 *
 * @author Error_404
 *
 */
public class Cl2 implements If2 {

    /**
     * Field of If1's type
     */
    If1 if1;

    /**
     * Method which prints information about class and method on console
     */
    @Override
    public void meth1() {
        System.out.println("Cl2-meth1");
    }

    /**
     * Method which prints information about class and method on console
     */
    public void meth2(){
        System.out.println("Cl2-meth2");
    }

    /**
     * Method which prints information about class and method on console
     */
    @Override
    public void meth3() {
        System.out.println("Cl2-meth3");
    }
}
