package scheduler;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 27.12.10
 * Time: 17:25
 * To change this template use File | Settings | File Templates.
 */
public class Scheduler {

    private static int STEP_COUNT = 30;
    private static double CROSS_PROBABILITY = 0.5;
    private static double MUTATION_PROBABILITY = 0.05;
    private static int POPULATION_STEP = 10;
    private static int BEST_GENOTYPE_NOT_CHANGED_MAX_COUNT = 5;

    private int processorCount;
    private int channelCount;
    private int populationSize;

    public Scheduler(int processorCount) {
        this.processorCount = processorCount;
        channelCount = processorCount - 1;
        populationSize = POPULATION_STEP * processorCount;
    }

    private ArrayList<Integer> getReadyTasks(int[][] connectionMatrix) {
        ArrayList<Integer> readyTasks = new ArrayList<Integer>();
        for (int i = 0; i < connectionMatrix[0].length; i++) {
            boolean ready = true;
            int j = 0;
            while ((ready) && (j < connectionMatrix.length)) {
                if (connectionMatrix[j][i] > 0) {
                    ready = false;
                }
                j++;
            }
            if (ready) {
                readyTasks.add(i);
            }
        }
        return readyTasks;
    }

    private boolean isAllTasksDone(int[] vertexWeight) {
        boolean result = true;
        int i = 0;
        while ((i < vertexWeight.length) && (result)) {
            if (vertexWeight[i] > 0) {
                result = false;
            }
            i++;
        }
        return result;
    }

    private ArrayList<Integer> getWay(int from, int to) {
        ArrayList<Integer> way = new ArrayList<Integer>();
        ArrayList<ArrayList<Integer>> allWays = new ArrayList<ArrayList<Integer>>();
        int waysCount = (processorCount + 1) / 2;
        int waysLength = (int) (Math.log(processorCount + 1) / Math.log(2));
        for (int i = 0; i < waysCount; i++) {
            allWays.add(new ArrayList<Integer>());
            for (int j = 0; j < waysLength; j++) {
                allWays.get(i).add(0);
            }
            allWays.get(i).set(0, 0);
        }
        int processorNumber = 1;
        int counter = 0;
        int counterEdge = waysCount / 2;
        for (int i = 0; i < (waysLength - 1); i++) {
            for (int j = 0; j < waysCount; j++) {
                allWays.get(j).set(i + 1, processorNumber);
                counter++;
                if (counter >= counterEdge) {
                    processorNumber++;
                    counter = 0;
                }
            }
            counterEdge /= 2;
        }
        int foundFrom = -1;
        int foundTo = -1;
        int fromIndex = -1;
        int toIndex = -1;
        int i = 0;
        while ((i < allWays.size()) && ((foundFrom < 0) || (foundTo < 0))) {
            for (int j = 0; j < allWays.get(i).size(); j++) {
                if (allWays.get(i).get(j) == from) {
                    foundFrom = i;
                    fromIndex = j;
                }
                if (allWays.get(i).get(j) == to) {
                    foundTo = i;
                    toIndex = j;
                }
            }
            i++;
        }
        if (foundFrom == foundTo) {
            if (fromIndex < toIndex) {
                for (int j = fromIndex; j <= toIndex; j++) {
                    way.add(allWays.get(foundFrom).get(j));
                }
            }
            else {
                for (int j = fromIndex; j >= toIndex; j--) {
                    way.add(allWays.get(foundFrom).get(j));
                }
            }
        }
        else {
            for (int j = fromIndex; j > 0; j--) {
                way.add(allWays.get(foundFrom).get(j));
            }
            for (int j = 0; j <= toIndex; j++) {
                way.add(allWays.get(foundTo).get(j));
            }
        }
        return way;
    }

