package lab5;


public class Main {
	
	public static void main(String[] args) {
		double[][] semiGraph = { { 3, 2, 0 }, 
				                 { 0, 0, 3 }, 
				                 { 4, 0, 0 }, 
				              };
		
		MarkovGraph graph = MarkovGraph.fromSemiMarkovGraph(semiGraph);
		
		double[] res = graph.simulate(1000);
		System.out.println("modeling :");
		double sum = 0;
		for(int i = 0; i < res.length; i++) {
			sum += res[i];
			System.out.println(res[i]);
		}
		
		System.out.println(sum);
		
		System.out.println("solution of equation :");
		
		res = graph.modeling();
		sum = 0;
		for(int i = 0; i < res.length; i++) {
			sum += res[i];
			System.out.println(res[i]);
		}
		
		System.out.println(sum);
		
	}

}

