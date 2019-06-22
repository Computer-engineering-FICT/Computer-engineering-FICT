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


    public static void outputVector(Vector vector) {
        if (vector.size() <= 12) {
            System.out.print(vector.toString());
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


    public static int operation1(int tid) {
        return CalculateUtils.mult(Executor.B, Executor.C, tid);
    }

    public static int operation2(int id) {
        int l = (id - 1) * Executor.H;
        int r = id * Executor.H;

        for (int i = l; i < r; i++) {
            if (Executor.E.get(i) > Executor.e) {
                Executor.e = Executor.E.get(i);
            }
        }
        return Executor.e;
    }

    public static void operation3(final int ei, final int vi, final Vector Ti, final Matrix MOi, int id) {

        Vector temp0 = new Vector(Executor.N);
        int l = (id - 1) * Executor.H;
        int r = id * Executor.H;

        for (int i = l; i < r; i++) {
            temp0.set(i, Executor.Z.get(i) * vi);
        }

        for (int i = l; i < r; i++) {
            Executor.A.set(i, temp0.get(i) + mult(Ti, mult(MOi, Executor.MK, id), ei, id).get(i));
        }
    }

}
