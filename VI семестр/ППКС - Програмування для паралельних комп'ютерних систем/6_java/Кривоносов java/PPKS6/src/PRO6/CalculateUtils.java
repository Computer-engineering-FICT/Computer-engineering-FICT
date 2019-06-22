package PRO6;

public class CalculateUtils {


    public static Vector inputVector(int value) {
        Vector vector = new Vector(Executor.N);
        for (int i = 0; i < vector.size(); i++) {
            vector.set(i, value);
        }
        return vector;
    }


    public static Matrix inputMatrix(int value) {
        Matrix matrix = new Matrix(Executor.N);
        for (int i = 0; i < matrix.size(); i++) {
            for (int j = 0; j < matrix.size(); j++) {
                matrix.set(i, j, value);
            }
        }
        return matrix;
    }


    public static void outputMatrix(Matrix matrix) {
        if (matrix.size() <= 12) {
            System.out.print(matrix.toString());
        }
    }

    private static Vector mult(final Vector vector, final Matrix matrix, final int ei, final int id) {

        Vector result = new Vector(Executor.N);
        int l = (id - 1) * Executor.H;
        int r = id * Executor.H;
        int sum;

        for (int i = l; i < r; i++) {
            sum = 0;
            for (int j = 0; j < Executor.N; j++) {
                sum = sum + vector.get(j) * matrix.get(i, j);
            }
            sum = sum * ei;
            result.set(i, sum);
        }

        return result;
    }

    private static Matrix mult(final Matrix left, final Matrix right, final int id) {
        int l = (id - 1) * Executor.H;
        int r = id * Executor.H;
        Matrix result = new Matrix(left.size());
        for (int i = l; i < r; i++) {
            for (int j = 0; j < left.size(); j++) {
                result.set(i, j, 0);
                for (int y = 0; y < left.size(); y++) {
                    result.set(i, j, result.get(i, j) + left.get(i, y) * right.get(y, j));
                }
            }
        }
        return result;
    }

    private static int mult(final Vector left, final Vector right, final int id) {

        int l = (id - 1) * Executor.H;
        int r = id * Executor.H;
        int result = 0;
        for (int i = l; i < r; i++) {
            result += left.get(i) * right.get(i);
        }


        return result;
    }






    public static void operations(final int vi, final int alphai, final Matrix MRi, int id) {

        Matrix temp0 = new Matrix(Executor.N);
        Matrix temp1 = new Matrix(Executor.N);
        int l = (id - 1) * Executor.H;
        int r = id * Executor.H;
        for(int i = l; i<r; i++){
            for(int j = 0; j < Executor.N;j++){
                temp0.set(i, j, Executor.MO.get(i,j)*vi);
            }
        }


            temp1 = mult(MRi, Executor.MT, id);
        for(int i = l; i<r; i++){
            for(int j = 0; j < Executor.N;j++){
                temp1.set(i, j, temp1.get(i, j)*alphai);
            }
        }


        for (int i = l; i < r; i++) {
            for(int j = 0; j < Executor.N; j++){
                Executor.MA.set(i,j, temp0.get(i,j) + temp1.get(i, j));
            }

        }
    }

}
