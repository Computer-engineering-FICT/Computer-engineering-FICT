package com.lab.km;


public class Task {

    private int id;
    private double time;
    private double timeStarted;
    private double timeComputed;

    public String getTipe() {
        return tipe;
    }

    public void setTipe(String tipe) {
        this.tipe = tipe;
    }

    private String tipe;

    private double timeInSystem;

    public Task(int id, double time) {
        this.id = id;
        this.time = time;
    }

    public double timeInSystem () {
        this.timeInSystem = timeComputed - timeStarted + this.time;
        return timeInSystem;
    }

    public double getTime() {
        return time;
    }

    public void setTimeStarted(double timeStarted) {
        this.timeStarted = timeStarted;
    }

    public void setTimeComputed(double timeComputed) {
        this.timeComputed = timeComputed;
    }

    public void setTime(double time) {
        this.time = time;
    }
}
