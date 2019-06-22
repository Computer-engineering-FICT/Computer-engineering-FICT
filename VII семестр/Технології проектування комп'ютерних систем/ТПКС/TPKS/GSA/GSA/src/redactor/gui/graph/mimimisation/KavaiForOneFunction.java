package redactor.gui.graph.mimimisation;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class KavaiForOneFunction {
    private String name;
    private String[] header;
    private List<int[]> arguments;
    private int argumentsSize;
    private List<int[]> mimimisated;

    private String notMinFunction;
    private String minFunction;

    private int numberOfInputsBeforeMimimi;
    private int numberOfInputsAfterMimimi;

    private int numberOfOutputsBeforeMimimi;
    private int numberOfOutputsAfterMimimi;


    public KavaiForOneFunction(String name, String[] conditionHeader,
                               ArrayList<int[]> QandXinformation,
                               int markerSize) {
        this.name = name;
        header = new String[markerSize + conditionHeader.length];
        argumentsSize = QandXinformation.size();
        arguments = new ArrayList<int[]>();
        mimimisated = new ArrayList<int[]>();


        for (int i = 0; i < markerSize; i++) {
            header[i] = "Q" + (markerSize - i);
        }
        for (int i = markerSize; i < header.length; i++)
            header[i] = conditionHeader[i - markerSize];


        for (int i = 0; i < argumentsSize; i++) {
            int[] current = QandXinformation.get(i);
            int q = current[0];

            int[] temp = new int[header.length];
            for (int j = markerSize - 1; j >= 0; j--) {
                temp[j] = q % 2;
                q /= 2;
            }
            for (int j = markerSize; j < temp.length; j++)
                temp[j] = current[j - markerSize + 1];


            arguments.add(temp);
        }

        for (int i = 0; i < argumentsSize; i++) {
            int[] current = arguments.get(i);
            int[] temp = Arrays.copyOf(current, current.length + 1);
            if (!contains(mimimisated, temp))
                mimimisated.add(temp);
        }

        notMinFunction = generateFunctionAsString();
        numberOfInputsBeforeMimimi = countInputs();
        numberOfOutputsBeforeMimimi = countOutputs();

    }

    public void mimimisateFunction() {
        boolean needMoreMinimisation = true;

        while (needMoreMinimisation) {
            //    System.out.println(generateFunctionAsString());
            needMoreMinimisation = false;

            ArrayList<int[]> mimimisatedInThisIteration = new ArrayList<int[]>();

            for (int i = 0; i < mimimisated.size() - 1; i++) {
                int[] previous = mimimisated.get(i);

                for (int j = i + 1; j < mimimisated.size(); j++) {
                    int[] current = mimimisated.get(j);

                    int index = differenceByOne(previous, current);
                    if (index != -1) {
                        //    System.out.println("dif in one: "+i+" "+j);

                        int[] temp = Arrays.copyOf(current, current.length);
                        temp[index] = -1;
                        temp[temp.length - 1] = 0;
                        mimimisatedInThisIteration.add(temp);
                        current[current.length - 1] = 1;
                        previous[current.length - 1] = 1;
                    }
                }
            }
            if (mimimisatedInThisIteration.size() > 0) {
                needMoreMinimisation = true;

                for (Iterator<int[]> i = mimimisated.iterator(); i.hasNext(); ) {
                    int[] temp = i.next();
                    if (temp[temp.length - 1] == 1)
                        i.remove();
                }

                for (int i = 0; i < mimimisatedInThisIteration.size(); i++) {
                    int[] current = mimimisatedInThisIteration.get(i);
                    if (!contains(mimimisated, current))
                        mimimisated.add(current);
                }

                mimimisatedInThisIteration.clear();
            }
        }
        minFunction = generateFunctionAsString();
        numberOfInputsAfterMimimi = countInputs();
        numberOfOutputsAfterMimimi = countOutputs();
        //     System.out.println("finally: "+ minFunction);

    }

    public boolean contains(List<int[]> list, int[] item) {
        boolean flag = false;

        for (int i = 0; i < list.size(); i++) {
            int[] temp = list.get(i);
            flag = true;
            for (int j = 0; j < temp.length; j++)
                if (temp[j] != item[j])
                    flag = false;
        }
        return flag;
    }


    /**
     * doesn't check last array value (because it's only a marker)
     *
     * @param arg1
     * @param arg2
     * @return
     */

    public int differenceByOne(int[] arg1, int[] arg2) {

        ArrayList<Integer> differencePositions = new ArrayList<Integer>();
        for (int i = 0; i < arg1.length - 1; i++)
            if (arg1[i] != arg2[i])
                differencePositions.add(i);

        if (differencePositions.size() == 1)
            return differencePositions.get(0);

        return -1;
    }

    public void printTransTableForThis() {

        System.out.println("name = " + name);
        System.out.println("arguments");
        for (int i = 0; i < header.length; i++)
            System.out.print(header[i] + "\t");
        System.out.println();
        for (int i = 0; i < argumentsSize; i++) {
            int[] temp = arguments.get(i);
            for (int j = 0; j < temp.length; j++)
                System.out.print(temp[j] + "\t");
            System.out.println();

        }
    }

    public void printInfo() {
        System.out.println(name + " info:");
        System.out.println("before mimimi: " + notMinFunction);
        System.out.println("after mimimi: " + minFunction);
        System.out.println();
        System.out.println("number of inputs before Mimimi = " + numberOfInputsBeforeMimimi);
        System.out.println("number of inputs after Mimimi = " + numberOfInputsAfterMimimi);
        System.out.println();
        System.out.println("number of outputs before Mimimi = " + numberOfOutputsBeforeMimimi);
        System.out.println("number of outputs after Mimimi = " + numberOfOutputsAfterMimimi);
        System.out.println("--------------------------");
        System.out.println();
    }

    public String generateFunctionAsString() {

        String function = name + " = (";
        for (int i = 0; i < mimimisated.size(); i++) {
            int[] current = mimimisated.get(i);
            for (int j = 0; j < current.length - 1; j++) {
                switch (current[j]) {
                    case 0:
                        function += "!" + header[j];
                        break;
                    case 1:
                        function += header[j];
                        break;
                }
                if ((current[j] != -1))
                    function += " v ";
            }
            function = function.substring(0, function.length() - 3);
            if (i < mimimisated.size() - 1)
                function += ") & (";
            else
                function += ")";
        }
        return function;
    }

    public int countInputs() {
        int counter = 0;
        for (int i = 0; i < mimimisated.size(); i++) {
            int[] current = mimimisated.get(i);
            for (int j = 0; j < current.length; j++)
                if (current[j] != -1)
                    counter++;
        }

        return counter;
    }

    public int countOutputs() {
        return mimimisated.size();
    }

    public String getName() {
        return name;
    }

    public String getNotMinFunction() {
        return notMinFunction;
    }

    public int getNumberOfInputsBeforeMimimi() {
        return numberOfInputsBeforeMimimi;
    }

    public String getMinFunction() {
        return minFunction;
    }

    public int getNumberOfInputsAfterMimimi() {
        return numberOfInputsAfterMimimi;
    }

    public int getNumberOfOutputsBeforeMimimi() {
        return numberOfOutputsBeforeMimimi;
    }

    public int getNumberOfOutputsAfterMimimi() {
        return numberOfOutputsAfterMimimi;
    }

    public List<int[]> getMimimisated() {
        return mimimisated;
    }

    public String[] getHeader() {
        return header;
    }
}
