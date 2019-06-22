package automat.moore;

import javax.swing.table.AbstractTableModel;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 03.11.2010
 * Time: 5:26:16
 * To change this template use File | Settings | File Templates.
 */
public class AutomatTableModel extends AbstractTableModel {

    private String[][] table;

    private int qStartIndex;
    private int qCount;
    private int xStartIndex;
    private int xCount;
    private int yStartIndex;
    private int yCount;
    private int dStartIndex;
    private int dCount;

    public AutomatTableModel(CodedMooreAutomat automat) {
        String[] stateNames = automat.getStateNames();
        String[] stateCodes = automat.getStateCodes();
        int[][] connectionMatrix = automat.getConnectionMatrix();
        int[][] yNumbers = automat.getyNumbers();
        int[][] xNumbers = automat.getxNumbers();
        boolean[][] xValues = automat.getxValues();
        int colCount = 1 + 3 * stateCodes[0].length();
        ArrayList<Integer> x = new ArrayList<Integer>();
        for (int i = 0; i < xNumbers.length; i++) {
            if (xNumbers[i] != null) {
                for (int j = 0; j < xNumbers[i].length; j++) {
                    if (!x.contains(xNumbers[i][j])) {
                        x.add(xNumbers[i][j]);
                    }
                }
            }
        }
        Collections.sort(x);
        ArrayList<Integer> y = new ArrayList<Integer>();
        for (int i = 0; i < yNumbers.length; i++) {
            if (yNumbers[i] != null) {
                for (int j = 0; j < yNumbers[i].length; j++) {
                    if (!y.contains(yNumbers[i][j])) {
                        y.add(yNumbers[i][j]);
                    }
                }
            }
        }
        Collections.sort(y);
        colCount += x.size() + y.size();
        table = new String[xNumbers.length + 1][];
        for (int i = 0; i < table.length; i++) {
            table[i] = new String[colCount];
        }
        table[0][0] = "Transition";
        int column = 1;
        qStartIndex = column;
        qCount = stateCodes[0].length();
        for (int i = 0; i < stateCodes[0].length(); i++) {
            table[0][column] = "Q" + String.valueOf(stateCodes[0].length() - i) + "(t)";
            column++;
        }
        for (int i = 0; i < stateCodes[0].length(); i++) {
            table[0][column] = "Q" + String.valueOf(stateCodes[0].length() - i) + "(t + 1)";
            column++;
        }
        xStartIndex = column;
        xCount = x.size();
        for (int i = 0; i < x.size(); i++) {
            table[0][column] = "X" + String.valueOf(x.get(i));
            column++;
        }
        yStartIndex = column;
        yCount = y.size();
        for (int i = 0; i < y.size(); i++) {
            table[0][column] = "Y" + String.valueOf(y.get(i));
            column++;
        }
        dStartIndex = column;
        dCount = stateCodes[0].length();
        for (int i = 0; i < stateCodes[0].length(); i++) {
            table[0][column] = "D" + String.valueOf(stateCodes[0].length() - i);
            column++;
        }
        int row = 1;
        for (int i = 0; i < connectionMatrix.length; i++) {
            for (int j = 0; j < connectionMatrix[i].length; j++) {
                if (connectionMatrix[i][j] > -1) {
                    table[row][0] = stateNames[i] + "->" + stateNames[j];
                    column = 1;
                    for (int k = 0; k < stateCodes[i].length(); k++) {
                        table[row][column] = stateCodes[i].substring(k, k + 1);
                        column++;
                    }
                    for (int k = 0; k < stateCodes[j].length(); k++) {
                        table[row][column] = stateCodes[j].substring(k, k + 1);
                        column++;
                    }
                    for (int k = 0; k < x.size(); k++) {
                        if (xNumbers[connectionMatrix[i][j]] != null) {
                            int found = -1;
                            for (int z = 0; z < xNumbers[connectionMatrix[i][j]].length; z++) {
                                if (x.get(k) == xNumbers[connectionMatrix[i][j]][z]) {
                                    found = z;
                                }
                            }
                            if (found > -1) {
                                if (xValues[connectionMatrix[i][j]][found]) {
                                    table[row][column] = "1";
                                }
                                else {
                                    table[row][column] = "0";
                                }
                            }
                            else {
                                table[row][column] = "-";
                            }
                        }
                        else {
                            table[row][column] = "-";
                        }
                        column++;
                    }
                    for (int k = 0; k < y.size(); k++) {
                        if (yNumbers[i] != null) {
                            int found = -1;
                            for (int z = 0; z < yNumbers[i].length; z++) {
                                if (y.get(k) == yNumbers[i][z]) {
                                    found = z;
                                }
                            }
                            if (found > -1) {
                                table[row][column] = "1";
                            }
                            else {
                                table[row][column] = "0";
                            }
                        }
                        else {
                            table[row][column] = "0";
                        }
                        column++;
                    }
                    for (int k = 0; k < stateCodes[j].length(); k++) {
                        table[row][column] = stateCodes[j].substring(k, k + 1);    
                        column++;
                    }
                    row++;
                }
            }
        }
    }

    public int getqStartIndex() {
        return qStartIndex;
    }

    public int getqCount() {
        return qCount;
    }

    public int getxStartIndex() {
        return xStartIndex;
    }

    public int getxCount() {
        return xCount;
    }

    public int getyStartIndex() {
        return yStartIndex;
    }

    public int getyCount() {
        return yCount;
    }

    public int getdStartIndex() {
        return dStartIndex;
    }

    public int getdCount() {
        return dCount;
    }

    public String[][] getTable() {
        return table;
    }

    public void writeToFile(File file) throws IOException {
        PrintWriter output = new PrintWriter(new FileWriter(file));
        int[] maxColumnLength = new int[table[0].length];
        for (int i = 0; i < table.length; i++) {
            for (int j = 0; j < table[i].length; j++) {
                if (table[i][j].length() > maxColumnLength[j]) {
                    maxColumnLength[j] = table[i][j].length();
                }
            }
        }
        for (int i = 0; i < table.length; i++) {
            for (int j = 0; j < table[i].length; j++) {
                int disparity = maxColumnLength[j] - table[i][j].length();
                output.print(table[i][j]);
                for (int k = 0; k < disparity; k++) {
                    output.print(" ");
                }
                output.print("\t");
            }
            output.println();
        }
        output.close();
    }

    public int getRowCount() {
        return table.length;
    }

    public int getColumnCount() {
        return table[0].length;
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
        return table[rowIndex][columnIndex];
    }
    
}
