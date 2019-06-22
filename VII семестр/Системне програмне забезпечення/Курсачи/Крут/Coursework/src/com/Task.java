package com;

import java.util.ArrayList;

public class Task {
    private int id_;
    private int sl_;
    private int weight_;
    private int readyCtr = 0;
    private ArrayList<Transmission> in_=new ArrayList<Transmission>();
    private ArrayList<Transmission> out_=new ArrayList<Transmission>();
    public Task(int weight, int id){
        weight_=weight;
        id_=id;
    }
    public void setSL(int sl){

        sl_=sl;
    }
    public void addParent(Transmission c){

        in_.add(c);
        readyCtr++;
    }
    public void addChild(Transmission c){

        out_.add(c);
    }
    public ArrayList<Transmission> getParents(){
        return in_;

    }
    public ArrayList<Transmission> getChildren(){
        return out_;

    }
    public int setParentFinished(){
        return --readyCtr;
    }
    public int getWeight(){
        return weight_;
    }
    public int getSL(){
        return sl_;
    }
    public int getID(){
        return id_;

    }
}
