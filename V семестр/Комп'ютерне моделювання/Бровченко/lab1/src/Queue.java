import java.util.LinkedList;

public class Queue {
    double modelTime;
    double loadTime;
    int lastAddedTask;
    int counter;
    LinkedList<Task> tasks;

    Queue(){
        tasks = new LinkedList <Task>();
        counter = 0;
    }
    public double getModelTime() {
        return modelTime;
    }

    public int size(){
        return tasks.size();
    }
    public void setModelTime(double modelTime) {
        this.modelTime = modelTime;
    }

    public double getLoadTime() {
        return loadTime;
    }

    public void setLoadTime(double loadTime) {
        this.loadTime = loadTime;
    }

    public int getLastAddedTask() {
        return lastAddedTask;
    }

    public void incLastAddedTask() {
        lastAddedTask++;
    }


    public void setLastAddedTask(int p) {
        lastAddedTask = p;
    }

    public int getCounter() {
        return counter;
    }

    public void incCounter() {
        counter++;
    }

    public void addTask(Task task) {
        tasks.add(task);
    }

    public void deleteFirstTask() {
        tasks.remove(0);
    }

    public Task getFirstTask() {
        return tasks.get(0);
    }

    public Task get(int i) {
        return tasks.get(i);
    }

}
