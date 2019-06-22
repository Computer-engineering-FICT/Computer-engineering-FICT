package automat.functions;

import automat.moore.AutomatTableModel;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 17.11.2010
 * Time: 1:11:19
 * To change this template use File | Settings | File Templates.
 */
public class FunctionsWorker {

    public static ArrayList<Function> getFunctions(AutomatTableModel tableModel) {
        ArrayList<Function> functions = new ArrayList<Function>();
        String[][] table = tableModel.getTable();
        int index1 = tableModel.getyStartIndex();
        for (int i = 0; i < tableModel.getyCount(); i++) {
            ArrayList<Implicant> implicants = new ArrayList<Implicant>();
            for (int j = 1; j < table.length; j++) {
                if (table[j][index1].compareTo("1") == 0) {
                    ArrayList<String> names = new ArrayList<String>();
                    ArrayList<Boolean> values = new ArrayList<Boolean>();
                    int index2 = tableModel.getqStartIndex();
                    for (int k = 0; k < tableModel.getqCount(); k++) {
                        names.add(table[0][index2].substring(0, table[0][index2].length() - 3));
                        if (table[j][index2].compareTo("0") == 0) {
                            values.add(false);
                        }
                        else {
                            values.add(true);
                        }
                        index2++;
                    }
                    boolean isAlready = false;
                    for (int k = 0; k < implicants.size(); k++) {
                        if (names.size() == implicants.get(k).getNames().size()) {
                            boolean equal = true;
                            for (int z = 0; z < implicants.get(k).getNames().size(); z++) {
                                if ((names.get(z).compareTo(implicants.get(k).getNames().get(z)) != 0) ||
                                            (((names.get(z) != implicants.get(k).getNames().get(z)) &&
                                            (values.get(z) != implicants.get(k).getValues().get(z))))) {
                                    equal = false;
                                }
                            }
                            if (equal) {
                                isAlready = true;
                            }
                        }
                    }
                    if (!isAlready) {
                        implicants.add(new Implicant(names, values, 0));
                    }
                }
            }
            functions.add(new Function(table[0][index1], implicants, 1));
            index1++;
        }
        index1 = tableModel.getdStartIndex();
        for (int i = 0; i < tableModel.getdCount(); i++) {
            ArrayList<Implicant> implicants = new ArrayList<Implicant>();
            for (int j = 1; j < table.length; j++) {
                if (table[j][index1].compareTo("1") == 0) {
                    ArrayList<String> names = new ArrayList<String>();
                    ArrayList<Boolean> values = new ArrayList<Boolean>();
                    int index2 = tableModel.getqStartIndex();
                    for (int k = 0; k < tableModel.getqCount(); k++) {
                        names.add(table[0][index2].substring(0, table[0][index2].length() - 3));
                        if (table[j][index2].compareTo("0") == 0) {
                            values.add(false);
                        }
                        else {
                            values.add(true);
                        }
                        index2++;
                    }
                    index2 = tableModel.getxStartIndex();
                    for (int k = 0; k < tableModel.getxCount(); k++) {
                        if (table[j][index2].compareTo("-") != 0) {
                            names.add(table[0][index2]);
                            if (table[j][index2].compareTo("0") == 0) {
                                values.add(false);
                            } else {
                                values.add(true);
                            }
                        }
                        index2++;
                    }
                    implicants.add(new Implicant(names, values, 0));
                }
            }
            functions.add(new Function(table[0][index1], implicants, 1));
            index1++;
        }
        return functions;
    }

    public static ArrayList<Function> prepareFunctionsToMinimization(ArrayList<Function> functions) {
        ArrayList<Function> newFunctions = new ArrayList<Function>();
        for (Function f : functions) {
            ArrayList<Implicant> implicants = f.getImplicants();
            ArrayList<String> allNames = new ArrayList<String>();
            for (int i = 0; i < implicants.size(); i++) {
                ArrayList<String> names = implicants.get(i).getNames();
                for (int j = 0; j < names.size(); j++) {
                    boolean contains = false;
                    for (int k = 0; k < allNames.size(); k++) {
                        if (allNames.get(k).compareTo(names.get(j)) == 0) {
                            contains = true;
                        }
                    }
                    if (!contains) {
                        allNames.add(new String(names.get(j)));
                    }
                }
            }
            ArrayList<Implicant> newImplicants = new ArrayList<Implicant>();
            for (int i = 0; i < implicants.size(); i++) {
                ArrayList<String> names = implicants.get(i).getNames();
                ArrayList<Boolean> values = implicants.get(i).getValues();
                ArrayList<String> newNames = new ArrayList<String>();
                ArrayList<Boolean> newValues = new ArrayList<Boolean>();
                for (int j = 0; j < allNames.size(); j++) {
                    newNames.add(new String(allNames.get(j)));
                    newValues.add(null);
                }
                for (int j = 0; j < names.size(); j++) {
                    for (int k = 0; k < newNames.size(); k++) {
                        if (names.get(j).compareTo(newNames.get(k)) == 0) {
                            newValues.set(k, new Boolean(values.get(j)));
                        }
                    }
                }
                newImplicants.add(new Implicant(newNames, newValues, implicants.get(i).getBoolFunction()));
            }
            newFunctions.add(new Function(new String(f.getName()), newImplicants, f.getBoolFunction()));
        }
        return newFunctions;
    }

