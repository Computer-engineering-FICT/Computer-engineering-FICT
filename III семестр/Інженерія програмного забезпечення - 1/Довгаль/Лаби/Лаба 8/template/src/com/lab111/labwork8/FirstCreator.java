package lab111.labwork8;

/**
 * @author Error_404
 * @version 13.10.2014
 * Realize Factory design pattern. This is the first factory creator.
 */
public class FirstCreator implements MyCreator {
    @Override
    public MyIterator createIterator() {
        return new FirstIterator();
    }
}