    private int getExecutionTime(ArrayList<Integer> processorNumbers, int[][] originalConnectionMatrix,
                                 int[] originalVertexWeight) {
        int[][] connectionMatrix = new int[originalConnectionMatrix.length][];
        for (int i = 0; i < connectionMatrix.length; i++) {
            connectionMatrix[i] = new int[originalConnectionMatrix[i].length];
            for (int j = 0; j < connectionMatrix[i].length; j++) {
                connectionMatrix[i][j] = originalConnectionMatrix[i][j];
            }
        }
        int[] vertexWeight = new int[originalVertexWeight.length];
        for (int i = 0; i < vertexWeight.length; i++) {
            vertexWeight[i] = originalVertexWeight[i];
        }
        int time = 0;
        boolean[] processorsStatus = new boolean[processorCount];
        for (boolean e : processorsStatus) {
            e = false;
        }
        int[] processorsTask = new int[processorCount];
        for (int e : processorsTask) {
            e = -1;
        }
        int[] channelProcessorFrom = new int[channelCount];
        int[] channelProcessorTo = new int[channelCount];
        int fromProcessor = 0;
        int tempCounter = 0;
        for (int j = 0; j < channelCount; j++) {
            channelProcessorFrom[j] = fromProcessor;
            channelProcessorTo[j] = j + 1;
            tempCounter++;
            if (tempCounter > 1) {
                tempCounter = 0;
                fromProcessor++;
            }
        }
        boolean[] channelsStatus = new boolean[channelCount];
        for (boolean e : channelsStatus) {
            e = false;
        }
        int[] channelFrom = new int[channelCount];
        for (int e : channelFrom) {
            e = -1;
        }
        int[] channelTo = new int[channelCount];
        for (int e : channelTo) {
            e = -1;
        }
        ArrayList<ArrayList<Boolean>> startNextTact = new ArrayList<ArrayList<Boolean>>();
        int[] channelTaskWeight = new int[channelCount];
        int[] channelTaskWeightBackup = new int[channelCount];
        ArrayList<ArrayList<Integer>> channelTaskWay = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> channelFromQueue = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> channelToQueue = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<ArrayList<Integer>>> channelWayQueue = new ArrayList<ArrayList<ArrayList<Integer>>>();
        ArrayList<ArrayList<Integer>> channelWeightQueue = new ArrayList<ArrayList<Integer>>();
        for (int i = 0; i < channelCount; i++) {
            startNextTact.add(new ArrayList<Boolean>());
            channelTaskWeight[i] = -1;
            channelTaskWay.add(new ArrayList<Integer>());
            channelFromQueue.add(new ArrayList<Integer>());
            channelToQueue.add(new ArrayList<Integer>());
            channelWayQueue.add(new ArrayList<ArrayList<Integer>>());
            channelWeightQueue.add(new ArrayList<Integer>());
        }
        while (!isAllTasksDone(vertexWeight)) {
            for (int i = 0; i < channelCount; i++) {
                for (int j = 0; j < startNextTact.get(i).size(); j++) {
                    startNextTact.get(i).set(j, false);
                }
            }
            ArrayList<Integer> readyTasks = getReadyTasks(connectionMatrix);
            for (int i = 0; i < readyTasks.size(); i++) {
                if (vertexWeight[readyTasks.get(i)] > 0) {
                    if (!processorsStatus[processorNumbers.get(readyTasks.get(i))]) {
                        processorsStatus[processorNumbers.get(readyTasks.get(i))] = true;
                        processorsTask[processorNumbers.get(readyTasks.get(i))] = readyTasks.get(i);
                    }
                }
            }
            for (int i = 0; i < processorCount; i++) {
                if (processorsStatus[i]) {
                    vertexWeight[processorsTask[i]]--;
                    if (vertexWeight[processorsTask[i]] == 0) {
                        for (int j = 0; j < connectionMatrix[processorsTask[i]].length; j++) {
                            if (connectionMatrix[processorsTask[i]][j] > 0) {
                                if (processorNumbers.get(j) != i) {
                                    ArrayList<Integer> way = getWay(i, processorNumbers.get(j));
                                    int channelNumber = -1;
                                    int k = 0;
                                    while ((channelNumber < 0) && (k < channelCount)) {
                                        if (((channelProcessorFrom[k] == way.get(0)) && (channelProcessorTo[k] == way.get(1))) ||
                                                ((channelProcessorTo[k] == way.get(0)) && (channelProcessorFrom[k] == way.get(1)))) {
                                            channelNumber = k;
                                        }
                                        k++;
                                    }
                                    channelFromQueue.get(channelNumber).add(processorsTask[i]);
                                    channelToQueue.get(channelNumber).add(j);
                                    channelWayQueue.get(channelNumber).add(way);
                                    channelWeightQueue.get(channelNumber).add(connectionMatrix[processorsTask[i]][j]);
                                    startNextTact.get(channelNumber).add(true);
                                }
                                else {
                                    connectionMatrix[processorsTask[i]][j] = 0;
                                }
                            }
                        }
                        processorsStatus[i] = false;
                    }
                }
            }
            for (int i = 0; i < channelCount; i++) {
                if (channelsStatus[i]) {
                    channelTaskWeight[i]--;
                    if (channelTaskWeight[i] == 0) {
                        if ((channelProcessorTo[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1)) ||
                                (channelProcessorFrom[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1))) {
                            connectionMatrix[channelFrom[i]][channelTo[i]] = 0;
                        }
                        else {
                            ArrayList<Integer> nextTaskWay = new ArrayList<Integer>();
                            for (int l = 1; l < channelTaskWay.get(i).size(); l++) {
                                nextTaskWay.add(channelTaskWay.get(i).get(l));
                            }
                            int channelNumber = -1;
                            int k = 0;
                            while ((channelNumber < 0) && (k < channelCount)) {
                                if (((channelProcessorFrom[k] == nextTaskWay.get(0)) &&
                                        (channelProcessorTo[k] == nextTaskWay.get(1))) ||
                                        ((channelProcessorTo[k] == nextTaskWay.get(0)) &&
                                                (channelProcessorFrom[k] == nextTaskWay.get(1)))) {
                                    channelNumber = k;
                                }
                                k++;
                            }
                            channelFromQueue.get(channelNumber).add(channelFrom[i]);
                            channelToQueue.get(channelNumber).add(channelTo[i]);
                            channelWayQueue.get(channelNumber).add(nextTaskWay);
                            channelWeightQueue.get(channelNumber).add(channelTaskWeightBackup[i]);
                            channelTaskWeightBackup[i] = 0;
                            startNextTact.get(channelNumber).add(true);
                        }
                        channelsStatus[i] = false;
                    }
                }
                else {
                    if (!channelWeightQueue.get(i).isEmpty()) {
                        if (!startNextTact.get(i).get(0)) {
                            startNextTact.get(i).remove(0);
                            channelFrom[i] = channelFromQueue.get(i).get(0);
                            channelFromQueue.get(i).remove(0);
                            channelTo[i] = channelToQueue.get(i).get(0);
                            channelToQueue.get(i).remove(0);
                            channelTaskWay.set(i, channelWayQueue.get(i).get(0));
                            channelWayQueue.get(i).remove(0);
                            channelTaskWeight[i] = channelWeightQueue.get(i).get(0);
                            channelTaskWeightBackup[i] = channelWeightQueue.get(i).get(0);
                            channelWeightQueue.get(i).remove(0);
                            channelsStatus[i] = true;
                            channelTaskWeight[i]--;
                            if (channelTaskWeight[i] == 0) {
                                if ((channelProcessorTo[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1)) ||
                                        (channelProcessorFrom[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1))) {
                                    connectionMatrix[channelFrom[i]][channelTo[i]] = 0;
                                }
                                else {
                                    ArrayList<Integer> nextTaskWay = new ArrayList<Integer>();
                                    for (int l = 1; l < channelTaskWay.get(i).size(); l++) {
                                        nextTaskWay.add(channelTaskWay.get(i).get(l));
                                    }
                                    int channelNumber = -1;
                                    int k = 0;
                                    while ((channelNumber < 0) && (k < channelCount)) {
                                        if (((channelProcessorFrom[k] == nextTaskWay.get(0)) &&
                                                (channelProcessorTo[k] == nextTaskWay.get(1))) ||
                                                ((channelProcessorTo[k] == nextTaskWay.get(0)) &&
                                                        (channelProcessorFrom[k] == nextTaskWay.get(1)))) {
                                            channelNumber = k;
                                        }
                                        k++;
                                    }
                                    channelFromQueue.get(channelNumber).add(channelFrom[i]);
                                    channelToQueue.get(channelNumber).add(channelTo[i]);
                                    channelWayQueue.get(channelNumber).add(nextTaskWay);
                                    channelWeightQueue.get(channelNumber).add(channelTaskWeightBackup[i]);
                                    channelTaskWeightBackup[i] = 0;
                                    startNextTact.get(channelNumber).add(true);
                                }
                                channelsStatus[i] = false;
                            }
                        }
                    }
                }
            }
            time++;
        }
        return time;
    }

