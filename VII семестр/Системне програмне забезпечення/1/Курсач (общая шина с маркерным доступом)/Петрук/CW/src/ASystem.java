import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hadgehog
 * Date: 03.01.13
 * Time: 12:21
 * To change this template use File | Settings | File Templates.
 */
public class ASystem {
    private final int PROCESSOR_COUNT = 1;
    private int marker = 0;                                        //де знаходиться маркер
    private AProcessor[] aProcessors;                               //процесори
    private Map<Integer, ATask> tasks;                              //індекс<->задача
    private boolean isBusFree = true;
    private ArrayList<AConnection> aConnections;
    private ArrayList<ATask> readyATasks = new ArrayList<ATask>();  //готові до виконання задачі
    private ArrayList<ATask> executedATasks = new ArrayList<ATask>();// задачі, що виконуються
    private int numberOfTasks;                                      //кількість задач
    private ArrayList<ATask> doneATasks = new ArrayList<ATask>();   //виконані задачі

    public ASystem(int[][] graphMatrix, int[] tasksWeights) {
        numberOfTasks = graphMatrix.length;
        setSystemParametres(graphMatrix, tasksWeights);
        //створення процесорів
        aProcessors = new AProcessor[PROCESSOR_COUNT];
        for (int i = 0; i < PROCESSOR_COUNT; i++) {
            AProcessor AProcessor = new AProcessor(false, false);
            aProcessors[i] = AProcessor;
        }
    }

    //запуск моделюванння
    public void run() {
        marker = 0;//маркер у процесора №0
        int takt = 0;
        marker = 0;
        aProcessors[0].setMarkered(true);
        ArrayList<String> modelingResult = new ArrayList<String>();
        String taktLine = "";
        String split = ";";
        taktLine += "t" + split + "         ";
        for (int i = 1; i <= PROCESSOR_COUNT; i++) {
            taktLine += "P" + i + split + "     ";
        }
        taktLine += "      Bus";
        System.out.println(taktLine);
        modelingResult.add(taktLine);
        while (doneATasks.size() != numberOfTasks) {
            takt++;
            //перевіряємо чи виконали процесори свої задачі і чи не з'явились вільні задачі
            for (int i = 0; i < aProcessors.length; i++) {
                if ((aProcessors[i].isBusy()) && (aProcessors[i].getExecuteATask().getRemainder() == 0)) {
                    aProcessors[i].setBusy(false);
                    aProcessors[i].addExecutedTasks();
                    doneATasks.add(aProcessors[i].getExecuteATask());
                    executedATasks.remove(aProcessors[i].getExecuteATask());
                    //чи зявились вільні задачі
                    for (int j = 0; j < numberOfTasks; j++) {
                        if ((!doneATasks.contains(tasks.get(j))) && (!executedATasks.contains(tasks.get(j)))) {
                            if (tasks.get(j).getFatherTasksToDo().contains(aProcessors[i].getExecuteATask())) {
                                tasks.get(j).getFatherTasksToDo().remove(aProcessors[i].getExecuteATask());
                            }
                            if ((tasks.get(j).getFatherTasksToDo().size() == 0) && (!readyATasks.contains(tasks.get(j)))) {
                                readyATasks.add(tasks.get(j));
                            }
                        }
                    }
                }
            }
            //призначаємо вільним процесорам готові задачі (циклічно проходимо всі процесори, поки не буде конфліктів по призначенню задач)
            for (int i = 0; i < PROCESSOR_COUNT; i++) {
                if (!aProcessors[i].isBusy()) {
                    if (readyATasks.size() != 0) {
                        //сортуємо готові задачі за тривлістю по спаданню
                        for (int j = 0; j < readyATasks.size() - 1; j++) {
                            for (int k = +1; k < j; k++) {
                                if (readyATasks.get(k).getDuration() > readyATasks.get(j).getDuration()) {
                                    readyATasks.add(j, readyATasks.get(k));
                                    readyATasks.remove(k + i);
                                }
                            }
                        }
                        //вибираємо задачу для даного процесора
                        ATask taskForExecute = null;
                        for (int j = 0; j < readyATasks.size(); j++) {
                            if (aProcessors[i].pretends(readyATasks.get(j), executedATasks)) {
                                if (taskForExecute != null) {
                                    //вибираємо задачу з більшим ваговим коефіціентом передачі
                                    if (aProcessors[i].getExecuteATask() != null) {
                                        if (getConnectionWeight(readyATasks.get(j), aProcessors[i].getExecuteATask()) > getConnectionWeight(taskForExecute, aProcessors[i].getExecuteATask())) {
                                            taskForExecute = readyATasks.get(j);
                                        }
                                    }
                                } else {
                                    taskForExecute = readyATasks.get(j);
                                }
                            }
                        }
                        //при можливості передаємо дані
                        if (aProcessors[i].isMarkered() & (!isBusFree)) {
                            isBusFree = false;
                        }
                        if (taskForExecute != null) {
                            aProcessors[i].setExecuteATask(taskForExecute);

                            executedATasks.add(taskForExecute);
                            readyATasks.remove(taskForExecute);
                        } else {//вибираємо задач з найбільшою тривалістю виконання
                            aProcessors[i].setExecuteATask(readyATasks.get(0));
                            executedATasks.add(readyATasks.get(0));
                            readyATasks.remove(0);
                        }
                        aProcessors[i].setBusy(true);
                    }
                }
            }
            //виконуємо один такт всіх процесорів
            for (int i = 0; i < aProcessors.length; i++) {
                if (aProcessors[i].isBusy()) {
                    aProcessors[i].getExecuteATask().execute();
                }
            }
            //шукаємо промаркований процесор і визначаємо чи можна передати маркер далі
            for (int i = 0; i < PROCESSOR_COUNT; i++) {
                if ((aProcessors[i].isMarkered()) & (isBusFree)) {
                    aProcessors[i].setMarkered(false);
                    if (i != PROCESSOR_COUNT - 1) {
                        aProcessors[i + 1].setMarkered(true);
                        marker = i + 1;
                        break;
                    } else {
                        aProcessors[0].setMarkered(true);
                        marker = 0;
                        break;
                    }
                }
            }
            //виводимо результат роботи такту в колнсоль
            taktLine = takt + split + "         ";
            for (int i = 0; i < PROCESSOR_COUNT; i++) {
                ATask aTask = null;
                if (aProcessors[i].isBusy()) {
                    aTask = aProcessors[i].getExecuteATask();
                }
                if (aTask != null) {
                    taktLine += (aProcessors[i].getExecuteATask().getId() + 1);
                } else {
                    taktLine += "-";
                }
                //з маркером?
                if (aProcessors[i].isMarkered()) {
                    taktLine += "*" + split + "      ";
                } else {
                    taktLine += split + "      ";
                }
            }
            //що на шині
            if (!isBusFree) {
                taktLine += aConnections.get(marker).getFromATask().getId() + " -> " +
                        aConnections.get(marker).getToATask().getId() + split;
            }
            System.out.println(taktLine);
            modelingResult.add(taktLine);
        }
        //запис в csv файл
        writeToFile(modelingResult);
    }

