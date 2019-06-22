import java.io.File;
import java.util.Arrays;

/**
 * 
 * Task F3
 *
 */
public class RunnableF3 extends Data implements Runnable {

	public RunnableF3(int n, int value) {
		super(n, value);
	}

	@Override
	public void run() {
		System.out.println("Task F3 started");
		Vector va, vb, ve;
		Matrix ma, mb, mm;
		va = inputVector();
		vb = inputVector();
		ma = inputMatrix();
		mb = inputMatrix();
		mm = inputMatrix();
		ve = f3(va, vb, ma, mb, mm);
		outputVector(ve, new File("f3.txt"));
		System.out.println("Task F3 ended");
	}
	
	/**
	 * F3: E = (MA * MM) * B + MB * SORT(A)
	 * @param va
	 * @param vb
	 * @param ma
	 * @param mb
	 * @param mm
	 * @return Vector E
	 */
	private Vector f3(final Vector va, final Vector vb, 
			final Matrix ma, final Matrix mb, final Matrix mm) {
		return add(mult(vb, mult(ma, mm)), mult(sort(va), mb));
	}
	
	private Vector sort(final Vector va) {
		int[] res = new int[va.size()];
		for(int i = 0; i < res.length; i++) {
			res[i] = va.get(i);
		}
		Arrays.sort(res);
		Vector sortedVector = new Vector(res.length);
		for(int j = 0; j < sortedVector.size(); j++) {
			sortedVector.set(j, res[j]);
		}
		return sortedVector;
	}

}
