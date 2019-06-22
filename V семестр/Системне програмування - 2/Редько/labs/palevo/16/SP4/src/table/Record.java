package table;

public class Record {
    public long key;
    public String  field;
    public MyEnumeration enumeration;

    public Record(String field1, MyEnumeration enumeration1) {
        if(field1!=null){
            field = field1;
            enumeration = enumeration1;
        }else{
            throw new NullPointerException();
        }
    }

    public void print() {
        System.out.print(key + "  ");
        System.out.print(field);
        System.out.print(" "+enumeration.getValue());
        System.out.println();
    }
}
