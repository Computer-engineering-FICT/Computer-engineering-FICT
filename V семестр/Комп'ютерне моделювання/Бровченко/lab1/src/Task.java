public class Task {
    int taskNumber;
    double entranceTime;
    double leftTime;

    public int getTaskNumber() {
        return taskNumber;
    }

    public Task(int taskNumber, double entranceTime, double leftTime) {
        this.taskNumber = taskNumber;
        this.entranceTime = entranceTime;
        this.leftTime = leftTime;
    }

    public void setTaskNumber(int taskNumber) {
        this.taskNumber = taskNumber;
    }

    public double getEntranceTime() {
        return entranceTime;
    }

    public void setEntranceTime(double entranceTime) {
        this.entranceTime = entranceTime;
    }

    public double getLeftTime() {
        return leftTime;
    }

    public void setLeftTime(double leftTime) {
        this.leftTime = leftTime;
    }
}
