import java.io.PrintStream;


public class BMatrix {

	private int[][] matrix;
	private int size;
	
	public BMatrix(int size) {
		this.size = size;
		matrix = new int[size][size];
		for (int i=0; i<size; i++)
			for (int j=0; j<size; j++)
				matrix[i][j] = 0;
	}


	public BMatrix(int[][] mx) {
		matrix = mx;
		size = mx[0].length;
	}

	public BMatrix(BMatrix mx) {
		this(mx.size);
		for (int i=0; i<size; i++)
			for (int j=0; j<size; j++)
				matrix[i][j] = mx.matrix[i][j];
	}

/*
	public void setAt(int i, int j) {
		matrix[i][j] = 1;
	}

	public void resetAt(int i, int j) {
		matrix[i][j] = 0;
	}

	public void setRow(int row, int[] values) {
		if (values.length != size)
			return;
		if (row >= size)
			return;
		for (int i=0; i<values.length; i++)
			matrix[row][i] = values[i];
	}

	public void setColumn(int col, int[] values) {
		if (values.length != size)
			return;
		if (col >= size)
			return;
		for (int i=0; i<values.length; i++)
			matrix[i][col] = values[i];
	}

*/

	public BMatrix mul(BMatrix mx) {
		BMatrix result = new BMatrix(size);
		int i, j, k;
		for (i=0; i<size; i++)
			for (j=0; j<size; j++)
				for (k=0, result.matrix[i][j]=0; k<size; k++)
					result.matrix[i][j] |= matrix[i][k] & mx.matrix[k][j];
		return result;
	}


	public void add(BMatrix mx) {
		if (mx.size != size)
			return;
		for (int i=0; i<size; i++)
			for (int j=0; j<size; j++)
				matrix[i][j] |= mx.matrix[i][j];
	}

	public void print(PrintStream out) {
		for (int i=0; i<size; i++) {
			for (int j=0; j<size; j++) {
				if (j > 0) out.print(", ");
				out.print(matrix[i][j]);
			}
			out.println();
		}
	}

	static int[][] testMatrix = {
		{0, 1, 1, 0},
		{0, 0, 0, 0},
		{0, 1, 0, 1},
		{0, 0, 1, 0}
	};

	public static void main(String[] args) {
		BMatrix set[] = new BMatrix[4];
		BMatrix result;
		int i;

		set[0] = new BMatrix(testMatrix);
		result = new BMatrix(set[0]);
		for (i=1; i<4; i++) {
			set[i] = set[i-1].mul(set[0]);
			result.add(set[i]);
		}
		System.out.println("Source matrix:");
		set[0].print(System.out);
		for (i=0; i<4; i++) {
			System.out.print('E');
			System.out.println(i+1);
			set[i].print(System.out);
		}
		System.out.println("Resulting matrix:");
		result.print(System.out);
	}
}
