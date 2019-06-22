import java.util.LinkedList;
import java.util.Random;

public class Generator {
    LinkedList<double[]> tasks;
    Queue RR;
    Queue FIFO;
    double[] constant; // lambda, mu1, mu2, alfa1,quantum


    LinkedList<double[]> getTasks() {
        return tasks;
    }


    void generateTime(double genTime) {

        double time = 0;
        FIFO = new Queue();
        RR = new Queue();
        while (time < genTime) {
            double[] result = new double[8];
            time += generateEvent(constant[0]);
            result[0] = time;
            Random rand = new Random();
            double temp = rand.nextDouble();
            if (temp < constant[3])
                result[1] = generateEvent(constant[1]);
            else result[1] = generateEvent(constant[2]);
            tasks.add(result);
        }


        while (genTime > FIFO.getModelTime()) {
            generateStepFIFO();
        }

       while (genTime > RR.getModelTime()) {
            generateStepRR();
        }

    }


    void generateSteps(int count) {
        //System.out.println("dd2");
        FIFO = new Queue();
        RR = new Queue();
        double time = 0;
        for (int i = 0; i < count; i++) {
            double[] result = new double[8];
            result[0] = time;
            time += generateEvent(constant[0]);
            Random rand = new Random();
            double temp = rand.nextDouble();
            if (temp < constant[3])
                result[1] = generateEvent(constant[1]);
            else result[1] = generateEvent(constant[2]);
            //System.out.println((tasks.size()) + "  entryTime=" + result[0] + "  solutionTime=" + result[1] /*+ "  time=" + time*/);
            tasks.add(result);

        }


        for (; FIFO.getCounter() < (count); ) {
            generateStepFIFO();
        }

        for (; RR.getCounter() < (count); ) {
            generateStepRR();
        }


    }


    void generateStepFIFO() {
        if (FIFO.getModelTime() != 0) {

            if ((FIFO.size() == 0) && (FIFO.getLastAddedTask() != (tasks.size() - 1))) {
                int indexTask = FIFO.getLastAddedTask() + 1;
                FIFO.addTask(new Task(indexTask, tasks.get(indexTask)[0], tasks.get(indexTask)[1]));
                if (FIFO.getModelTime() < tasks.get(indexTask)[0]) {
                    FIFO.setModelTime(tasks.get(indexTask)[0]);
                }
                /*
                System.out.println(" ");
                System.out.println("Add task: N=" + indexTask + "entranceTime=" + tasks.get(indexTask)[0] + "leftTime=" + tasks.get(indexTask)[1]);
                System.out.println("modelingTime=" + FIFO.getModelTime());
                */
                FIFO.incLastAddedTask();
            } else {

                int index = FIFO.getFirstTask().getTaskNumber();
                double[] temp = tasks.get(index);
                temp[2] = 1;
                temp[3] = FIFO.getModelTime();
                FIFO.setModelTime(FIFO.getModelTime() + FIFO.getFirstTask().getLeftTime());
                temp[4] = FIFO.getModelTime();
                /*
                System.out.println(" ");
                System.out.println("Delete task: N=" + index + "  firstEntryTime=" + temp[3] + "  solutionTime=" + temp[1] + "  outTime=" + temp[4]);
                System.out.println("modelingTime=" + FIFO.getModelTime());
                */
                tasks.set(index, temp);
                FIFO.deleteFirstTask();
                FIFO.incCounter();

                while ((FIFO.getLastAddedTask() != (tasks.size() - 1) && (tasks.get(FIFO.getLastAddedTask() + 1)[0] < FIFO.getModelTime()))) {
                    int indexTask = FIFO.getLastAddedTask() + 1;
                    FIFO.addTask(new Task(indexTask, tasks.get(indexTask)[0], tasks.get(indexTask)[1]));

                    FIFO.incLastAddedTask();
                    /*
                    System.out.println("Add task: N=" + indexTask + "entranceTime=" + tasks.get(indexTask)[0] + "leftTime=" + tasks.get(indexTask)[1]);
                    System.out.println("modelingTime=" + FIFO.getModelTime());
                    */
                }

            }


        } else {
            FIFO.addTask(new Task(0, tasks.get(0)[0], tasks.get(0)[1]));
            FIFO.setModelTime(0.00000000001);
            FIFO.setLastAddedTask(0);
            /*
            System.out.println(" ");
            System.out.println("Add task: N=" + 0 + "entranceTime=" + tasks.get(0)[0] + "leftTime=" + tasks.get(0)[0]);
            System.out.println("modelingTime=" + FIFO.getModelTime());
            */
        }
    }


