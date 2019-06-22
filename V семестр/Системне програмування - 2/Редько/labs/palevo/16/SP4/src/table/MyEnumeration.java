package table;

public class MyEnumeration {
    private int value;
    public MyEnumeration(){
    }
    public int getValue(){
        return value;
    }
    public void setValue(int value1) throws IncorectEnumerationValue{
        if(value1<5 && value1>0){
            value=value1;
        }else {
            throw new IncorectEnumerationValue();
        }
    }
}
