package tree;
import table.*;
public class TablesOperator {
    /*
        type=0 - identifiers;
        type=1 - constants;
        type=2 - operations;
     */
    public static int IDENTIFIERS=0;
    public static int CONSTANTS=1;
    public static int OPERATIONS=2;
    private Table identifiers;
    private Table constants;
    private Table operations;
    public TablesOperator(){
        identifiers=new Table();
        constants=new Table();
        operations=new Table();
    }
    public TablesOperator(Table identifiers1,Table constants1,Table operations1){
        identifiers=identifiers1;
        constants=constants1;
        operations=operations1;
    }
    public String getValue(int type,int index) throws IncorectIndex{
        String res=null;
        switch (type){
            case 0: res=identifiers.select(index).field; break;
            case 1: res=constants.select(index).field; break;
            case 2: res=operations.select(index).field; break;
        }
        if(res==null){
            throw new IncorectIndex();
        }
        return res;
    }

    public int insertValue(int type,String value) throws IncorectRecordException{
        int index=-1;

        switch (type){
            case 0: index=(int)identifiers.insert(new Record(value,null)); break;
            case 1: index=(int)constants.insert(new Record(value,null)); break;
            case 2: index=(int)operations.insert(new Record(value,null)); break;
        }
        return index;
    }
}
