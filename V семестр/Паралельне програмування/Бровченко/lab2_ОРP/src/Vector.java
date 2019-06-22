/**
 * class Vector
 */

import java.util.Random;

public class Vector {

    private long[] grid;

    Vector(int N) {
        grid = new long[N];
        Random r = new Random();
        for (int i = 0; i < N; ++i)
            grid[i] = r.nextInt(20);
    }

    Vector(long[] grid) {
        this.grid = grid;
    }

    public int getSize() {
        return grid.length;
    }

    public long get(int i) {
        return grid[i];
    }

    public Vector sum(Vector v) {
        int N = getSize();
        long[] newGrid = new long[N];
        for (int i = 0; i < N; ++i)
            newGrid[i] = grid[i] + v.get(i);
        return new Vector(newGrid);
    }

    public Vector diff(Vector v) {
        int N = getSize();
        long[] newGrid = new long[N];
        for (int i = 0; i < N; ++i)
            newGrid[i] = grid[i] - v.get(i);
        return new Vector(newGrid);
    }

    public Vector multiply(long a) {
        int N = getSize();
        long[] newGrid = new long[N];
        for (int i = 0; i < N; ++i)
            newGrid[i] = grid[i] * a;
        return new Vector(newGrid);
    }

    public Vector sort() {
        int N = getSize();
        long[] newGrid = grid.clone();
        for (int i = 0; i < N; ++i) {
            for (int k = 0; k < N - i - 1; ++k) {
                if (newGrid[k] > newGrid[k + 1]) {
                    long t = newGrid[k];
                    newGrid[k] = newGrid[k + 1];
                    newGrid[k + 1] = t;
                }
            }
        }
        return new Vector(newGrid);
    }

    @Override
    public String toString() {
        String res = "";
        int N = getSize();
        for (int i = 0; i < N; ++i)
            res += grid[i] + " ";
        return res;
    }
}
