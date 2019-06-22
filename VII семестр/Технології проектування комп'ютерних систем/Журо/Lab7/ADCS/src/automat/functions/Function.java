package automat.functions;

import java.util.ArrayList;

public class Function {

    private String name;
    private ArrayList<Implicant> implicants;
    private int boolFunction;

    public Function(String name, ArrayList<Implicant> implicants, int boolFunction) {
        this.name = name;
        this.implicants = implicants;
        this.boolFunction = boolFunction;
    }

    public String getName() {
        return name;
    }

    public ArrayList<Implicant> getImplicants() {
        return implicants;
    }

    public int getBoolFunction() {
        return boolFunction;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(name);
        builder.append(" <= ");
        String boolFunctionString;
        if (boolFunction <= 2) {
            boolFunctionString = BoolFunction.getBoolFunctionString(boolFunction);
        } else {
            builder.append(BoolFunction.getBoolFunctionString(4));
            boolFunctionString = BoolFunction.getBoolFunctionString(boolFunction - 2);
        }
        if (implicants.size() > 1) {
            builder.append("(");
        }
        for (int i = 0; i < implicants.size() - 1; i++) {
            builder.append(implicants.get(i).toString());
            builder.append(" ");
            builder.append(boolFunctionString);
            builder.append(" ");
        }
        builder.append(implicants.get(implicants.size() - 1).toString());
        if (implicants.size() > 1) {
            builder.append(")");
        }
        return builder.toString();
    }

    public ArrayList<String> getAllNames() {
        ArrayList<String> allNames = new ArrayList<String>();
        for (Implicant i : implicants) {
            ArrayList<String> iNames = i.getAllNames();
            for (String s1 : iNames) {
                boolean isAlready = false;
                for (String s2 : allNames) {
                    if (s1.compareTo(s2) == 0) {
                        isAlready = true;
                    }
                }
                if (!isAlready) {
                    allNames.add(s1);
                }
            }
        }
        return allNames;
    }

}
