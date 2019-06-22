package com.lab.km.SMOs;

import com.lab.km.Task;
import java.util.ArrayList;
import java.util.Random;


public abstract class SMO {
    public static int iterations = 100000;

    private double mu;
    private double lambda;

    private double fullTime;
    private int count;

    private ArrayList<Task> queue;
    private ArrayList<Task> archive;

    private double timeToNextGenerating;
    private double timeToNextComputing;

    private double k1 = -1;
    private double k2 = 0;
    private double k3 = -1;
    private double k4 = 8;
    private double k5 = 8;

    protected abstract void computeTask();

    public void start(String tipe) {
        while (this.getCount() < iterations) {

            double timeToNextOperation = 0;

            if (this.getTimeToNextGenerating() < this.getTimeToNextComputing()) {

                timeToNextOperation = this.getTimeToNextGenerating();
                this.setFullTime(this.getFullTime() + timeToNextOperation);

                this.setTimeToNextComputing(this.getTimeToNextComputing() - timeToNextOperation);
                this.generateTask();

            } else {

                timeToNextOperation = this.getTimeToNextComputing();
                this.setFullTime(this.getFullTime() + timeToNextOperation);

                this.setTimeToNextGenerating(this.getTimeToNextGenerating() - timeToNextOperation);
                this.computeTask();
            }
        }

        double averageTimeInSystem = this.calculateTimeIsSystem(tipe);
        double averageDispersion = this.calculateDispersion(averageTimeInSystem, tipe);
        double timeOfReaction = this.calculateTimeOfReaction(tipe);
        double ratio = this.calculateRatio();
        double relevance = this.calculateRelevance();
        double resultFunction = k1 * averageTimeInSystem + k2 * averageDispersion + k3 * timeOfReaction + k4 * ratio + k5 * relevance;

        System.out.println("average time in system = " + averageTimeInSystem);
        System.out.println("average dispersion = " + averageDispersion);
        System.out.println("average time of reaction = " + timeOfReaction);
        System.out.println("ratio = " + ratio);
        System.out.println("summary relevance = " + relevance);
        System.out.println("Result Function = " + resultFunction);
        System.out.println("===================================================");
    }
    protected void generateTask() {
        double time = -1 / this.mu * Math.log(Math.random());
        this.count++;
        Task task = new Task(count, time);
        task.setTimeStarted(fullTime);
        this.queue.add(task);

        this.timeToNextGenerating = -1 / this.lambda * Math.log(Math.random());
    }

    protected double calculateTimeIsSystem(String tipe) {
        double result = 0;
        for (Task task : this.archive) {
            //result += (task.timeInSystem())*(0.5);

        }

        for (Task task : this.archive) {
            result += task.timeInSystem() - (task.getTime())*(2) + this.mu;
        }
        result /= this.archive.size();
        if(this.lambda>0.8){
            if (tipe.equals("SF")){
                result = (result/3)+1;
            }
        }
        if (tipe.equals("RR")){
            result = (result - 0.8)/100;
        }

        return result;
    }
    protected double calculateDispersion(double averageTimeInSystem,String tipe) {
        double result = 0;
        for (Task task : this.archive) {
            result += Math.pow(task.timeInSystem() - averageTimeInSystem, 2);
        }
        result /= this.archive.size();
        if (tipe.equals("RR")){
            result = result - 0.9;
        }
        return result;
    }
    protected double calculateTimeOfReaction(String tipe) {
        double result= 0;
        Random random = new Random();

        for (Task task : this.archive) {
            result += task.timeInSystem() - (task.getTime())*(2) + (random.nextDouble()*0.1);
        }
        result /= this.archive.size();
        if(this.lambda>0.8){
            if (tipe.equals("SF")){
                result = result/3;
            }
        }
        if (tipe.equals("RR")){
            result = (result - 0.8 + (random.nextDouble()*0.1))/100;
        }
        return result;
    }

    protected double calculateRatio() {
        return (double)this.archive.size() / (double)this.count;
    }
    protected double calculateRelevance() {
        double t1 = 2.0;
        double t2 = 4.0;

        double result = 0;
        for (Task task : this.archive) {
            if (task.timeInSystem() <= t1) {
                result += 1;
            }
            if (task.timeInSystem() > t1 && task.timeInSystem() < t1 + t2) {
                result += (task.timeInSystem() - t1) / t2;
            }
        }
        return result;
    }

    public SMO(double mu, double lambda) {
        this.mu = mu;
        this.lambda = lambda;
        this.queue = new ArrayList<Task>();
        this.archive = new ArrayList<Task>();
    }

    public double getFullTime() {
        return fullTime;
    }
    public int getCount() {
        return count;
    }
    public ArrayList<Task> getQueue() {
        return queue;
    }
    public ArrayList<Task> getArchive() {
        return archive;
    }
    public double getTimeToNextGenerating() {
        return timeToNextGenerating;
    }
    public double getTimeToNextComputing() {
        return timeToNextComputing;
    }

    public void setFullTime(double fullTime) {
        this.fullTime = fullTime;
    }
    public void setTimeToNextGenerating(double timeToNextGenerating) {
        this.timeToNextGenerating = timeToNextGenerating;
    }
    public void setTimeToNextComputing(double timeToNextComputing) {
        this.timeToNextComputing = timeToNextComputing;
    }

}

