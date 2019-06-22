package com;

public class Transmission {
    private Task task_;
    private int weight_;
    public Transmission(Task task, int weight){
        task_ = task;
        weight_=weight;

    }
    public int getWeight(){
        return weight_;
    }
    public Task getNode(){
        return task_;


    }
}