    //встановлює параметри системи на основі вхідної матриці переходів та вагів задач
    private void setSystemParametres(int[][] graphMatrix, int[] tasksWeights) {
        //створюємо задачі
        tasks = new HashMap<Integer, ATask>();
        for (int i = 0; i < numberOfTasks; i++) {
            ATask ATask = new ATask(i, tasksWeights[i]);
            tasks.put(i, ATask);
        }
        //встановлення дочірніх задач
        for (int i = 0; i < numberOfTasks; i++) {
            ArrayList<ATask> dependentTasks = new ArrayList<ATask>();
            for (int j = 0; j < numberOfTasks; j++) {
                if (graphMatrix[i][j] != 0) {
                    dependentTasks.add(tasks.get(j));
                }
            }
            tasks.get(i).setDependentATasks(dependentTasks);
        }
        //встановлення батьківських задач
        for (int i = 0; i < numberOfTasks; i++) {
            ArrayList<ATask> fatherTasks = new ArrayList<ATask>();
            for (int j = 0; j < numberOfTasks; j++) {
                if (graphMatrix[j][i] != 0) {
                    fatherTasks.add(tasks.get(j));
                }
            }
            tasks.get(i).setFatherTasks(fatherTasks);
        }
        //створюємо зв`язки
        aConnections = new ArrayList<AConnection>();
        for (int i = 0; i < numberOfTasks; i++) {
            for (int j = 0; j < numberOfTasks; j++) {
                if (graphMatrix[i][j] != 0) {
                    AConnection AConnection = new AConnection(tasks.get(i), tasks.get(j), graphMatrix[i][j]);
                    aConnections.add(AConnection);
                }
            }

        }
        //визначення задач, готових до виконання( задачі верхнього рівня)
        for (int i = 0; i < numberOfTasks; i++) {
            if (isTopTask(graphMatrix, tasks.get(i))) {
                readyATasks.add(tasks.get(i));
            }
        }
    }

    // визначає, чи на верхньому рівні знаходиться задача
    private boolean isTopTask(int[][] graphMatrix, ATask task) {
        for (int i = 0; i < graphMatrix.length; i++) {
            if (graphMatrix[i][task.getId()] != 0) {
                return false;
            }
        }
        return true;
    }

    // повертає значення ваги переходу між задачами
    private int getConnectionWeight(ATask task1, ATask task2) {
        for (int i = 0; i < aConnections.size(); i++) {
            if ((aConnections.get(i).getFromATask().equals(task1)) && (aConnections.get(i).getToATask().equals(task2))) {
                return aConnections.get(i).getWeight();
            }
            if ((aConnections.get(i).getFromATask().equals(task2)) && (aConnections.get(i).getToATask().equals(task1))) {
                return aConnections.get(i).getWeight();
            }
        }
        return -1;
    }

    //записує результат моделювання в файл формату csv
    private void writeToFile(ArrayList<String> modelingResult) {
        String fileName = "result.csv";
        try {
            BufferedWriter newCSVFile = new BufferedWriter(new FileWriter(fileName));
            for (String s : modelingResult) {
                newCSVFile.write(s + "\n");
            }
            newCSVFile.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