    public static ArrayList<Function> minimizeFunctions(ArrayList<Function> functions) {
        ArrayList<Function> minimizedFunctions = new ArrayList<Function>();
        for (Function f : functions) {
            ArrayList<ArrayList<Implicant>> implicants = new ArrayList<ArrayList<Implicant>>();
            ArrayList<ArrayList<Boolean>> isCovered = new ArrayList<ArrayList<Boolean>>();
            ArrayList<Implicant> originalImplicats = f.getImplicants();
            ArrayList<Implicant> startImplicants = new ArrayList<Implicant>();
            ArrayList<Boolean> startIsCovered = new ArrayList<Boolean>();
            for (int i = 0; i < originalImplicats.size(); i++) {
                startImplicants.add(originalImplicats.get(i).clone());
                startIsCovered.add(false);
            }
            implicants.add(startImplicants);
            isCovered.add(startIsCovered);
            boolean flag = false;
            while (!flag) {
                ArrayList<Implicant> coveringImplicants = implicants.get(implicants.size() - 1);
                ArrayList<Boolean> coveringIsCover = isCovered.get(isCovered.size() - 1);
                ArrayList<Implicant> coverImplicants = new ArrayList<Implicant>();
                for (int i = 0; i < coveringImplicants.size() - 1; i++) {
                    if (!coveringIsCover.get(i)) {
                        for (int j = i + 1; j < coveringImplicants.size(); j++) {
                            int difference = 0;
                            int differenceIndex = -1;
                            ArrayList<String> names1 = coveringImplicants.get(i).getNames();
                            ArrayList<Boolean> values1 = coveringImplicants.get(i).getValues();
                            ArrayList<String> names2 = coveringImplicants.get(j).getNames();
                            ArrayList<Boolean> values2 = coveringImplicants.get(j).getValues();
                            for (int k = 0; k < names1.size(); k++) {
                                if (names1.get(k).compareTo(names2.get(k)) != 0) {
                                    difference++;
                                    differenceIndex = k;
                                }
                                else {
                                    if ((values1.get(k) != null) && (values2.get(k) != null) &&
                                                (values1.get(k).compareTo(values2.get(k)) != 0)) {
                                        difference++;
                                        differenceIndex = k;
                                    }
                                }
                            }
                            if (difference < 2) {
                                ArrayList<String> newNames = new ArrayList<String>();
                                ArrayList<Boolean> newValues = new ArrayList<Boolean>();
                                for (int k = 0; k < names1.size(); k++) {
                                    if (k != differenceIndex) {
                                        newNames.add(new String(names1.get(k)));
                                        if (values1.get(k) != null) {
                                            newValues.add(new Boolean(values1.get(k)));
                                        }
                                        else {
                                            if (values2.get(k) != null) {
                                                newValues.add(new Boolean(values2.get(k)));
                                            }
                                            else {
                                                newValues.add(null);
                                            }
                                        }
                                    }
                                }
                                boolean isAlready = false;
                                for (int k = 0; k < coverImplicants.size(); k++) {
                                    if (newNames.size() == coverImplicants.get(k).getNames().size()) {
                                        boolean equal = true;
                                        for (int z = 0; z < coverImplicants.get(k).getNames().size(); z++) {
                                            if ((newNames.get(z).compareTo(coverImplicants.get(k).getNames().get(z)) != 0) ||
                                                    (((newNames.get(z) != coverImplicants.get(k).getNames().get(z)) &&
                                                            (newValues.get(z) != coverImplicants.get(k).getValues().get(z))))) {
                                                equal = false;
                                            }
                                        }
                                        if (equal) {
                                            isAlready = true;
                                        }
                                    }
                                    else {
                                        isAlready = true;
                                    }
                                }
                                if (!isAlready) {
                                    coverImplicants.add(new Implicant(newNames, newValues,
                                                coveringImplicants.get(i).getBoolFunction()));
                                }
                                coveringIsCover.set(i, true);
                                coveringIsCover.set(j, true);
                            }
                        }
                    }
                }
                implicants.add(coverImplicants);
                isCovered.add(new ArrayList<Boolean>());
                for (int i = 0; i < coverImplicants.size(); i++) {
                    isCovered.get(isCovered.size() - 1).add(false);
                }
                flag = true;
                for (int i = 0; i < isCovered.get(isCovered.size() - 2).size(); i++) {
                    if (isCovered.get(isCovered.size() - 2).get(i)) {
                        flag = false;
                    }
                }
            }
            ArrayList<Implicant> minimizedImplicants = new ArrayList<Implicant>();
            for (int i = 0; i < implicants.size(); i++) {
                for (int j = 0; j < implicants.get(i).size(); j++) {
                    if (!isCovered.get(i).get(j)) {
                        ArrayList<String> names = implicants.get(i).get(j).getNames();
                        ArrayList<Boolean> values = implicants.get(i).get(j).getValues();
                        boolean hasNull = true;
                        while (hasNull) {
                            hasNull = false;
                            for (int k = 0; k < values.size(); k++) {
                                if (values.get(k) == null) {
                                    hasNull = true;
                                    names.remove(k);
                                    values.remove(k);
                                }
                            }
                        }
                        implicants.get(i).get(j).setNames(names);
                        implicants.get(i).get(j).setValues(values);
                        minimizedImplicants.add(implicants.get(i).get(j));
                    }
                }
            }
            minimizedFunctions.add(new Function(new String(f.getName()), minimizedImplicants, f.getBoolFunction()));
        }
        return minimizedFunctions;
    }

