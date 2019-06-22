import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: hadgehog
 * Date: 03.01.13
 * Time: 12:20
 * To change this template use File | Settings | File Templates.
 */
public class AProcessor {
    private boolean isBusy;
    private ATask executeATask;
    private boolean isMarkered;
    private ArrayList<ATask> executedTasks = new ArrayList<ATask>();

    public AProcessor(boolean busy, boolean markered) {
        isBusy = busy;
        isMarkered = markered;
    }

    public boolean isBusy() {
        return isBusy;
    }

    public void setBusy(boolean busy) {
        isBusy = busy;
    }

    public boolean isMarkered() {
        return isMarkered;
    }

    public void setMarkered(boolean markered) {
        isMarkered = markered;
    }

    public ATask getExecuteATask() {
        return executeATask;
    }

    public void setExecuteATask(ATask executeATask) {
        this.executeATask = executeATask;
    }

    public ArrayList<ATask> getExecutedTasks() {
        return executedTasks;
    }

    public void addExecutedTasks() {
        this.executedTasks.add(this.executeATask);
    }

    // визначає, чи претендує даний процесор на виконання чергової задачі.
    public boolean pretends(ATask aTask, ArrayList<ATask> allExecutedTasks) {
        for (int i = 0; i < executedTasks.size(); i++) {
            ArrayList<ATask> taskArrayList = executedTasks.get(i).getDependentATasks();
            for (int j = 0; j < allExecutedTasks.size(); j++) {
                if (taskArrayList.contains(allExecutedTasks.get(j))) {
                    taskArrayList.remove(allExecutedTasks.get(j));
                }
            }
            if (taskArrayList.contains(aTask)) {
                return true;
            }
        }
        return false;
    }
}
