package automat.moore;

import gsa.GSAModel;

import java.io.*;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 16.10.2010
 * Time: 14:16:11
 * To change this template use File | Settings | File Templates.
 */
public class MooreAutomat implements Serializable {

    protected String[] stateNames;
    protected int[][] yNumbers;
    protected int[][] connectionMatrix;
    protected int[][] xNumbers;
    protected boolean[][] xValues;

    public MooreAutomat() {
        stateNames = null;
        yNumbers = null;
        connectionMatrix = null;
        xNumbers = null;
        xValues = null;
    }

    public MooreAutomat(String[] stateNames, int[][] yNumbers, int[][] connectionMatrix, int[][] xNumbers, boolean[][] xValues) {
        this.stateNames = stateNames;
        this.yNumbers = yNumbers;
        this.connectionMatrix = connectionMatrix;
        this.xNumbers = xNumbers;
        this.xValues = xValues;
    }

    public MooreAutomat(GSAModel model) {
        int[] nodesType = model.getNodesType();
        int[][] nodesConnectionMatrix = model.getConnectionMatrix();
        int[][] signalMatrix = model.getSignalMatrix();
        int count = 0;
        for (int i = 0; i < nodesType.length; i++) {
            if (nodesType[i] == 2) {
                count++;
            }
        }
        stateNames = new String[nodesType.length - count - 1];
        connectionMatrix = new int[nodesType.length - count - 1][];
        for (int i = 0; i < connectionMatrix.length; i++) {
            connectionMatrix[i] = new int[nodesType.length - count - 1];
            for (int j = 0; j < connectionMatrix[i].length; j++) {
                connectionMatrix[i][j] = -1;
            }
        }
        yNumbers = new int[nodesType.length - count - 1][];
        int z1 = -1;
        int z = 2;
        int j = 0;
        for (int i = 0; i < nodesType.length; i++) {
            if (((nodesType[i] == 0) || (nodesType[i] == 3)) && (z1 == -1)) {
                z1 = j;
                stateNames[j] = "Z1";
                yNumbers[j] = null;
                j++;
            }
            else {
                if (nodesType[i] == 1) {
                    stateNames[j] = "Z" + String.valueOf(z++);
                    yNumbers[j] = new int[signalMatrix[i].length];
                    for (int k = 0; k < signalMatrix[i].length; k++) {
                        yNumbers[j][k] = signalMatrix[i][k];
                    }
                    j++;
                }
            }
        }
        xNumbers = null;
        xValues = null;
        for (int i = 0; i < nodesConnectionMatrix.length; i++) {
            if ((nodesType[i] == 0) || (nodesType[i] == 1)) {
                for (j = 0; j < nodesConnectionMatrix[i].length; j++) {
                    if (nodesType[j] == 1) {
                        if (nodesConnectionMatrix[i][j] > 0) {
                            int[][] newXNumbers;
                            if (xNumbers != null) {
                                newXNumbers = new int[xNumbers.length + 1][];
                                for (int x = 0; x < xNumbers.length; x++) {
                                    newXNumbers[x] = xNumbers[x];
                                }
                            }
                            else {
                                newXNumbers = new int[1][];
                            }
                            newXNumbers[newXNumbers.length - 1] = null;
                            xNumbers = newXNumbers;
                            boolean[][] newXValues;
                            if (xValues != null) {
                                newXValues = new boolean[xValues.length + 1][];
                                for (int x = 0; x < xValues.length; x++) {
                                    newXValues[x] = xValues[x];
                                }
                            } else {
                                newXValues = new boolean[1][];
                            }
                            newXValues[newXValues.length - 1] = null;
                            xValues = newXValues;
                            connectionMatrix[getStateNumber(nodesType, i)][getStateNumber(nodesType, j)] = xNumbers.length - 1;
                        }
                    }
                    else {
                        if (nodesType[j] == 3) {
                            if (nodesConnectionMatrix[i][j] > 0) {
                                int[][] newXNumbers;
                                if (xNumbers != null) {
                                    newXNumbers = new int[xNumbers.length + 1][];
                                    for (int x = 0; x < xNumbers.length; x++) {
                                        newXNumbers[x] = xNumbers[x];
                                    }
                                } else {
                                    newXNumbers = new int[1][];
                                }
                                newXNumbers[newXNumbers.length - 1] = null;
                                xNumbers = newXNumbers;
                                boolean[][] newXValues;
                                if (xValues != null) {
                                    newXValues = new boolean[xValues.length + 1][];
                                    for (int x = 0; x < xValues.length; x++) {
                                        newXValues[x] = xValues[x];
                                    }
                                } else {
                                    newXValues = new boolean[1][];
                                }
                                newXValues[newXValues.length - 1] = null;
                                xValues = newXValues;
                                connectionMatrix[getStateNumber(nodesType, i)][getStateNumber(nodesType, j)] = xNumbers.length - 1;
                            }
                        }
                        else {
                            if (nodesType[j] == 2) {
                                if (nodesConnectionMatrix[i][j] > 0) {
                                    int[] newXNumbers = null;
                                    boolean[] newXValues = null;
                                    stepToOperatorNode(getStateNumber(nodesType, i), j, newXNumbers, newXValues, nodesType, nodesConnectionMatrix, signalMatrix);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public static void writeToFile(File file, MooreAutomat automat) throws IOException {
        ObjectOutputStream output = new ObjectOutputStream(new FileOutputStream(file));
        output.writeObject(automat);
        output.close();
    }

    public static MooreAutomat readFromFile(File file) throws IOException, ClassNotFoundException {
        ObjectInputStream input = new ObjectInputStream(new FileInputStream(file));
        MooreAutomat automat = (MooreAutomat) input.readObject();
        input.close();
        return automat;
    }

    private void stepToOperatorNode(int start, int from, int[] stepXNumbers, boolean[] stepXValues, int[] nodesType,
                                    int[][] nodesConnectionMatrix, int[][] signalMatrix) {
        for (int i = 0; i < nodesConnectionMatrix[from].length; i++) {
            if (nodesConnectionMatrix[from][i] == 1) {
                int[] stepNewXNumbers;
                if (stepXNumbers != null) {
                    stepNewXNumbers = new int[stepXNumbers.length + 1];
                    for (int j = 0; j < stepXNumbers.length; j++) {
                        stepNewXNumbers[j] = stepXNumbers[j];
                    }
                } else {
                    stepNewXNumbers = new int[1];
                }
                stepNewXNumbers[stepNewXNumbers.length - 1] = signalMatrix[from][0];
                boolean[] stepNewXValues;
                if (stepXValues != null) {
                    stepNewXValues = new boolean[stepXValues.length + 1];
                    for (int j = 0; j < stepXValues.length; j++) {
                        stepNewXValues[j] = stepXValues[j];
                    }
                } else {
                    stepNewXValues = new boolean[1];
                }
                stepNewXValues[stepNewXValues.length - 1] = true;
                if (nodesType[i] == 2) {
                    stepToOperatorNode(start, i, stepNewXNumbers, stepNewXValues, nodesType, nodesConnectionMatrix, signalMatrix);
                } else {
                    int[][] newXNumbers;
                    if (xNumbers != null) {
                        newXNumbers = new int[xNumbers.length + 1][];
                        for (int j = 0; j < xNumbers.length; j++) {
                            newXNumbers[j] = xNumbers[j];
                        }
                    } else {
                        newXNumbers = new int[1][];
                    }
                    newXNumbers[newXNumbers.length - 1] = stepNewXNumbers;
                    xNumbers = newXNumbers;
                    boolean[][] newXValues;
                    if (xValues != null) {
                        newXValues = new boolean[xValues.length + 1][];
                        for (int j = 0; j < xValues.length; j++) {
                            newXValues[j] = xValues[j];
                        }
                    } else {
                        newXValues = new boolean[1][];
                    }
                    newXValues[newXValues.length - 1] = stepNewXValues;
                    xValues = newXValues;
                    connectionMatrix[start][getStateNumber(nodesType, i)] = newXNumbers.length - 1;
                }
            } else {
                if (nodesConnectionMatrix[from][i] == 2) {
                    int[] stepNewXNumbers;
                    if (stepXNumbers != null) {
                        stepNewXNumbers = new int[stepXNumbers.length + 1];
                        for (int j = 0; j < stepXNumbers.length; j++) {
                            stepNewXNumbers[j] = stepXNumbers[j];
                        }
                    } else {
                        stepNewXNumbers = new int[1];
                    }
                    stepNewXNumbers[stepNewXNumbers.length - 1] = signalMatrix[from][0];
                    boolean[] stepNewXValues;
                    if (stepXValues != null) {
                        stepNewXValues = new boolean[stepXValues.length + 1];
                        for (int j = 0; j < stepXValues.length; j++) {
                            stepNewXValues[j] = stepXValues[j];
                        }
                    } else {
                        stepNewXValues = new boolean[1];
                    }
                    stepNewXValues[stepNewXValues.length - 1] = false;
                    if (nodesType[i] == 2) {
                        stepToOperatorNode(start, i, stepNewXNumbers, stepNewXValues, nodesType, nodesConnectionMatrix, signalMatrix);
                    } else {
                        int[][] newXNumbers = new int[xNumbers.length + 1][];
                        for (int j = 0; j < xNumbers.length; j++) {
                            newXNumbers[j] = xNumbers[j];
                        }
                        newXNumbers[newXNumbers.length - 1] = stepNewXNumbers;
                        xNumbers = newXNumbers;
                        boolean[][] newXValues = new boolean[xValues.length + 1][];
                        for (int j = 0; j < xValues.length; j++) {
                            newXValues[j] = xValues[j];
                        }
                        newXValues[newXValues.length - 1] = stepNewXValues;
                        xValues = newXValues;
                        connectionMatrix[start][getStateNumber(nodesType, i)] = newXNumbers.length - 1;
                    }
                }
            }
        }
    }

    private int getStateNumber(int[] nodesType, int n) {
        int z1 = -1;
        int j = 0;
        for (int i = 0; i < n; i++) {
            if (nodesType[i] == 1) {
                j++;
            }
            else {
                if (((nodesType[i] == 0) || (nodesType[i] == 3)) && (z1 == -1)) {
                    z1 = j;
                    j++;
                }
            }
        }
        if ((nodesType[n] == 0) || (nodesType[n] == 3)) {
            if (z1 == -1) {
                return n;
            }
            else {
                return z1;
            }
        }
        else {
            return j;
        }
    }

    public String[] getStateNames() {
        return stateNames;
    }

    public int[][] getyNumbers() {
        return yNumbers;
    }

    public int[][] getConnectionMatrix() {
        return connectionMatrix;
    }

    public int[][] getxNumbers() {
        return xNumbers;
    }

    public boolean[][] getxValues() {
        return xValues;
    }
    
}
