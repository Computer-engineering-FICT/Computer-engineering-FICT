package com;

import java.util.Comparator;
import java.util.Iterator;
import java.util.TreeSet;

public class Processor {
    final private String id;
    final private String name;
    private int productivity = 1;
    TreeSet<int[]> busyTime = new TreeSet<>(new Comparator<int[]>() {

        @Override
        public int compare(int[] o1, int[] o2) {
            return o1[0] - o2[0];
        }
    });

    private static int countOfProcessors = 0;

    public Processor(int productivity) {
        this("P"+countOfProcessors, "P"+countOfProcessors, productivity);
    }

    public Processor(String id, String name) {
        this(id, name, 1);
    }

    public Processor(String id, String name, int productivity) {
        this.id = id;
        this.name = name;
        this.productivity = productivity;

        countOfProcessors += 1;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getProductivity() {
        return productivity;
    }

    public void setProductivity(int productivity) {
        this.productivity = productivity;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Processor other = (Processor) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

    public int[] getFreeInterval(int start, int duration) {

        int[] interval = {start, start + duration};
        for (Iterator<int[]> it = busyTime.iterator(); it.hasNext();) {
            int[] element = it.next();
            if ((element[0] - interval[0]) >= duration) {
                break;
            }
            else {
                interval[0] = (interval[0] > element[1]) ? interval[0]:element[1];
                interval[1] = interval[0] + duration;
            }
        }
        return  interval;
    }

    public void setBusyInterval(int[] interval) {
        busyTime.add(interval);
    }

    @Override
    public String toString() {
        return name;
    }

}