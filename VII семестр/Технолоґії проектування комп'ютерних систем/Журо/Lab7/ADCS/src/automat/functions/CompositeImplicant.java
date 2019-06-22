package automat.functions;

import java.util.ArrayList;

class CompositeImplicant extends Implicant {

    private ArrayList<Implicant> implicants;

    public CompositeImplicant(ArrayList<Implicant> implicants, int boolFunction) {
        this.implicants = implicants;
        this.boolFunction = boolFunction;
    }

    public CompositeImplicant(Implicant simpleImplicant, ArrayList<Implicant> implicants) {
        this.names = simpleImplicant.names;
        this.values = simpleImplicant.values;
        this.boolFunction = simpleImplicant.boolFunction;
        this.implicants = implicants;
    }

    public CompositeImplicant(ArrayList<String> names, ArrayList<Boolean> values, ArrayList<Implicant> implicants,
                              int boolFunction) {
        this.names = names;
        this.values = values;
        this.implicants = implicants;
        this.boolFunction = boolFunction;
    }

    public ArrayList<Implicant> getImplicants() {
        return implicants;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        String boolFunctionString;
        if (boolFunction <= 2) {
            boolFunctionString = BoolFunction.getBoolFunctionString(boolFunction);
        } else {
            builder.append("(");
            builder.append(BoolFunction.getBoolFunctionString(4));
            boolFunctionString = BoolFunction.getBoolFunctionString(boolFunction - 2);
        }
        if (boolFunction != 4) {
            builder.append("(");
        }
        if (names != null) {
            for (int i = 0; i < names.size() - 1; i++) {
                if (!values.get(i)) {
                    builder.append(BoolFunction.getBoolFunctionString(4));
                }
                builder.append(names.get(i));
                builder.append(" ");
                builder.append(boolFunctionString);
                builder.append(" ");
            }
            if (!values.get(names.size() - 1)) {
                builder.append(BoolFunction.getBoolFunctionString(4));
            }
            builder.append(names.get(names.size() - 1));
            if (implicants == null) {
                builder.append(" ");
                builder.append(BoolFunction.getBoolFunctionString(4));
            }
        }
        if (implicants != null) {
            for (int i = 0; i < implicants.size() - 1; i++) {
                if (i != 0) {
                    builder.append(" ");
                }
                builder.append(implicants.get(i).toString());
                builder.append(" ");
                builder.append(boolFunctionString);
            }
            if (!implicants.isEmpty()) {
                if (implicants.size() > 1) {
                    builder.append(" ");
                }
                builder.append(implicants.get(implicants.size() - 1));
            }
        }
        builder.append(")");
        return builder.toString();
    }

    @Override
    public Implicant clone() {
        Implicant simpleImplicant = super.clone();
        ArrayList<Implicant> cloneImplicants = new ArrayList<Implicant>();
        for (Implicant i : implicants) {
            cloneImplicants.add(i.clone());
        }
        return new CompositeImplicant(simpleImplicant, cloneImplicants);
    }

    public ArrayList<String> getAllNames() {
        ArrayList<String> allNames = new ArrayList<String>();
        if (names != null) {
            allNames.addAll(super.getAllNames());
        }
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
