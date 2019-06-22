package lab2;

public class Work {

    public static final int N = 5000;

    public static void main(String[] args) {

        FirstTask firstTask = new FirstTask();
        SecondTask secondTask = new SecondTask();
        ThirdTask thirdTask = new ThirdTask();

        firstTask.run();
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        secondTask.run();
        thirdTask.run();
    }
}
