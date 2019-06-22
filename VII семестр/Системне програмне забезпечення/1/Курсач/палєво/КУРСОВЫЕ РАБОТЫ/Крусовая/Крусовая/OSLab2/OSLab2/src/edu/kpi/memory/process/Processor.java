package edu.kpi.memory.process;

import java.util.Random;
import java.util.Scanner;

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
                param.N_MIN_PROC_PAGES, 
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
    
    /**
     * Попытка создать новый процесс.
     */
    private void tryCreateProcess() {
        Random rand = new Random();
        int r = rand.nextInt(101);
        if (r < param.P_NEW_PROC) {
            procList.addProc(makeProcess());
        }
    }
    
    public void start(int tickCount) {                       
        Process currentProc = procList.getNextProc();
        boolean processContinue;        
        
        for (int i = 1; (i < tickCount) && (procList.getProcCount() > 0); i++) {
            processContinue = currentProc.makeStep();
            
            if (!processContinue) {                
                procList.removeProc(currentProc);                
                if (param.PRINT_END_PROC) {
                    Logging.write("\n*^*Process ended*^* " + currentProc + 
                            " Tics: " + i + "\n\n");
                    
                    if (procList.getProcCount() > 0) {
                        currentProc = procList.getNextProc();
                    } else {
                        continue;
                    }
                }                                
            }
            
            if (i % param.T_TICS_IN_PERIOD == 0) {
                currentTime++;
                control.serviceRound();
            }
            
            if (i % param.T_TICS_PER_PROC == 0) {
                currentProc = procList.getNextProc();
                
                Logging.write("\n===Time:" + currentTime + " tics:" + i 
                        + " start " + currentProc + "\n");
            }
            
            tryCreateProcess();                        
        }
        
        System.out.println("PAGE FAULTS: " + control.getPageFaultCount());
        Logging.write("PAGE FAULTS: " + control.getPageFaultCount());
        //System.out.println("AVERAGE SEEN PAGES: " + control.getAverageSeenPages());
    }

    private int menu(Process proc) {
        System.out.println(
                "Menu:\n" + 
                "1. Make next steps\n" +
                "2. Memory dump\n" + 
                "3. Active process dump\n" +
                "4. Process list dump\n" +
                "5. Exit");
        
        Scanner scan = new Scanner(System.in);
        
        int choise = scan.nextInt();
        
        switch (choise) {
            case 1: {
                System.out.println("How many steps: ");
                return scan.nextInt();
            } 
                
            case 2: {
                System.out.println(control);
                return 0;
            }
            
            case 3: {
                System.out.println(proc + "\n" + proc.printPages() + 
                        "\n" + proc.printWS());
                return 0;
            }
            
            case 4: {
                System.out.println(procList);
                return 0;
            }
            
            case 5: return -1;
        }
        
        return -1;
    }
    
    public void start() {                       
        Logging.setConsoleMirror(true);
        Process currentProc = procList.getNextProc();
        boolean processContinue;        
        
        int choise = 0;
        
        int i = 0;
        
        while ( (choise != -1) && (procList.getProcCount() > 0)) {                                                
            for (int j = i; j < i + choise; j++) {
                processContinue = currentProc.makeStep();
                
                if (!processContinue) {                
                    procList.removeProc(currentProc);                
                    if (param.PRINT_END_PROC) {
                        Logging.write("\n*^*Process ended*^* " + currentProc + 
                                " Tics: " + i + j + "\n\n");
                        
                        if (procList.getProcCount() > 0) {
                            currentProc = procList.getNextProc();
                        } else {
                            continue;
                        }
                    }                                
                }
                
                if ((i + j) % param.T_TICS_IN_PERIOD == 0) {
                    currentTime++;
                    control.serviceRound();
                }
                
                if ((i + j) % param.T_TICS_PER_PROC == 0) {
                    currentProc = procList.getNextProc();
                    
                    Logging.write("\n===Time:" + currentTime + " tics:" + (i + j) 
                            + " start " + currentProc + "\n");
                }
                
                tryCreateProcess();                  
            }
            
            i += choise;
            
            System.out.println("PAGE FAULTS: " + control.getPageFaultCount());
            
            choise = menu(currentProc);
            while (choise == 0) {
                choise = menu(currentProc);
            }            
        }    
        
        if (procList.getProcCount() <= 0) {
            System.out.println("Process list is empty");
        }
    }

}
