package lab111.labwork8;

/**
 * @author Error_404
 * @version 13.10.2014
 * Realize Factory design pattern. This is the interface for our factory.
 */
public interface MyCreator {
    /**
     * Create our new object.
     * @return object we must have.
     */
    MyIterator createIterator();
}