    public static MinimizationEfficiencyObject analyzeMinimization(ArrayList<Function> functions,
                                                                   ArrayList<Function> minimizedFunctions) {
        int elementCount1 = 0;
        int elementCount2 = 0;
        int entryCount1 = 0;
        int entryCount2 = 0;
        int exitCount1 = 0;
        int exitCount2 = 0;
        for (Function f : functions) {
            elementCount1++;
            exitCount1++;
            for (Implicant i : f.getImplicants()) {
                elementCount1++;
                entryCount1 += i.getNames().size();
                exitCount1++;
            }
        }
        for (Function f : minimizedFunctions) {
            elementCount2++;
            exitCount2++;
            for (Implicant i : f.getImplicants()) {
                elementCount2++;
                entryCount2 += i.getNames().size();
                exitCount2++;
            }
        }
        return new MinimizationEfficiencyObject(elementCount1, elementCount2, entryCount1, entryCount2, exitCount1,
                                                exitCount2);
    }

    public static ArrayList<Function> convertFromAndOrTo3AndNotBasis(ArrayList<Function> originalFunctions) {
        ArrayList<Function> functions = new ArrayList<Function>();
        for (Function f : originalFunctions) {
            ArrayList<Implicant> implicants = new ArrayList<Implicant>();
            ArrayList<Implicant> originalImplicants = f.getImplicants();
            for (Implicant i : originalImplicants) {
                if (i.getNames().size() > 3) {
                    double temp = Math.log(i.getNames().size()) / Math.log(3);
                    if (temp > (int) temp) {
                        temp = (int) temp + 1;
                    }
                    ArrayList<Implicant> tempImplicants = new ArrayList<Implicant>();
                    int counter = 1;
                    ArrayList<String> names = i.getNames();
                    ArrayList<Boolean> values = i.getValues();
                    ArrayList<String> newNames = null;
                    ArrayList<Boolean> newValues = null;
                    for (int j = 0; j < names.size(); j++) {
                        if (counter == 1) {
                            newNames = new ArrayList<String>();
                            newValues = new ArrayList<Boolean>();
                        }
                        newNames.add(new String(names.get(j)));
                        newValues.add(new Boolean(values.get(j)));
                        if (counter % 3 == 0) {
                            tempImplicants.add(new Implicant(newNames, newValues, 0));
                            newNames = null;
                            newValues = null;
                            counter = 1;
                        } else {
                            counter++;
                        }
                    }
                    if (counter != 1) {
                        while (counter < 4) {
                            newNames.add(new String(newNames.get(newNames.size() - 1)));
                            newValues.add(new Boolean(newValues.get(newValues.size() - 1)));
                            counter++;
                        }
                        tempImplicants.add(new Implicant(newNames, newValues, 0));
                    }
                    if (temp > 2) {
                        counter = 0;
                        while (counter < temp - 2) {
                            ArrayList<Implicant> newImplicants = new ArrayList<Implicant>();
                            ArrayList<Implicant> simpleImplicants = null;
                            int subCounter = 1;
                            for (int j = 0; j < implicants.size(); j++) {
                                if (subCounter == 1) {
                                    simpleImplicants = new ArrayList<Implicant>();
                                }
                                simpleImplicants.add(implicants.get(j));
                                if (subCounter % 3 == 0) {
                                    newImplicants.add(new CompositeImplicant(simpleImplicants, 0));
                                    simpleImplicants = null;
                                    subCounter = 1;
                                } else {
                                    subCounter++;
                                }
                            }
                            if (subCounter != 1) {
                                while (subCounter < 4) {
                                    simpleImplicants.add(simpleImplicants.get(simpleImplicants.size() - 1).clone());
                                    subCounter++;
                                }
                                newImplicants.add(new CompositeImplicant(simpleImplicants, 0));
                            }
                            implicants = newImplicants;
                            counter++;
                        }
                    } else {
                        while (tempImplicants.size() % 3 != 0) {
                            tempImplicants.add(tempImplicants.get(tempImplicants.size() - 1));
                        }
                        implicants.add(new CompositeImplicant(tempImplicants, 0));
                    }
                } else {
                    Implicant cloneImplicant = i.clone();
                    ArrayList<String> names = cloneImplicant.getNames();
                    ArrayList<Boolean> values = cloneImplicant.getValues();
                    if (names.size() > 1) {
                        while (names.size() % 3 != 0) {
                            names.add(names.get(names.size() - 1));
                            values.add(values.get(values.size() - 1));
                        }
                    }
                    implicants.add(new Implicant(names, values, 0));
                }
            }
            ArrayList<Implicant> newImplicants;
            if (implicants.size() > 1) {
                newImplicants = new ArrayList<Implicant>();
                for (int j = 0; j < implicants.size(); j++) {
                    ArrayList<Implicant> tempList = new ArrayList<Implicant>();
                    tempList.add(implicants.get(j));
                    newImplicants.add(new CompositeImplicant(tempList, 4));
                }
                implicants = newImplicants;
            }
            if (implicants.size() > 3) {
                double temp = Math.log(implicants.size()) / Math.log(3);
                if (temp > (int) temp) {
                    temp = (int) temp + 1;
                }
                while (temp > 1) {
                    newImplicants = new ArrayList<Implicant>();
                    ArrayList<Implicant> subImplicants = null;
                    int counter = 1;
                    for (int j = 0; j < implicants.size(); j++) {
                        if (counter == 1) {
                            subImplicants = new ArrayList<Implicant>();
                        }
                        subImplicants.add(implicants.get(j));
                        if (counter % 3 == 0) {
                            newImplicants.add(new CompositeImplicant(subImplicants, 0));
                            newImplicants = null;
                            counter = 1;
                        } else {
                            counter++;
                        }
                    }
                    if (counter != 1) {
                        while (counter < 4) {
                            subImplicants.add(subImplicants.get(subImplicants.size() - 1).clone());
                            counter++;
                        }
                        newImplicants.add(new CompositeImplicant(subImplicants, 0));
                    }
                    implicants = newImplicants;
                    temp = temp - 1;
                }
            }
            else {
                if (implicants.size() > 1) {
                    while (implicants.size() % 3 != 0) {
                        implicants.add(implicants.get(implicants.size() - 1));
                    }
                }
            }
            ArrayList<Implicant> tempList = new ArrayList<Implicant>();
            if (implicants.size() > 1) {
                ArrayList<Implicant> tempSubList = new ArrayList<Implicant>();
                tempSubList.add(new CompositeImplicant(implicants, 0));
                tempList.add(new CompositeImplicant(tempSubList, 4));
            } else {
                tempList.add(implicants.get(0));
            }
            functions.add(new Function(f.getName(), tempList, 0));
        }
        return functions;
    }

