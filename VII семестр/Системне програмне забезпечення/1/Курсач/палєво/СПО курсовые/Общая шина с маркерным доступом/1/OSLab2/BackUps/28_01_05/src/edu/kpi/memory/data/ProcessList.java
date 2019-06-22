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
    public int getNextProc() {
        hand++;
        if (hand >= processes.size()) {
            hand = 0;
        }
        return hand;
    }
    
    /**
     * Удаление процесса.
     * @param proc удаляемый процесс
     */
    public void removeProc(Process proc) {
        processes.remove(proc);
    }
}