    private void fillTable(ArrayList<Integer> processorNumbers, int[][] originalConnectionMatrix, int[] originalVertexWeight,
                           String[] vertexNames, GanttTableModel model) {
        int[][] connectionMatrix = new int[originalConnectionMatrix.length][];
        for (int i = 0; i < connectionMatrix.length; i++) {
            connectionMatrix[i] = new int[originalConnectionMatrix[i].length];
            for (int j = 0; j < connectionMatrix[i].length; j++) {
                connectionMatrix[i][j] = originalConnectionMatrix[i][j];
            }
        }
        int[] vertexWeight = new int[originalVertexWeight.length];
        for (int i = 0; i < vertexWeight.length; i++) {
            vertexWeight[i] = originalVertexWeight[i];
        }
        int time = 0;
        boolean[] processorsStatus = new boolean[processorCount];
        for (boolean e : processorsStatus) {
            e = false;
        }
        int[] processorsTask = new int[processorCount];
        for (int e : processorsTask) {
            e = -1;
        }
        int[] channelProcessorFrom = new int[channelCount];
        int[] channelProcessorTo = new int[channelCount];
        int fromProcessor = 0;
        int tempCounter = 0;
        for (int j = 0; j < channelCount; j++) {
            channelProcessorFrom[j] = fromProcessor;
            channelProcessorTo[j] = j + 1;
            tempCounter++;
            if (tempCounter > 1) {
                tempCounter = 0;
                fromProcessor++;
            }
        }
        boolean[] channelsStatus = new boolean[channelCount];
        for (boolean e : channelsStatus) {
            e = false;
        }
        int[] channelFrom = new int[channelCount];
        for (int e : channelFrom) {
            e = -1;
        }
        int[] channelTo = new int[channelCount];
        for (int e : channelTo) {
            e = -1;
        }
        ArrayList<ArrayList<Boolean>> startNextTact = new ArrayList<ArrayList<Boolean>>();
        int[] channelTaskWeight = new int[channelCount];
        int[] channelTaskWeightBackup = new int[channelCount];
        ArrayList<ArrayList<Integer>> channelTaskWay = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> channelFromQueue = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> channelToQueue = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<ArrayList<Integer>>> channelWayQueue = new ArrayList<ArrayList<ArrayList<Integer>>>();
        ArrayList<ArrayList<Integer>> channelWeightQueue = new ArrayList<ArrayList<Integer>>();
        for (int i = 0; i < channelCount; i++) {
            startNextTact.add(new ArrayList<Boolean>());
            channelTaskWeight[i] = -1;
            channelTaskWay.add(new ArrayList<Integer>());
            channelFromQueue.add(new ArrayList<Integer>());
            channelToQueue.add(new ArrayList<Integer>());
            channelWayQueue.add(new ArrayList<ArrayList<Integer>>());
            channelWeightQueue.add(new ArrayList<Integer>());
        }
        while (!isAllTasksDone(vertexWeight)) {
            for (int i = 0; i < channelCount; i++) {
                for (int j = 0; j < startNextTact.get(i).size(); j++) {
                    startNextTact.get(i).set(j, false);
                }
            }
            String[] newRow = new String[processorCount + channelCount + 1];
            newRow[0] = String.valueOf(time);
            ArrayList<Integer> readyTasks = getReadyTasks(connectionMatrix);
            for (int i = 0; i < readyTasks.size(); i++) {
                if (vertexWeight[readyTasks.get(i)] > 0) {
                    if (!processorsStatus[processorNumbers.get(readyTasks.get(i))]) {
                        processorsStatus[processorNumbers.get(readyTasks.get(i))] = true;
                        processorsTask[processorNumbers.get(readyTasks.get(i))] = readyTasks.get(i);
                    }
                }
            }
            for (int i = 0; i < processorCount; i++) {
                if (processorsStatus[i]) {
                    newRow[i + 1] = vertexNames[processorsTask[i]];
                    vertexWeight[processorsTask[i]]--;
                    if (vertexWeight[processorsTask[i]] == 0) {
                        for (int j = 0; j < connectionMatrix[processorsTask[i]].length; j++) {
                            if (connectionMatrix[processorsTask[i]][j] > 0) {
                                if (processorNumbers.get(j) != i) {
                                    ArrayList<Integer> way = getWay(i, processorNumbers.get(j));
                                    int channelNumber = -1;
                                    int k = 0;
                                    while ((channelNumber < 0) && (k < channelCount)) {
                                        if (((channelProcessorFrom[k] == way.get(0)) && (channelProcessorTo[k] == way.get(1))) ||
                                                ((channelProcessorTo[k] == way.get(0)) && (channelProcessorFrom[k] == way.get(1)))) {
                                            channelNumber = k;
                                        }
                                        k++;
                                    }
                                    channelFromQueue.get(channelNumber).add(processorsTask[i]);
                                    channelToQueue.get(channelNumber).add(j);
                                    channelWayQueue.get(channelNumber).add(way);
                                    channelWeightQueue.get(channelNumber).add(connectionMatrix[processorsTask[i]][j]);
                                    startNextTact.get(channelNumber).add(true);
                                }
                                else {
                                    connectionMatrix[processorsTask[i]][j] = 0;
                                }
                            }
                        }
                        processorsStatus[i] = false;
                    }
                }
            }
            for (int i = 0; i < channelCount; i++) {
                if (channelsStatus[i]) {
                    StringBuilder builder = new StringBuilder();
                    builder.append(vertexNames[channelFrom[i]]);
                    builder.append(" -> ");
                    builder.append(vertexNames[channelTo[i]]);
                    newRow[i + processorCount + 1] = builder.toString();
                    channelTaskWeight[i]--;
                    if (channelTaskWeight[i] == 0) {
                        if ((channelProcessorTo[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1)) ||
                                (channelProcessorFrom[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1))) {
                            connectionMatrix[channelFrom[i]][channelTo[i]] = 0;
                        }
                        else {
                            ArrayList<Integer> nextTaskWay = new ArrayList<Integer>();
                            for (int l = 1; l < channelTaskWay.get(i).size(); l++) {
                                nextTaskWay.add(channelTaskWay.get(i).get(l));
                            }
                            int channelNumber = -1;
                            int k = 0;
                            while ((channelNumber < 0) && (k < channelCount)) {
                                if (((channelProcessorFrom[k] == nextTaskWay.get(0)) &&
                                        (channelProcessorTo[k] == nextTaskWay.get(1))) ||
                                        ((channelProcessorTo[k] == nextTaskWay.get(0)) &&
                                                (channelProcessorFrom[k] == nextTaskWay.get(1)))) {
                                    channelNumber = k;
                                }
                                k++;
                            }
                            channelFromQueue.get(channelNumber).add(channelFrom[i]);
                            channelToQueue.get(channelNumber).add(channelTo[i]);
                            channelWayQueue.get(channelNumber).add(nextTaskWay);
                            channelWeightQueue.get(channelNumber).add(channelTaskWeightBackup[i]);
                            channelTaskWeightBackup[i] = 0;
                            startNextTact.get(channelNumber).add(true);
                        }
                        channelsStatus[i] = false;
                    }
                }
                else {
                    if (!channelWeightQueue.get(i).isEmpty()) {
                        if (!startNextTact.get(i).get(0)) {
                            startNextTact.get(i).remove(0);
                            channelFrom[i] = channelFromQueue.get(i).get(0);
                            channelFromQueue.get(i).remove(0);
                            channelTo[i] = channelToQueue.get(i).get(0);
                            channelToQueue.get(i).remove(0);
                            channelTaskWay.set(i, channelWayQueue.get(i).get(0));
                            channelWayQueue.get(i).remove(0);
                            channelTaskWeight[i] = channelWeightQueue.get(i).get(0);
                            channelTaskWeightBackup[i] = channelWeightQueue.get(i).get(0);
                            channelWeightQueue.get(i).remove(0);
                            channelsStatus[i] = true;
                            StringBuilder builder = new StringBuilder();
                            builder.append(vertexNames[channelFrom[i]]);
                            builder.append(" -> ");
                            builder.append(vertexNames[channelTo[i]]);
                            newRow[i + processorCount + 1] = builder.toString();
                            channelTaskWeight[i]--;
                            if (channelTaskWeight[i] == 0) {
                                if ((channelProcessorTo[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1)) ||
                                        (channelProcessorFrom[i] == channelTaskWay.get(i).get(channelTaskWay.get(i).size() - 1))) {
                                    connectionMatrix[channelFrom[i]][channelTo[i]] = 0;
                                }
                                else {
                                    ArrayList<Integer> nextTaskWay = new ArrayList<Integer>();
                                    for (int l = 1; l < channelTaskWay.get(i).size(); l++) {
                                        nextTaskWay.add(channelTaskWay.get(i).get(l));
                                    }
                                    int channelNumber = -1;
                                    int k = 0;
                                    while ((channelNumber < 0) && (k < channelCount)) {
                                        if (((channelProcessorFrom[k] == nextTaskWay.get(0)) &&
                                                (channelProcessorTo[k] == nextTaskWay.get(1))) ||
                                                ((channelProcessorTo[k] == nextTaskWay.get(0)) &&
                                                        (channelProcessorFrom[k] == nextTaskWay.get(1)))) {
                                            channelNumber = k;
                                        }
                                        k++;
                                    }
                                    channelFromQueue.get(channelNumber).add(channelFrom[i]);
                                    channelToQueue.get(channelNumber).add(channelTo[i]);
                                    channelWayQueue.get(channelNumber).add(nextTaskWay);
                                    channelWeightQueue.get(channelNumber).add(channelTaskWeightBackup[i]);
                                    channelTaskWeightBackup[i] = 0;
                                    startNextTact.get(channelNumber).add(true);
                                }
                                channelsStatus[i] = false;
                            }
                        }
                    }
                }
            }
            model.addRow(newRow);
            time++;
        }
    }

