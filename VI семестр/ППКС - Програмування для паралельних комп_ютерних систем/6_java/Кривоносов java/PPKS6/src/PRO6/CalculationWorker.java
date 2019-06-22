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
                Executor.MT = CalculateUtils.inputMatrix(1);
                Matrix MR = CalculateUtils.inputMatrix(1);
                resMonitor.setMR(MR);
                syncMonitor.inputSignal();
                break;
            case 3:

                Executor.B = CalculateUtils.inputVector(1);
                syncMonitor.inputSignal();
                break;
            case 4:
                Executor.C = CalculateUtils.inputVector(1);
                Executor.MO = CalculateUtils.inputMatrix(1);
                int alpha = 1;
                resMonitor.setAlpha(alpha);
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



        int alphai = resMonitor.copyAlpha();
        int vi = resMonitor.copyV();
        Matrix MR = resMonitor.copyMR();

        CalculateUtils.operations(vi, alphai, MR, tid);

        if (tid == 3){
            syncMonitor.waitForCalcMA();
            CalculateUtils.outputMatrix(Executor.MA);
        }else{
            syncMonitor.calcMASignal();
        }
        System.out.println("Thread "+tid + " finished.");
    }
}
