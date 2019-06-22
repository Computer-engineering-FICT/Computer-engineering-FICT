package redactor.gui.graph.mimimisation;

import java.util.ArrayList;
import java.util.List;


public class Minnimisator {
    String[] header;
    List<int[]> structureTable;
    int markerSize;
    List<KavaiForOneFunction> mimimisated;

    public Minnimisator(TransitionData transitionData, int markerSize){
        header = transitionData.getHeader();
        structureTable = transitionData.getListOfStates();
        this.markerSize = markerSize;
        mimimisated = new ArrayList<KavaiForOneFunction>();
    }

    public void executeMimimisation(){

        ArrayList<String> cond = new ArrayList<String>();
        int index = 4;
        while ((header[index].charAt(0) == 'X') ||
                (header[index].charAt(0) == 'x')) {
            cond.add(header[index]);
            index++;
        }

        String[] conditionValues = new String[cond.size()] ;
        for (int i = 0; i<conditionValues.length; i++)
            conditionValues[i] = cond.get(i);

        for (int i = 4+conditionValues.length; i< header.length; i++){
            String name = header[i];
            ArrayList<int[]> information = new ArrayList<int[]>();
            for (int j = 0; j<structureTable.size(); j++){
                if (structureTable.get(j)[i] == 0 ) {        //minimisation by 0
                    int[] temp = new int[1+conditionValues.length];
                    temp[0] =  structureTable.get(j)[2];
                    for (int k = 1; k<temp.length; k++)
                        temp[k] = structureTable.get(j)[3+k]  ;
                    information.add(temp);
                }
            }
            KavaiForOneFunction kavaiForOneFunction = new KavaiForOneFunction(name,
                    conditionValues,information,markerSize);

            kavaiForOneFunction.mimimisateFunction();
       //     kavaiForOneFunction.printInfo();

            mimimisated.add(kavaiForOneFunction);
        }
    }

    public List<KavaiForOneFunction> getMimimisated() {
        return mimimisated;
    }
}
