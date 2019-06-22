package redactor.gui.dialogs;

import redactor.gui.graph.mimimisation.KavaiForOneFunction;
import redactor.gui.graph.mimimisation.TransitionData;

import javax.swing.*;
import java.awt.*;
import java.util.*;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 11/2/12
 * Time: 11:17 PM
 * To change this template use File | Settings | File Templates.
 */
public class MimimisationAndStructureDialog extends JDialog {

    public MimimisationAndStructureDialog(final JFrame owner, TransitionData transitionData, List<KavaiForOneFunction> listOfMimimi) {
        super(owner, "Transition table", false);

        setSize(490, 360);
        setLocation(owner.getX() + (owner.getWidth() - getWidth()) / 2,
                owner.getY() + (owner.getHeight() - getHeight()) / 2);

        TextArea area = new TextArea();

        String[] header = transitionData.getHeader();
        ArrayList<int[]> table = transitionData.getListOfStates();

        if (table.isEmpty())

            area.append("=(");
        else {
              int markerSize = transitionData.getNumberOfTriggers();

             for (int i = 0; i < header.length; i++){
                 area.append(header[i]+"\t");
             }
            area.append("\n");

            for (int i = 0; i< table.size(); i++){
                int[] current = table.get(i);
                area.append("Z"+current[0]+"\tZ"+current[1]+"\t");

                String temp = String.valueOf(Integer.toBinaryString(current[2]));
                while (temp.length()<markerSize)
                    temp = "0"+temp;
                area.append(temp+"\t");

                temp = String.valueOf(Integer.toBinaryString(current[3]));
                while (temp.length()<markerSize)
                    temp = "0"+temp;
                area.append(temp+"\t");
                
                for (int j = 4; j<current.length; j++)
                    if (current[j] == -1)
                        area.append("-\t");
                else area.append(current[j]+"\t");

                area.append("\n");
            }
            area.append("\n");
            for (int k = 0; k<listOfMimimi.size(); k++){
                KavaiForOneFunction current = listOfMimimi.get(k);
                area.append(current.getName()+" info:\n");
                area.append("before mimimi: " + current.getNotMinFunction()+"\n");
                area.append("after mimimi: " + current.getMinFunction()+"\n");
                area.append("\n");

                area.append("number of inputs before Mimimi = " + current.getNumberOfInputsBeforeMimimi()+"\n");
                area.append("number of inputs after Mimimi = " + current.getNumberOfInputsAfterMimimi()+"\n");
                area.append("\n");

                area.append("number of outputs before Mimimi = " + current.getNumberOfOutputsBeforeMimimi()+"\n");
                area.append("number of outputs after Mimimi = " + current.getNumberOfOutputsAfterMimimi()+"\n");
                area.append("----------------\n");

            }

        }

        area.setEditable(false);

        add(area);


    }


}
