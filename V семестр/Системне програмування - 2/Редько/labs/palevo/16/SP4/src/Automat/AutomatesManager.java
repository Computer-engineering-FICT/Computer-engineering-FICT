package Automat;

import java.io.IOException;
import java.util.ArrayList;

public class AutomatesManager {
    public ArrayList<AutomatTable> tables;
    public AutomatesManager(ArrayList<AutomatTable> tables1) throws InvalidTableException{
        if(tables1!=null){
            tables=tables1;
        }else{
            throw new InvalidTableException();
        }
    }

    public AutomatesManager(String[] fileNames) throws InvalidTableException,IncorectFileException,IOException{
        if(fileNames!=null){
            tables=new ArrayList<AutomatTable>();
            for(int i=0;i<fileNames.length;i++){
                tables.add(LoadAutomateTable.load(fileNames[i]));
            }
        }else {
            throw new InvalidTableException();
        }
    }

    public int getTokenTypes(String token){
        int maxN=-1;
        int max=-1;
        int curr;
        for (int i=0;i<tables.size();i++){
            curr=tables.get(i).check(token);
            if(curr>max){
                max=curr;
                maxN=i;
            }
        }
        if(max>-1){
            return tables.get(maxN).typeSolution;
        }
        return -1;
    }
}
