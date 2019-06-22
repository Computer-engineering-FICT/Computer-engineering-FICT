package gsa;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 03.10.2010
 * Time: 12:24:35
 * To change this template use File | Settings | File Templates.
 */
public class GSAWorker {

    private int[] nodesType;
    private int[][] connectionMatrix;
    private int[][] signals;
    private int beginNode;
    private int endNode;
    private ArrayList<ArrayList<Integer>> waysNodes;
    private ArrayList<ArrayList<Integer>> loopsNodes;
    private ArrayList<String> ways;
    private ArrayList<String> loops;

    public GSAWorker(int[] nodesType, int[][] connectionMatrix, int[][] signals) {
        this.nodesType = nodesType;
        this.connectionMatrix = connectionMatrix;
        this.signals = signals;
    }

    private void step(int currentNode, ArrayList<Integer> wayNodes, boolean[] visitedNodes, String way) {
        if (currentNode == endNode) {
            wayNodes.add(currentNode);
            way = way + " -> E";
            visitedNodes[currentNode] = true;
            ways.add(way);
            waysNodes.add(wayNodes);
        } else {
            if (!visitedNodes[currentNode]) {
                wayNodes.add(currentNode);
                visitedNodes[currentNode] = true;
                way = way + " -> ";
                if (nodesType[currentNode] == 1) {
                    for (int i = 0; i < signals[currentNode].length; i++) {
                        way = way + "Y" + String.valueOf(signals[currentNode][i]);   
                    }
                } else {
                    if (nodesType[currentNode] == 2) {
                        way = way + "X" + String.valueOf(signals[currentNode][0]);
                    }
                }
                boolean findChild = false;
                int i = 0;
                while (((!findChild) || (nodesType[currentNode] == 2)) && (i < connectionMatrix[currentNode].length)) {
                    if (connectionMatrix[currentNode][i] > 0) {
                        ArrayList<Integer> wayNodesClone = new ArrayList<Integer>();
                        for (int j = 0; j < wayNodes.size(); j++) {
                            wayNodesClone.add(wayNodes.get(j));
                        }
                        boolean[] visitedNodesClone = new boolean[visitedNodes.length];
                        for (int j = 0; j < visitedNodes.length; j++) {
                            visitedNodesClone[j] = visitedNodes[j];
                        }
                        String wayClone = new String(way);
                        findChild = true;
                        step(i, wayNodesClone, visitedNodesClone, wayClone);
                    }
                    i++;
                }
            } else {
                wayNodes.add(currentNode);
                int i = -1;
                boolean found = false;
                while (!found)
                {
                    i++;
                    if (wayNodes.get(i) == currentNode) {
                        found = true;
                    }
                }
                ArrayList<Integer> loopNodes = new ArrayList<Integer> ();
                loopNodes.add(wayNodes.get(i));
                StringBuilder builder = new StringBuilder();
                if (nodesType[wayNodes.get(i)] == 1) {
                    for (int k = 0; k < signals[wayNodes.get(i)].length; k++) {
                        builder.append("Y");
                        builder.append(String.valueOf(signals[wayNodes.get(i)][k]));
                    }
                }
                else {
                    if (nodesType[wayNodes.get(i)] == 2) {
                        builder.append("X");
                        builder.append(String.valueOf(signals[wayNodes.get(i)][0]));
                    }
                }
                for (int j = i + 1; j < wayNodes.size(); j++) {
                    loopNodes.add(wayNodes.get(j));
                    builder.append(" -> ");
                    if (nodesType[wayNodes.get(j)] == 1) {
                        for (int k = 0; k < signals[wayNodes.get(j)].length; k++) {
                            builder.append("Y");
                            builder.append(String.valueOf(signals[wayNodes.get(j)][k]));
                        }
                    }
                    else {
                        if (nodesType[wayNodes.get(j)] == 2) {
                            builder.append("X");
                            builder.append(String.valueOf(signals[wayNodes.get(j)][0]));
                        }
                    }
                }
                loops.add(builder.toString());
                loopsNodes.add(loopNodes);
            }
        }
    }

    public void findWaysAndLoops() throws BeginEndNodesNotFoundException {
        boolean findBeginNode = false;
        boolean findEndNode = false;
        int i = 0;
        while (((!findBeginNode) || (!findEndNode)) && (i < nodesType.length)) {
            if (nodesType[i] == 0) {
                beginNode = i;
                findBeginNode = true;
            }
            if (nodesType[i] == 3) {
                endNode = i;
                findEndNode = true;
            }
            i++;
        }
        if ((!findBeginNode) && (!findEndNode)) {
            throw new BeginEndNodesNotFoundException(!findBeginNode, !findEndNode);
        }
        waysNodes = new ArrayList<ArrayList<Integer>>();
        loopsNodes = new ArrayList<ArrayList<Integer>>();
        ways = new ArrayList<String>();
        loops = new ArrayList<String>();
        int currentNode = beginNode;
        ArrayList<Integer> wayNodes = new ArrayList<Integer>();
        boolean[] visitedNodes = new boolean[nodesType.length];
        for (boolean e : visitedNodes) {
            e = false;
        }
        wayNodes.add(beginNode);
        visitedNodes[currentNode] = true;
        String way = "B";
        boolean findChild = false;
        i = 0;
        while ((!findChild) && (i < connectionMatrix[currentNode].length)) {
            if (connectionMatrix[currentNode][i] > 0) {
                ArrayList<Integer> wayNodesClone = new ArrayList<Integer>();
                for (int j = 0; j < wayNodes.size(); j++) {
                    wayNodesClone.add(wayNodes.get(j));
                }
                boolean[] visitedNodesClone = new boolean[visitedNodes.length];
                for (int j = 0; j < visitedNodes.length; j++) {
                    visitedNodesClone[j] = visitedNodes[j];
                }
                String wayClone = new String(way);
                findChild = true;
                step(i, wayNodesClone, visitedNodesClone, wayClone);
            }
            i++;
        }
    }

    public ArrayList<String> getWays() {
        return ways;
    }

    public ArrayList<String> getLoops() {
        return loops;
    }

    public ArrayList<ArrayList<Integer>> getWaysNodes() {
        return waysNodes;
    }

    public ArrayList<ArrayList<Integer>> getLoopsNodes() {
        return loopsNodes;
    }
    
}
