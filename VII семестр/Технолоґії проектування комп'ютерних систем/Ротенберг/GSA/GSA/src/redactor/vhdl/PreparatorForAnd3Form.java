package redactor.vhdl;

import redactor.gui.graph.mimimisation.KavaiForOneFunction;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class PreparatorForAnd3Form {
    List<KavaiForOneFunction> listOfMimimi;
    String[] header;
    List<And3> listOfNodes;
    int tempCounter;


    public PreparatorForAnd3Form(List<KavaiForOneFunction> listOfMimimi, String[] header) {
        this.listOfMimimi = listOfMimimi;
        this.header = header;
        listOfNodes = new ArrayList<And3>();
        tempCounter = 0;
    }

    public void prepareNodes() {
        for (int i = 0; i < listOfMimimi.size(); i++) {
            KavaiForOneFunction currentFunction = listOfMimimi.get(i);
            String[] currentHeader = currentFunction.getHeader();
            List<And3> listForCurrentFunction = new ArrayList<And3>();


            for (int j = 0; j < currentFunction.getMimimisated().size(); j++) {

                int[] currentBraces = currentFunction.getMimimisated().get(j);
                ArrayList<And3> listForCurrentBrace = new ArrayList<And3>();

                And3 and3 = new And3();
                and3.setOutput("temp_" + tempCounter);
                and3.setName("P_"+tempCounter);
                tempCounter++;

                for (int k = 0; k < currentBraces.length-1; k++) {       //because last elementis only a marker
                    if (currentBraces[k] != -1) {
                        int index = and3.returnFreeInput();

                        if (index != -1) {
                            switch (currentBraces[k]) {
                                case 1:
                                    and3.setConcreteInput(index, currentHeader[k]);
                                    break;
                                case 0:
                                    and3.setConcreteInput(index, "!" + currentHeader[k]);
                                    break;
                            }
                        } else {
                            listForCurrentBrace.add(and3);
                            and3 = new And3();
                            and3.setOutput("temp_" + tempCounter);
                            and3.setName("P_"+tempCounter);
                            tempCounter++;

                            switch (currentBraces[k]) {
                                case 1:                                                //00000000000000000
                                    and3.setConcreteInput(0, currentHeader[k]);
                                    break;
                                case 0:
                                    and3.setConcreteInput(0, "!" + currentHeader[k]);
                                    break;
                            }
                        }
                    }
                }
                listForCurrentBrace.add(and3);
                compositeAndObjects(listForCurrentBrace);
                listForCurrentBrace.get(listForCurrentBrace.size()-1).setOutputInverted(true);
                listForCurrentFunction.addAll(listForCurrentBrace);
            }
            List<And3> inverted = selectInverted(listForCurrentFunction) ;
            compositeAndObjects(inverted);
            inverted.removeAll(selectInverted(listForCurrentFunction));
            inverted.get(inverted.size()-1).setOutput(currentFunction.getName());
            listForCurrentFunction.addAll(inverted);
            listOfNodes.addAll(listForCurrentFunction);

        }
    }

    public List<And3> selectInverted(List<And3> list){
         ArrayList<And3> inverted = new ArrayList<And3>();
        for (int i = 0; i< list.size(); i++){
            if (list.get(i).isOutputInverted())
                inverted.add(list.get(i));
        }
        return inverted;
    }

    public void compositeAndObjects(List<And3> list) {

      //  listOfNodes.addAll(list);


        ArrayList<And3> temp2 = new ArrayList<And3>();
        temp2.addAll(list);

        ArrayList<And3> temp1 = new ArrayList<And3>();

        while (temp2.size() > 1) {
            temp1.addAll(temp2);
            temp2 = new ArrayList<And3>();

            And3 tempAndContainer = new And3();
            int c = 0;
            tempAndContainer.setOutput("temp_" + tempCounter);
            tempAndContainer.setName("P_"+tempCounter);
            tempCounter++;
            
            for (Iterator<And3> i = temp1.iterator(); i.hasNext(); ) {
                And3 andString = i.next();
                if (c > 2){
                    temp2.add(tempAndContainer);
                    tempAndContainer = new And3();
                    tempAndContainer.setOutput("temp_" + tempCounter);
                    tempAndContainer.setName("P_"+tempCounter);
                    tempCounter++;
                    c = 0;
                }
                if (andString.returnFreeInput() == 1){
                    tempAndContainer.setConcreteInput(c,andString.getConcreteInput(0));
                    list.remove(andString);
                }
                else
                    tempAndContainer.setConcreteInput(c, andString.getOutput());
                c++;
                i.remove();
            }
            temp2.add(tempAndContainer);
            list.addAll(temp2);
        }


    }

    public void printInfo(){
        for (int i = 0; i< listOfNodes.size(); i++){
            And3 current = listOfNodes.get(i);
            System.out.print("node " + current.getName() +": output: "+current.getOutput()+ "; input: " + current.getConcreteInput(0)
                    + " " + current.getConcreteInput(1) + " " + current.getConcreteInput(2) + "; inversion ");
            if (current.isOutputInverted())
                System.out.println("on");
            else System.out.println("off");
            if (!current.getOutput().contains("temp"))
                System.out.println("---------------------");

        }
    }

    public List<And3> getListOfNodes() {
        return listOfNodes;
    }
}
