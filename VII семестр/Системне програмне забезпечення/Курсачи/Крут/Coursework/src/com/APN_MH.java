package com;

import java.util.*;


public class APN_MH {
    private Graph topologyGraph;
    private List<Link> links;
    private List<Processor> processors;
    private int P;
    private LinkedList<Processor>[][] routes;

    public APN_MH(Graph topologyGraph) {
        this.topologyGraph = topologyGraph;
        this.links = topologyGraph.getLinks();
        this.processors = topologyGraph.getProcessors();
        P = processors.size();
        Routing routing = new Routing(topologyGraph);
        routes = new LinkedList[P][P];

        for (int i = 0; i < P; i++) {
            routing.execute(processors.get(i));
            for (int j = 0; j < P; j++) {
                routes[i][j] = routing.getPath(processors.get(j));
            }
        }
    }

    public int[][] schedule(ArrayList<Task> tasks) {
        TreeSet<Task> readyTasks = new TreeSet<>(new Comparator<Task>() {
            @Override
            public int compare(Task o1, Task o2) {
                int priority = o1.getSL() - o2.getSL();
                if (priority == 0) {
                    priority = o1.getChildren().size() - o2.getChildren().size();
                    if (priority == 0) {
                        double r = Math.random();
                        if (r < 0.5) {
                            priority = -1;
                        }
                        else {
                            priority = 1;
                        }
                    }
                }
                return priority;
            }
        });

        for (Task taskTask : tasks) {
            taskTask.setSL(getSL(taskTask));

            if (taskTask.getParents().size() == 0) {
                readyTasks.add(taskTask);
            }
        }

        int[] timeStart = new int[tasks.size()];
        int[] timeEnd = new int[tasks.size()];
        int[] allocations = new int[tasks.size()];
        while (readyTasks.size() != 0) {
            Task taskToAllocate = readyTasks.pollLast();
            System.out.println(taskToAllocate.getID() + "\t" + taskToAllocate.getSL());
            ArrayList<Transmission> parents = taskToAllocate.getParents();
            ArrayList<LinkInterval> busyLinks = new ArrayList<>();

            int[] transmissionPeriod = {Integer.MAX_VALUE, Integer.MAX_VALUE};
            int processorChosen = -1;
            for (int i = 0; i < P; i++) {
                ArrayList<LinkInterval> busyLinksForProcessor = new ArrayList<>();
                int durationForProcessor = taskToAllocate.getWeight();
                int[] timeForProcessor  = processors.get(i).getFreeInterval(0, durationForProcessor);
                for (Transmission parent : parents) {
                    int parentTaskIndex = tasks.indexOf(parent.getNode());
                    int parentTaskProcessor = allocations[parentTaskIndex];
                    int timeForParent = timeEnd[parentTaskIndex];
                    if (parentTaskProcessor != i) {
                        int transmissionWeight = parent.getWeight();
                        LinkedList<Processor> path = routes[parentTaskProcessor][i];
                        Processor currentProcessor = topologyGraph.getProcessors().get(parentTaskProcessor);
                        for (int k = 1; k < path.size(); k++) {
                            Processor nextProcessor = path.get(k);
                            Link currentLink = links.get(links.indexOf(new Link(" ", currentProcessor, nextProcessor, 1)));
                            int[] intervalForEdge = currentLink.getTimeForLinkTransmission(timeForParent, transmissionWeight);
                            busyLinksForProcessor.add(new LinkInterval(currentLink, intervalForEdge));
                            timeForParent = intervalForEdge[1];
                            currentProcessor = nextProcessor;
                        }
                    }
                    if (timeForParent > timeForProcessor[0]) {
                        timeForProcessor = processors.get(i).getFreeInterval(timeForParent, durationForProcessor);
                    }
                }
                if (timeForProcessor[1] < transmissionPeriod[1]) {
                    transmissionPeriod = timeForProcessor;
                    processorChosen = i;
                    busyLinks = busyLinksForProcessor;
                }
            }
            timeStart[tasks.indexOf(taskToAllocate)] = transmissionPeriod[0];
            timeEnd[tasks.indexOf(taskToAllocate)] =  transmissionPeriod[1];
            allocations[tasks.indexOf(taskToAllocate)] = processorChosen;
            processors.get(processorChosen).setBusyInterval(transmissionPeriod);
            for (LinkInterval element: busyLinks) {
                element.link.setBusyInterval(element.interval);
                System.out.println(element + "\tзадача " + taskToAllocate.getID());
            }

            ArrayList<Transmission> children = taskToAllocate.getChildren();
            for (int j = 0; j < children.size(); j++) {
                Task child = children.get(j).getNode();
                if (child.setParentFinished() == 0) {
                    readyTasks.add(child);
                }
            }
        }
        int[][] result = {allocations, timeStart, timeEnd};
        return result;
    }


    private int getSL(Task N) {
        ArrayList<Transmission> children = N.getChildren();
        int res = 0;
        for (int i = 0; i < children.size(); i++) {
            int sl = getSL(children.get(i).getNode());
            if (sl > res) res = sl;
        }
        return res + N.getWeight();
    }

    private class LinkInterval {
        Link link;
        int[] interval;

        public LinkInterval(Link link, int[] interval) {
            this.link = link;
            this.interval = interval;
        }

        @Override
        public String toString() {
            return "Link " + link.toString() + "\t[" + (interval[0] + 1) + "-" + interval[1] + "]";
        }
    }
}
