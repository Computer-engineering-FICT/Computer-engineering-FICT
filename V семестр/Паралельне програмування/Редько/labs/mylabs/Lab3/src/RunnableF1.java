import java.io.File;


/**
 * 
 * Task F1
 *
 */
public class RunnableF1 extends Data implements Runnable {

	public RunnableF1(int n, int value) {
		super(n, value);
	}

	@Override
	public void run() {
		System.out.println("Task F1 started");
		Vector va, vb, vc, vd, ve;
		Matrix ma, mz;
		va = inputVector();
		vb = inputVector();
		vc = inputVector();
		vd = inputVector();
		ma = inputMatrix();
		mz = inputMatrix();
		ve = f1(va, vb, vc, vd, ma, mz);
		outputVector(ve, new File("f1.txt"));
		System.out.println("Task F1 ended");
	}
	
	/**
	 * F1: E = A + B + C + D * (MA * MZ) 
	 * 
	 * @param va
	 * @param vb
	 * @param vc
	 * @param vd
	 * @param ma
	 * @param mz
	 * @return Vector E
	 */
	private Vector f1(final Vector va, final Vector vb, final Vector vc, 
			final Vector vd, final Matrix ma, final Matrix mz) {
		return add(add(add(va, vb), vc), mult(vd, mult(ma, mz)));
		
	}

}
