package lab111.labwork9;

/**
 * @author Dima
 * @version 21.10.2014
 * Realize Builder design pattern. This is the a concrete Builder.
 * Its creates red circle with 50% transparency.
 */
public class Red50CircleBuilder extends ElementBuilder {

    @Override
    public void createColor() {
        myEl.setColor("RED");
    }

    @Override
    public void createTransperencyPT() {
        myEl.setTransparencyPRT(50);
    }

    @Override
    public void createType() {
        myEl.setType("Circle");
    }
}
