package lab111.labwork8;

/**
 * @author Error_404
 * @version 13.10.2014
 * Realize Factory design pattern. This is the second type of objects which we will create.
 */
public class SecondIterator implements MyIterator {
    @Override
    public void searchNextEllement() {
        System.out.println("Second iterator search algorithm");
    }
}
