package com;

        import java.util.*;

public class Link {
    private final String id;
    private final Processor source;
    private final Processor destination;
    private final int weight;
    TreeSet<int[]> busyTime = new TreeSet<>(new Comparator<int[]>() {

        @Override
        public int compare(int[] o1, int[] o2) {
            return o1[0] - o2[0];
        }
    });

    public Link(String id, Processor source, Processor destination, int weight) {
        this.id = id;
        this.source = source;
        this.destination = destination;
        this.weight = weight;
    }

    public String getId() {
        return id;
    }
    public Processor getDestination() {
        return destination;
    }

    public Processor getSource() {
        return source;
    }
    public int getWeight() {
        return weight;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Link other = (Link) obj;
        if (!source.equals(other.getSource()) ||  !destination.equals(other.getDestination()))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return source + "-" + destination;
    }

    public int[] getTimeForLinkTransmission(int startTime, int duration) {
        int[] interval = {startTime, startTime + duration};
        NavigableSet<int[]> times = new TreeSet<>();
        try {
            times = busyTime.headSet(busyTime.higher(interval), false);
        }
        catch (Exception e) {
            times = busyTime;
        }

        for (Iterator<int[]> it = times.descendingIterator(); it.hasNext();) {
            int[] element = it.next();
            if (element[0] <= startTime && element[1] > startTime) {
                interval[0] = element[1];
                interval[1] = interval[0] + duration;
            }
        }
        return  interval;
    }

    public void setBusyInterval(int[] interval) {
        busyTime.add(interval);
    }
}