package automat.functions;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 16.11.2010
 * Time: 19:29:13
 * To change this template use File | Settings | File Templates.
 */
class Implicant implements Cloneable {

    protected ArrayList<String> names;
    protected ArrayList<Boolean> values;
    protected int boolFunction;

    Implicant() {}

    public Implicant(ArrayList<String> names, ArrayList<Boolean> values, int boolFunction) {
        this.names = names;
        this.values = values;
        this.boolFunction = boolFunction;
    }

    public ArrayList<String> getNames() {
        return names;
    }

    public ArrayList<Boolean> getValues() {
        return values;
    }

    public int getBoolFunction() {
        return boolFunction;
    }

    public void setNames(ArrayList<String> names) {
        this.names = names;
    }

    public void setValues(ArrayList<Boolean> values) {
        this.values = values;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        String boolFunctionString;
        if (boolFunction <= 2) {
            boolFunctionString = BoolFunction.getBoolFunctionString(boolFunction);
        } else {
            builder.append(BoolFunction.getBoolFunctionString(4));
            boolFunctionString = BoolFunction.getBoolFunctionString(boolFunction - 2);
        }
        builder.append("(");
        for (int i = 0; i < names.size() - 1; i++) {
            if (!values.get(i)) {
                builder.append("(");
                builder.append(BoolFunction.getBoolFunctionString(4));
                builder.append(" ");
                builder.append(names.get(i));
                builder.append(")");
            }
            else {
                builder.append(names.get(i));
            }
            builder.append(" ");
            builder.append(boolFunctionString);
            builder.append(" ");
        }
        if (!values.get(names.size() - 1)) {
            builder.append("(");
            builder.append(BoolFunction.getBoolFunctionString(4));
            builder.append(" ");
            builder.append(names.get(names.size() - 1));
            builder.append(")");
        }
        else {
            builder.append(names.get(names.size() - 1));
        }
        builder.append(")");
        return builder.toString();
    }

    public Implicant clone() {
        ArrayList<String> cloneNames = new ArrayList<String>();
        for (int i = 0; i < names.size(); i++) {
            cloneNames.add(new String(names.get(i)));
        }
        ArrayList<Boolean> cloneValues = new ArrayList<Boolean>();
        for (int i = 0; i < values.size(); i++) {
            if (values.get(i) != null) {
                cloneValues.add(new Boolean(values.get(i)));
            }
            else {
                cloneValues.add(null);
            }
        }
        return new Implicant(cloneNames, cloneValues, boolFunction);
    }

    public ArrayList<String> getAllNames() {
        ArrayList<String> allNames = new ArrayList<String>();
        for (int i = 0; i < names.size(); i++) {
            allNames.add(new String(names.get(i)));
        }
        return allNames;
    }

}
