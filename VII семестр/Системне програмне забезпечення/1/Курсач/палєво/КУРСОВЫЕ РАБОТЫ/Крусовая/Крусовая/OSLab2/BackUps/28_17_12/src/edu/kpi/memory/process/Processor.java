package edu.kpi.memory.process;

import edu.kpi.memory.data.MemControl;
import edu.kpi.memory.data.Process;
import edu.kpi.memory.data.ProcessList;

/**
 * Блок управления моделированием.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class Processor {
    private Parameters param;
    
    private int currentTime;        //текущее время (в сигналах таймера)
    private MemControl control;
    private ProcessList procList;
    private int currentId = 0;
    
    /**
     * Получение текущего времени.
     * @return текущее время
     */
    public int getCurrentTime() {
        return currentTime;
    }
    
    public Process makeProcess() {
        currentId++;
        return new Process(
                currentId - 1, 
                control, 
                param.N_MIN_PROCPAGES, 
                param.N_MAX_PROC_PAGES,
                param.T_MIN_WSTL,
                param.T_MAX_WSTL,
                param.N_WS_PAGES, 
                param.T_MIN_PROCLT,
                param.T_MAX_PROCLT);
    }
    
    public Processor(Parameters parameters) {
        this.param = parameters;
        
        control = new MemControl(param.TAU, param.N_ROBIN, param.MEM_SIZE, this);
        procList = new ProcessList();
        
        for (int i = 0; i < param.N_START_PROC_COUNT; i++) {
            procList.addProc(makeProcess());
        }
    }
    
    public void start(int tickCount) {                
        System.out.println(control);
        
        for (int i = 0; i < tickCount; i++) {
            procList.getNextProc().makeStep();
        }
        
        currentTime++;
        
        control.serviceRound();
        
        System.out.println(control);  
    }
}
