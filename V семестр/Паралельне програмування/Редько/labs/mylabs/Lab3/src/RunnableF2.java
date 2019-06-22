import java.io.File;


/**
 * 
 * Task F2
 *
 */
public class RunnableF2 extends Data implements Runnable {

	public RunnableF2(int n, int value) {
		super(n, value);
	}
	
	@Override
	public void run() {
		System.out.println("Task F2 started");
		Matrix ma, mb, mc, md;
		ma = inputMatrix();
		mb = inputMatrix();
		mc = inputMatrix();
		md = f2(ma, mb, mc);
		outputMatrix(md, new File("f2.txt"));
		System.out.println("Task F2 ended");
	}
	
	/**
	 * F2: MD = (MA * MB) * TRANS(MC)
	 * @param ma
	 * @param mb
	 * @param mc
	 * @return Matrix MD
	 */
	private Matrix f2(final Matrix ma, final Matrix mb, final Matrix mc) {
		return mult(mult(ma, mb), transpose(mc));
	}
	
	private Matrix transpose(Matrix m) {
		for (int i = 0; i < m.size(); i++) {
            for (int j = i + 1; j < m.size(); j++) {
                int temp = m.get(i, j);
                m.set(i, j, m.get(j, i));
                m.set(j, i, temp);
            }
        }
		return m;
	}

}