    public static String getVHDLDescriptionOfFunctions(ArrayList<Function> functions) {
        ArrayList<String> inNames = new ArrayList<String>();
        ArrayList<String> outNames = new ArrayList<String>();
        for (Function f : functions) {
            outNames.add(f.getName());
            ArrayList<String> fNames = f.getAllNames();
            for (String s1 : fNames) {
                boolean isAlready = false;
                for (String s2 : inNames) {
                    if (s1.compareTo(s2) == 0) {
                        isAlready = true;
                    }
                }
                if (!isAlready) {
                    inNames.add(s1);
                }
            }
        }
        StringBuilder builder = new StringBuilder();
        builder.append("entity automat is\n");
        builder.append("\tport (");
        for (int i = 0; i < inNames.size() - 1; i++) {
            builder.append(inNames.get(i));
            builder.append(", ");
        }
        builder.append(inNames.get(inNames.size() - 1));
        builder.append(": in BIT; ");
        for (int i = 0; i < outNames.size() - 1; i++) {
            builder.append(outNames.get(i));
            builder.append(", ");
        }
        builder.append(outNames.get(outNames.size() - 1));
        builder.append(": out BIT);\nend automat;\narchitecture functions of automat is\nbegin\n\t");
        for (int i = 0; i < functions.size() - 1; i++) {
            builder.append(functions.get(i).toString());
            builder.append(";\n\t");
        }
        builder.append(functions.get(functions.size() - 1).toString());
        builder.append(";\n");
        builder.append("end functions;");
        return builder.toString();
    }

}
