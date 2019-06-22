public class Lab4 {
    public static int[][] MoveL(int[][] matrix, int i) {
        for (int j = 0; j < matrix.length; j++) {
            int temp = matrix[reduced][j];
            matrix[reduced][j] = matrix[i][j];
            matrix[i][j] = temp;
        }
        return matrix;
    }
    public static int[][] MoveC(int[][] matrix, int j) {
        for (int i = 0; i < matrix.length; i++) {
            int temp = matrix[i][reduced];
            matrix[i][reduced] = matrix[i][j];
            matrix[i][j] = temp;
        }
        return matrix;
    }

    public static int getSumL(int i) {
        int s = 0;
        for (int j = 0; j < matrix.length; j++)
            s += matrix[i][j];
        return s;
    }

    public static int getSumC(int j) {
        int s = 0;
        for (int i = 0; i < matrix.length; i++)
            s += matrix[i][j];
        return s;
    }

    public static int getMinL() {
        int index = reduced;
        int s = getSumL(reduced);
        if (s == 0)
            s = N * N;
        for (int i = reduced + 1; i < matrix.length; i++) {
            int tempSum = getSumL(i);
            if ((s > tempSum) && (tempSum > 0)) {
                s = tempSum;
                index = i;
            }
        }
        return index;
    }

    public static int getMaxC(int i) {
        int index = reduced;
        int s;
        if (matrix[i][reduced] != 1)
            s = 0;
        else
            s = getSumC(reduced);
        for (int j = reduced + 1; j < matrix.length; j++) {
            if (matrix[i][j] == 1) {
                int tempSum = getSumC(j);
                if (s < tempSum) {
                    s = tempSum;
                    index = j;
                }
            }
        }
        return index;
    }

    public static int getNext1(int i, int indexJ) {
        for (int j = indexJ + 1; j < matrix.length; j++)
            if (matrix[i][j] == 1)
                return j;
        return -1;
    }

    public static boolean isConflict() {
        for (int i = 0; i < matrix.length; i++) {
            int sum = 0;
            for (int j = 0; j <= i; j++)
                sum += matrix[i][j];
            if ((sum != i + 1) && (sum != 0) && (sum != 1))
                return true;
        }
        return false;
    }

    public static void put1(int i, int j) {
        if (matrix[i][j] != 1)
            matrix[i][j] = 1;
        else {
            if (j + 1 < N)
                put1(i, j + 1);
            else {
                if (i + 1 < N)
                    put1(i + 1, 0);
                else
                    put1(0, 0);
            }
        }
    }

    public static void init() {
        reduced = 0;
        matrix = new int[N][N];
        for (int i = 0; i < count1; i++)
            put1((int) (Math.random() * N), (int) (Math.random() * N));
    }

    public static void main(String[] args) {
        for (int i = 0; i < N * N; i++){
            count1 = i+1;
            res[i][1] = (double)count1*100/(N*N);
            for (int j = 0; j < 100; j++) {
                for (int z = 0; z < 100; z++) {
                    init();
                    while (reduced < matrix.length) {
                        matrix = MoveL(matrix, getMinL());
                        matrix = MoveC(matrix, getMaxC(reduced));
                        reduced++;
                    }
                    if (isConflict()) {
                        res[i][0]++;
                    }
                }
            }
            res[i][0]/= 100;
            System.out.println(res[i][1]+"; "+res[i][0]+";");
        }
    }
    public static void print() {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++)
                System.out.print(matrix[i][j] + " ");
            System.out.println();
        }
    }
    private static int N = 20;
    private static int count1 = 1;
    private static int[][] matrix = new int[N][N]; 
    private static double[][] res = new double[N * N][2];
    private static int reduced = 0;
}
