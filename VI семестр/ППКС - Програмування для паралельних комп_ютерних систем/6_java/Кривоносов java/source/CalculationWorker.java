package PRO6;

import java.util.ArrayList;
import java.util.List;

public class CalculationWorker implements Runnable {
    private int tid;
    private GeneralResourseMonitor resMonitor;
    private SynchronizationMonitor syncMonitor;

    public CalculationWorker(GeneralResourseMonitor resourseMonitor,
                             SynchronizationMonitor syncMonitor, int id) {
        this.resMonitor = resourseMonitor;
        this.syncMonitor = syncMonitor;
        this.tid = id;
    }


    @Override
    public void run() {
        System.out.println("Thread "+tid + " started.");

        switch (this.tid) {
            case 1:
                Executor.MK = CalculateUtils.inputMatrix(1);
                Executor.B = CalculateUtils.inputVector(1);
                syncMonitor.inputSignal();
                break;
            case 3:
                Executor.C = CalculateUtils.inputVector(1);
                Executor.Z = CalculateUtils.inputVector(1);
                syncMonitor.inputSignal();
                break;
            case 4:
                Executor.E = CalculateUtils.inputVector(1);
                Vector T = CalculateUtils.inputVector(1);
                Matrix MO = CalculateUtils.inputMatrix(1);
                resMonitor.setMO(MO);
                resMonitor.setT(T);
                syncMonitor.inputSignal();
                break;
        }
        syncMonitor.waitForInput();

        if (tid == 1) {
            List<ForkSum> tasks = new ArrayList<ForkSum>();
            for (int i = 0; i < Executor.P; i++) {
                tasks.add(new ForkSum(i * Executor.H, (i + 1) * Executor.H, Executor.B, Executor.C, resMonitor));
            }
            for (ForkSum forkSum: tasks){
                forkSum.fork();
                forkSum.join();
            }

        }

        syncMonitor.calcVSignal();
        syncMonitor.waitForCalcV();

        int ei = CalculateUtils.operation2(tid);
        resMonitor.calcE(ei);
        syncMonitor.calcESignal();
        syncMonitor.waitForCalcE();

        ei = resMonitor.copyE();
        int vi = resMonitor.copyV();
        Vector Ti = resMonitor.copyT();
        Matrix MOi = resMonitor.copyMO();

        CalculateUtils.operation3(ei, vi, Ti, MOi, tid);

        if (tid == 1){
            syncMonitor.waitForCalcA();
            CalculateUtils.outputVector(Executor.A);
        }else{
            syncMonitor.calcASignal();
        }
        System.out.println("Thread "+tid + " finished.");
    }
}
