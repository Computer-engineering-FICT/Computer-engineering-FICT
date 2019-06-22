package lab111.labwork2;

/**
 * Class which implements interface If1, extends Cl3, consists
 * of field of Cl1's type, methods which allow to print
 * information about class and method on console
 *
 * @author Error_404
 *
 */

public class Cl1 extends Cl3 implements If1 {

    /**
     * Field of Cl1's type
     */
    Cl1 cl1;

    /**
     * Method which prints information about class and method on console
     */
    public void meth1(){
        System.out.println("Cl1-meth1");
    }

    /**
     * Method which prints information about class and method on console
     */
    public void meth3(){
        System.out.println("Cl1-meth3");
    }
}
