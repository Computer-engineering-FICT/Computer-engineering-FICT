package com.gantt.entity;

public class Task {

    private int number;
    private int entryTime;
    private int exitTime;

    public Task(int number, int entryTime, int exitTime) {
        this.number = number;
        this.entryTime = entryTime;
        this.exitTime = exitTime;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(int entryTime) {
        this.entryTime = entryTime;
    }

    public int getExitTime() {
        return exitTime;
    }

    public void setExitTime(int exitTime) {
        this.exitTime = exitTime;
    }
}
