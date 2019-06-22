package redactor.gui.graph.mimimisation;

import redactor.Data;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 11/2/12
 * Time: 11:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class TransitionAndMimimiTextCreator {
    TransitionData transitionData;
    List<KavaiForOneFunction> mimimiList;

    public TransitionAndMimimiTextCreator(TransitionData transitionData, List<KavaiForOneFunction> mimimiList) {
        this.transitionData = transitionData;
        this.mimimiList = mimimiList;
    }

    public boolean writeToFile(final String path) {
        try {
            PrintWriter out = new PrintWriter(new FileOutputStream(path));

            if (transitionData != null) {
                String[] header = transitionData.getHeader();
                for (int i = 0; i< header.length; i++)
                    out.print(header[i]+"\t");
                ArrayList<int[]> table = transitionData.getListOfStates();
                for (int i = 0; i< table.size(); i++){
                    int[] current = table.get(i);
                    for (int j = 0; j<current.length; j++)
                        out.print(current[j]+"\t");
                    out.println();
                }
                
                for (int i = 0; i< mimimiList.size(); i++){
                    KavaiForOneFunction current = mimimiList.get(i);
                    out.print(current.getName()+"\t");
                    out.println("before mimimi: "+current.getNotMinFunction());
                    out.println("after mimimi: "+current.getMinFunction()+"\n");
                    out.println("inputs before mimimi = "+current.getNumberOfInputsBeforeMimimi());
                    out.println("inputs after mimimi = "+current.getNumberOfInputsAfterMimimi());
                    out.println("outputs before mimimi = "+current.getNumberOfOutputsBeforeMimimi());
                    out.println("outputs after mimimi = "+current.getNumberOfOutputsAfterMimimi());
                    out.println("---------------");
                }

            }

            out.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