    private void sortPopulation(ArrayList<int[]> population, ArrayList<Integer> populationTime) {
        for (int i = 0; i < populationTime.size() - 1; i++) {
            int minTimeIndex = i;
            for (int j = i + 1; j < populationTime.size(); j++) {
                if (populationTime.get(j) < populationTime.get(minTimeIndex)) {
                    minTimeIndex = j;
                }
            }
            if (minTimeIndex != i) {
                int tempTime = populationTime.get(i);
                int[] tempPopulation = population.get(i);
                populationTime.set(i, populationTime.get(minTimeIndex));
                population.set(i, population.get(minTimeIndex));
                populationTime.set(minTimeIndex, tempTime);
                population.set(minTimeIndex, tempPopulation);
            }
        }
    }

    private void removeClones(ArrayList<int[]> population, ArrayList<Integer> populationTime) {
        for (int i = 0; i < population.size() - 1; i++) {
            for (int j = i + 1; j < population.size(); j++) {
                boolean isClone = true;
                int k = 0;
                while ((isClone) && (k < population.get(j).length)) {
                    if (population.get(j)[k] != population.get(i)[k]) {
                        isClone = false;
                    }
                    k++;
                }
                if (isClone) {
                    population.remove(j);
                    populationTime.remove(j);
                }
            }
        }
    }

