package com.gantt.entity;

import java.util.LinkedList;
import java.util.List;

public class Processor {

    private List<Task> tasks;

    public Processor(List<Task> tasks) {
        this.tasks = tasks;
    }

    public Processor() {
        tasks = new LinkedList<Task>();
    }

    public void addTask(Task task) {
        tasks.add(task);
    }

    public Task getTask (int id) {
        return tasks.get(id);
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public int size() {
        return tasks.size();
    }
}
