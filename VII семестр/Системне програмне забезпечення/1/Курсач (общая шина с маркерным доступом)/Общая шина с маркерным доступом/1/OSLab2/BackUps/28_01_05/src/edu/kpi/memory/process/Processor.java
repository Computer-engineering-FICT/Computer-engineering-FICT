package edu.kpi.memory.process;

/**
 * Блок управления моделированием.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class Processor {
    private final static int 
        P_NEW_PROC = 2,             //вероятность появления нового процесса
        N_MAX_PROC_COUNT = 10,      //максимальное количество процессов 
        T_TICS_IN_PERIOD = 30,      //количество тактов между сигналами таймера
        T_TICS_PER_PROC = 20;       //количество тактов на один процесс
    
    private int currentTime;        //текущее время (в сигналах таймера)
    
    /**
     * Получение текущего времени.
     * @return текущее время
     */
    public int getCurrentTime() {
        return currentTime;
    }
}
