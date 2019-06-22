import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: hadgehog
 * Date: 03.01.13
 * Time: 12:20
 * To change this template use File | Settings | File Templates.
 */
public class ATask {
    private int id; //ідентифікатор задачі
    private int duration;//тривалість (тактів)
    private int remainder;//залишок виконання(тактів)
    private ArrayList<ATask> dependentATasks;//залежні задачі(дочірні)
    private ArrayList<ATask> fatherTasks;  // задачі, від яких залежить дана задача
    private ArrayList<ATask> fatherTasksToDo;  // задачі, які треба виконати для початку виконання цієї задачі
    private boolean isPretended = false; // для задачі є ресурс для виконання (перетендує забрати дан задачу)

    public ATask(int id, int duration) {
        this.id = id;
        this.duration = duration;
        this.remainder = duration;
    }

    public int getId() {
        return id;
    }

    public int getDuration() {
        return duration;
    }

    public int getRemainder() {
        return remainder;
    }

    public void setDependentATasks(ArrayList<ATask> dependentATasks) {
        this.dependentATasks = dependentATasks;
    }

    public ArrayList<ATask> getDependentATasks() {
        return dependentATasks;
    }

    public ArrayList<ATask> getFatherTasksToDo() {
        return fatherTasksToDo;
    }

    public void setFatherTasks(ArrayList<ATask> fatherTasks) {
        this.fatherTasks = fatherTasks;
        this.fatherTasksToDo = (ArrayList<ATask>) fatherTasks.clone();
    }

    public boolean isPretended() {
        return isPretended;
    }

    public void setPretended(boolean pretended) {
        isPretended = pretended;
    }

    public void execute() {
        remainder--;
    }
}
