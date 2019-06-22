package cm.exem.calcLoading;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long startTime = System.currentTimeMillis();
		Graf g = new Graf();
		g.config();
		g.buildTree();
		g.calcPropability(g.buildBalansSystem(g.buildUnceasingGraf()));
		g.calcLoadingDevice();
		long timeSpent = System.currentTimeMillis() - startTime;
		System.out.println("программа выполнялась " + timeSpent + " миллисекунд");
	}

}
