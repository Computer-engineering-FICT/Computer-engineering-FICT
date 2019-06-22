package Lab5;

/**
 *
 * @author Nightingale
 */
public class Main {
    
    private static double[][] Table = {
        {0.4,0.3,0.2,0.1},
        {0,0.3,0.7,0},
        {0.6,0.2,0,0.2},
        {1,0,0,0}
    };
    private static int TherNumCicle = 10;
    private static int NumSample = 20000;
    private static int N = 4;

    public static void main(String[] args){
        theoretical();
        System.out.println();
        experimuntum();
    }

    public static void theoretical(){
        double[] State = new double[N];
        System.arraycopy(Table[0], 0, State, 0, N);
        for (int i=0;i<TherNumCicle;i++){
            double[] temp = new double[N];
            System.arraycopy(State, 0, temp, 0, N);
            for (int j=0;j<N;j++){
                State[j]=0;
                for (int k=0;k<N;k++){
                    State[j]+=temp[k]*Table[k][j];
                }
            }
        }

        for (int i=0;i<N;i++)
            System.out.println(State[i]);
    }

    public static void experimuntum(){
        int current = 0;
        int[] currentList = new int[N];
        double[][] SumTable = Table.clone();
        for (int i=1;i<N;i++)
            for (int j=0;j<N;j++)
                SumTable[j][i]+=SumTable[j][i-1];

        for (int i=0;i<NumSample;i++){
            double x = Math.random();
            int res=0;
            while (x>SumTable[current][res]){
                res++;
            }
            currentList[res]++;
            current=res;
        }

        double DoubleNumSample = NumSample;
        for (int i=0;i<N;i++)
            System.out.println(currentList[i]/DoubleNumSample);
    }
}
