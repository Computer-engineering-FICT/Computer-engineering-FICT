package com.gantt.entity;

public class Model {
    private Processor[] processors;

    public Model(int procQuantity){
        processors = new Processor[procQuantity];
        for(int i=0; i<procQuantity; i++) {
            processors[i]=new Processor();
        }
    }

    public Processor getProcessor(int id) {
        return processors[id];
    }
}
