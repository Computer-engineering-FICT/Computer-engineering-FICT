/**
 * Created with IntelliJ IDEA.
 * User: hadgehog
 * Date: 03.01.13
 * Time: 12:26
 * To change this template use File | Settings | File Templates.
 */
public class AConnection {
    private ATask fromATask;  //від задачі
    private ATask toATask;    //до задачі
    private int weight;     //вага

    public AConnection(ATask fromATask, ATask toATask, int weight) {
            this.fromATask = fromATask;
            this.toATask = toATask;
            this.weight = weight;
    }

    public ATask getFromATask() {
        return fromATask;
    }

    public ATask getToATask() {
        return toATask;
    }

    public int getWeight() {
        return weight;
    }
}
