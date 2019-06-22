public class AfterFunc implements MyFunction{

    private double currentX;

    AfterFunc(double currentX){
        this.currentX= currentX;
    }

    @Override
    public double doOperation(double y) {
        return Operations.afterFunc(currentX,y);
    }
}
