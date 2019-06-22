package com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Routing {

    private final List<Processor> nodes;
    private final List<Link> links;
    private Set<Processor> settledNodes;
    private Set<Processor> unSettledNodes;
    private Map<Processor, Processor> predecessors;
    private Map<Processor, Integer> distance;

    public Routing(Graph graph) {
        // create a copy of the array so that we can operate on this array
        this.nodes = new ArrayList<Processor>(graph.getProcessors());
        this.links = new ArrayList<Link>(graph.getLinks());
    }

    public void execute(Processor source) {
        settledNodes = new HashSet<Processor>();
        unSettledNodes = new HashSet<Processor>();
        distance = new HashMap<Processor, Integer>();
        predecessors = new HashMap<Processor, Processor>();
        distance.put(source, 0);
        unSettledNodes.add(source);
        while (unSettledNodes.size() > 0) {
            Processor node = getMinimum(unSettledNodes);
            settledNodes.add(node);
            unSettledNodes.remove(node);
            findMinimalDistances(node);
        }
    }

    private void findMinimalDistances(Processor node) {
        List<Processor> adjacentNodes = getNeighbors(node);
        for (Processor target : adjacentNodes) {
            if (getShortestDistance(target) > getShortestDistance(node)
                    + getDistance(node, target)) {
                distance.put(target, getShortestDistance(node)
                        + getDistance(node, target));
                predecessors.put(target, node);
                unSettledNodes.add(target);
            }
        }

    }

    private int getDistance(Processor node, Processor target) {
        for (Link link : links) {
            if (link.getSource().equals(node)
                    && link.getDestination().equals(target)) {
                return link.getWeight();
            }
        }
        throw new RuntimeException("Should not happen");
    }

    private List<Processor> getNeighbors(Processor node) {
        List<Processor> neighbors = new ArrayList<Processor>();
        for (Link link : links) {
            if (link.getSource().equals(node)
                    && !isSettled(link.getDestination())) {
                neighbors.add(link.getDestination());
            }
        }
        return neighbors;
    }

    private Processor getMinimum(Set<Processor> processors) {
        Processor minimum = null;
        for (Processor processor : processors) {
            if (minimum == null) {
                minimum = processor;
            } else {
                if (getShortestDistance(processor) < getShortestDistance(minimum)) {
                    minimum = processor;
                }
            }
        }
        return minimum;
    }

    private boolean isSettled(Processor processor) {
        return settledNodes.contains(processor);
    }

    private int getShortestDistance(Processor destination) {
        Integer d = distance.get(destination);
        if (d == null) {
            return Integer.MAX_VALUE;
        } else {
            return d;
        }
    }

    /*
     * This method returns the path from the source to the selected target and
     * NULL if no path exists
     */
    public LinkedList<Processor> getPath(Processor target) {
        LinkedList<Processor> path = new LinkedList<Processor>();
        Processor step = target;
        // check if a path exists
        if (predecessors.get(step) == null) {
            return null;
        }
        path.add(step);
        while (predecessors.get(step) != null) {
            step = predecessors.get(step);
            path.add(step);
        }
        if (!path.getLast().equals(target)) {
            Collections.reverse(path);
        }
        return path;
    }

}
