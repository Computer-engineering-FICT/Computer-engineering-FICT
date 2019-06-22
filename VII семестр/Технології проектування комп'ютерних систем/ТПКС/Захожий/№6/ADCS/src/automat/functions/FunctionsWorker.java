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
                    implicants.add(new Implicant(names, values, 0));
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
                                coverImplicants.add(new Implicant(newNames, newValues,
                                            coveringImplicants.get(i).getBoolFunction()));
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

}