    void generateStepRR() {
        if (RR.getModelTime() != 0) {

            if ((RR.size() == 0) && (RR.getLastAddedTask() != (tasks.size() - 1))) {
                int indexTask = RR.getLastAddedTask() + 1;
                RR.addTask(new Task(indexTask, tasks.get(indexTask)[0], tasks.get(indexTask)[1]));
                if (RR.getModelTime() < tasks.get(indexTask)[0]) {
                    RR.setModelTime(tasks.get(indexTask)[0]);
                }
                /*
                System.out.println(" ");
                System.out.println("Add task: N=" + indexTask + "entranceTime=" + tasks.get(indexTask)[0] + "leftTime=" + tasks.get(indexTask)[1]);
                System.out.println("modelingTime=" + RR.getModelTime());
                */
                RR.incLastAddedTask();
            } else {

                if (RR.size() != 0) {
                    if (RR.getFirstTask().getLeftTime() < constant[4]) {
                        int index = RR.getFirstTask().getTaskNumber();
                        double[] temp = tasks.get(index);
                        temp[5] = 1;
                        if (temp[6] == 0) {
                            temp[6] = RR.getModelTime();
                        }
                        RR.setModelTime(RR.getModelTime() + RR.getFirstTask().getLeftTime());
                        temp[7] = RR.getModelTime();
                        tasks.set(index, temp);
                        /*
                        System.out.println(" ");
                        System.out.println("Delete task: N=" + index + "  firstEntryTime=" + temp[6] + "  solutionTime=" + temp[1] + "  outTime=" + temp[7]);
                        System.out.println("modelingTime=" + RR.getModelTime());
                        */
                        RR.deleteFirstTask();
                        RR.incCounter();
                    } else

                    {
                        int index = RR.getFirstTask().getTaskNumber();
                        double[] temp = tasks.get(index);
                        if (temp[6] == 0) {
                            temp[6] = RR.getModelTime();
                            tasks.set(index, temp);
                        }
                        RR.setModelTime(RR.getModelTime() + constant[4]);
                        RR.addTask(new Task(index, RR.getModelTime(), RR.getFirstTask().getLeftTime() - constant[4]));
                        /*
                        System.out.println(" ");
                        System.out.println("Add task: N=" + index + "entryTime=" + RR.getModelTime() + "leftTime=" + (RR.getFirstTask().getLeftTime() - constant[4]));
                        System.out.println("modelingTime=" + RR.getModelTime());
                        */
                        RR.deleteFirstTask();
                    }
                }


                while ((RR.getLastAddedTask() != (tasks.size() - 1) && (tasks.get(RR.getLastAddedTask() + 1)[0] < RR.getModelTime()))) {
                    int indexTask = RR.getLastAddedTask() + 1;
                    RR.addTask(new Task(indexTask, tasks.get(indexTask)[0], tasks.get(indexTask)[1]));
                    FIFO.setModelTime(tasks.get(indexTask)[1]);
                    RR.incLastAddedTask();
                    /*
                    System.out.println("Add task: N=" + indexTask + "entranceTime=" + tasks.get(indexTask)[0] + "leftTime=" + tasks.get(indexTask)[1]);
                    System.out.println("modelingTime=" + RR.getModelTime());
                    */
                }

            }

        } else {
            RR.addTask(new Task(0, tasks.get(0)[0], tasks.get(0)[1]));
            RR.setModelTime(0.00000000001);
            RR.setLastAddedTask(0);
            /*
            System.out.println(" ");
            System.out.println("Add task: N=" + 0 + "entranceTime=" + tasks.get(0)[0] + "leftTime=" + tasks.get(0)[0]);
            System.out.println("modelingTime=" + RR.getModelTime());
            */
        }

    }

    Generator(double a0, double a1, double a2, double a3, double a4) {
        tasks = new LinkedList<double[]>();
        constant = new double[5];
        constant[0] = a0;
        constant[1] = a1;
        constant[2] = a2;
        constant[3] = a3;
        constant[4] = a4;
    }

    double generateEvent(double inp) {
        Random rand = new Random();
        double result = -1.0 / inp * Math.log(rand.nextDouble());
        return result;
    }
}