    public GanttTableModel loadGraph(int[][] connectionMatrix, int[] vertexWeights, String[] vertexNames) {
        GanttTableModel tableModel = new GanttTableModel(processorCount + channelCount + 1);
        String[] columnNamesRow = new String[processorCount + channelCount + 1];
        columnNamesRow[0] = "Такт";
        int i = 1;
        for (int j = 0; j < processorCount; j++) {
            StringBuilder builder = new StringBuilder();
            builder.append("Процессор ");
            builder.append(String.valueOf(j));
            columnNamesRow[i] = builder.toString();
            i++;
        }
        int fromProcessor = 0;
        int tempCounter = 0;
        for (int j = 0; j < channelCount; j++) {
            StringBuilder builder = new StringBuilder();
            builder.append("Канал ");
            builder.append(String.valueOf(fromProcessor));
            builder.append("-");
            builder.append(String.valueOf(j + 1));
            columnNamesRow[i] = builder.toString();
            i++;
            tempCounter++;
            if (tempCounter > 1) {
                tempCounter = 0;
                fromProcessor++;
            }
        }
        tableModel.addColumnNamesRow(columnNamesRow);
        ArrayList<Integer> theBestGenotype = null;
        int theBestTime = Integer.MAX_VALUE;
        for (int x = 0; x < STEP_COUNT; x++) {
            ArrayList<int[]> population = new ArrayList<int[]>();
            ArrayList<Integer> populationTime = new ArrayList<Integer>();
            for (int j = 0; j < populationSize; j++) {
                int[] newGenotype = new int[vertexNames.length];
                for (int k = 0; k < newGenotype.length; k++) {
                    int randomValue = (int) (Math.random() * 1000);
                    int step = 1000 / processorCount;
                    int processorNumber = (randomValue / step);
                    while (processorNumber >= processorCount) {
                        processorNumber--;
                    }
                    newGenotype[k] = processorNumber;
                }

                population.add(newGenotype);
                ArrayList<Integer> newGenotypeList = new ArrayList<Integer>();
                for (int k = 0; k < newGenotype.length; k++) {
                    newGenotypeList.add(newGenotype[k]);
                }
                populationTime.add(getExecutionTime(newGenotypeList, connectionMatrix, vertexWeights));
            }
            sortPopulation(population, populationTime);
            int[] bestGenotype = population.get(0);
            int bestTime = populationTime.get(0);
            int bestGenotypeNotChangedCount = 0;
            do {
                for (int j = 0; j < populationSize; j++) {
                    int randomValue = (int) (Math.random() * 1000);
                    int populationStep = 1000 / populationSize;
                    int crossIndex = randomValue / populationStep;
                    if (crossIndex == j) {
                        if (j > 0) {
                            crossIndex--;
                        } else {
                            crossIndex++;
                        }
                    }
                    while (crossIndex >= population.size()) {
                        crossIndex--;
                    }
                    int[] newGenotype = new int[population.get(j).length];
                    for (int k = 0; k < population.get(j).length; k++) {
                        double randomValueDounle = Math.random();
                        if (randomValueDounle >= CROSS_PROBABILITY) {
                            newGenotype[k] = population.get(j)[k];
                        } else {
                            newGenotype[k] = population.get(crossIndex)[k];
                        }
                    }
                    population.add(newGenotype);
                    ArrayList<Integer> newGenotypeList = new ArrayList<Integer>();
                    for (int k = 0; k < newGenotype.length; k++) {
                        newGenotypeList.add(newGenotype[k]);
                    }
                    populationTime.add(getExecutionTime(newGenotypeList, connectionMatrix, vertexWeights));
                }
                for (int j = 0; j < populationSize; j++) {
                    int[] newGenotype = new int[population.get(j).length];
                    for (int k = 0; k < population.get(j).length; k++) {
                        double randomValue = Math.random();
                        if (randomValue < MUTATION_PROBABILITY) {
                            int randomValueInt = (int) (Math.random() * 1000);
                            int step = 1000 / processorCount;
                            int processorNumber = (randomValueInt / step);
                            while (processorNumber >= processorCount) {
                                processorNumber--;
                            }
                            newGenotype[k] = processorNumber;
                        } else {
                            newGenotype[k] = population.get(j)[k];
                        }
                    }
                    population.add(newGenotype);
                    ArrayList<Integer> newGenotypeList = new ArrayList<Integer>();
                    for (int k = 0; k < newGenotype.length; k++) {
                        newGenotypeList.add(newGenotype[k]);
                    }
                    populationTime.add(getExecutionTime(newGenotypeList, connectionMatrix, vertexWeights));
                }
                removeClones(population, populationTime);
                sortPopulation(population, populationTime);
                for (int j = population.size() - 1; j >= populationSize; j--) {
                    population.remove(j);
                    populationTime.remove(j);
                }
                boolean isBestChanged = false;
                int j = 0;
                while ((!isBestChanged) && (j < population.get(0).length)) {
                    if (population.get(0)[j] != bestGenotype[j]) {
                        isBestChanged = true;
                    }
                    j++;
                }
                if (isBestChanged) {
                    bestGenotype = population.get(0);
                    bestTime = populationTime.get(0);
                    bestGenotypeNotChangedCount = 0;
                } else {
                    bestGenotypeNotChangedCount++;
                }
            }
            while (bestGenotypeNotChangedCount < BEST_GENOTYPE_NOT_CHANGED_MAX_COUNT);
            if (bestTime < theBestTime) {
                ArrayList<Integer> bestGenotypeList = new ArrayList<Integer>();
                for (int k = 0; k < bestGenotype.length; k++) {
                    bestGenotypeList.add(bestGenotype[k]);
                }
                theBestGenotype = bestGenotypeList;
                theBestTime = bestTime;
            }
        }
        fillTable(theBestGenotype, connectionMatrix, vertexWeights, vertexNames, tableModel);
        return tableModel;
    }

}
