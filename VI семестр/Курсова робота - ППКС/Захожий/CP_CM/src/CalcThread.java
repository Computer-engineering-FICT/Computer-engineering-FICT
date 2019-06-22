public class CalcThread extends Thread {

    private int Tid;
    private SynchronizationMonitor synchronizationMonitor;
    private DataMonitor dataMonitor;
    private int N;
    private int P;
    private int H;
    private Matrix MX;
    private Matrix MM;
    private Matrix MA;
    private Matrix MCi;
    private Matrix MEi;
    private Matrix MDi;

    public CalcThread(int Tid, SynchronizationMonitor synchronizationMonitor,
                      DataMonitor dataMonitor, int N, int P, int H,
                      Matrix MX, Matrix MM, Matrix MA) {
        this.Tid = Tid;
        this.synchronizationMonitor = synchronizationMonitor;
        this.dataMonitor = dataMonitor;
        this.N = N;
        this.P = P;
        this.H = H;
        this.MX = MX;
        this.MM = MM;
        this.MA = MA;
        MCi = new Matrix(N);
        MEi = new Matrix(N);
        MDi = new Matrix(N);
    }

    private Matrix multiplyMatrixesH(Matrix MM1, Matrix MM2, int Hfrom, int Hto) {
        Matrix result = new Matrix(Hto - Hfrom, MM2.getColCount());
        for (int i = 0; i < result.getRowCount(); i++) {
            for (int j = 0; j < result.getColCount(); j++) {
                for (int k = 0; k < MM1.getColCount(); k++) {
                    result.set(i, j,
                            result.get(i, j) + MM1.get(i + Hfrom, k) * MM2.get(k, j));
                }
            }
        }
        return result;
    }

    public void run() {
        System.out.println("Thread T" + String.valueOf(Tid + 1) + "has started.");
        if (Tid == 0) {
            MX.fillWithOnes();
            MM.fillWithOnes();
            MCi.fillWithOnes();
            MEi.fillWithOnes();
            MDi.fillWithOnes();
            dataMonitor.setMC(MCi);
            dataMonitor.setMD(MDi);
            dataMonitor.setME(MEi);
            synchronizationMonitor.signalInput();
        }
        else {
            synchronizationMonitor.waitInput();
            MCi = dataMonitor.getMC();
            MDi = dataMonitor.getMD();
            MEi = dataMonitor.getME();
        }
        System.out.println("Thread T" + String.valueOf(Tid + 1) +
                      "has begun to calculate the function.");
        int Hfrom = Tid * H;
        int Hto;
        if (Tid == (P - 1)) {
            Hto = N;
        }
        else {
            Hto = Tid * H + H;
        }
        Matrix temp1 = multiplyMatrixesH(multiplyMatrixesH(MX, MCi, Hfrom, Hto),
                      MEi, 0, (Hto - Hfrom));
        Matrix temp2 = multiplyMatrixesH(MM, MDi, Hfrom, Hto);
        for (int i = Hfrom; i < Hto; i++) {
            for (int j = 0; j < MA.getColCount(); j++) {
                MA.set(i, j, temp1.get((i - Hfrom), j) - temp2.get((i - Hfrom), j));
            }
        }
        System.out.println("Thread T" + String.valueOf(Tid + 1) +
                      "has ended to calculate the function.");
        if (Tid == 0) {
            synchronizationMonitor.waitCalc();
            System.out.println("MA = (");
            for (int i = 0; i < MA.getRowCount(); i++) {
                for (int j = 0; j < MA.getColCount(); j++) {
                    System.out.print(String.valueOf(MA.get(i, j)) + "\t");
                }
                System.out.println();
            }
            System.out.println(")");
        }
        else {
            synchronizationMonitor.signalCalc();
        }
        System.out.println("Thread T" + String.valueOf(Tid + 1) + "has finished.");
    }

}
