package edu.kpi.memory.data;

import java.util.ArrayList;

/**
 * Круговой список процессов.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class ProcessList {
    private ArrayList<Process> processes;
    private int hand;
    
    public ProcessList() {
        processes = new ArrayList<Process>();
        hand = 0;
    }
    
    /**
     * @return общее количемство процессов
     */
    public int getProcCount() {
        return processes.size();
    }
    
    /**
     * Добавление процесса.
     * @param proc добавляемый процесс
     */
    public void addProc(Process proc) {
        processes.add(proc);
    }
    
    /**
     * Получение следующего процесса по кольцевому списку.
     * @return следующий процессs
     */
    public Process getNextProc() {
        hand++;
        if (hand >= processes.size()) {
            hand = 0;
        }
        return processes.get(hand);
    }
    
    /**
     * Удаление процесса.
     * @param proc удаляемый процесс
     */
    public void removeProc(Process proc) {
        processes.remove(proc);
    }
    
    /**
     * Получение процесса с индексом i.
     * @param i индекс процесса
     * @return  процесс с индексом i
     */
    public Process getProcess(int i) {
        return processes.get(i);
    }
    
    public String toString() {
        String str = "";
        for (Process proc : processes) {
            str += proc + "\n";
        }
        return str;
    }
}
