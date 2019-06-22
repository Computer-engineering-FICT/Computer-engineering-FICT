package com.cm.lab5;


// TODO: Auto-generated Javadoc
/**
 * The Class GraphUtil.
 */
public class GraphUtil {
	
	/** The start. */
	static int start;
	
	/** The finish. */
	static int finish;
	
	/** The sum. */
	static int sum=0;
	
	/** The end flag. */
	boolean endFlag=true;
	
	/** The nodes. */
	Node [] nodes;
	
	/** The matrix. */
	int [][] matrix;
	
	/**
	 * Instantiates a new graph util.
	 *
	 * @param matrix the matrix
	 * @param start the start
	 * @param finish the finish
	 */
	@SuppressWarnings("static-access")
	public GraphUtil(int [][] matrix, int start, int finish) {
		this.matrix = matrix;
		nodes = new Node[matrix.length];
		for (int i = 0; i < matrix.length; i++) {
			nodes[i] = new Node(i);
		}
		this.start = start;
		this.finish = finish;
	}
	
	/**
	 * Gets the node.
	 *
	 * @param index the index
	 * @return the node
	 */
	public Node getNode(int index){
		return nodes[index];
	}
	
	/**
	 * Builds the graf.
	 */
	public void buildGraf(){
		for (int i = 0; i < matrix.length; i++) {
			Node buf = getNode(i);
			for (int j = 0; j < matrix[i].length; j++) {
				if (matrix[i][j]!=0){
					buf.addLinkFromThisNode(matrix[i][j], getNode(j));
					getNode(j).addLinkToThisNode(matrix[i][j], buf);
				}
			}
		}
		System.out.println("\nBuilding completed");
	}
	
	/**
	 * Calc prices nodes.
	 */
	public void calcPricesNodes(){
		nodes[start].price=0;
		
		Level buf = new Level(this);
		buf.addNode(nodes[start]);
		
		buf =buf.buildNextLevel();
		
		
		while (endFlag) {
			buf.calcLevel();
			buf = buf.buildNextLevel();	
		}
		System.out.println("\nCalc node prices completed");
	}
	
	/**
	 * Calc return track.
	 */
	public void calcReturnTrack(){
		System.out.println("\nResult:");
		if (nodes[finish].price==-1){
			System.err.println("Top unattainable");
		}else{
			nodes[finish].printTrack();
			System.out.println("\nPrice Track "+nodes[finish].price);
		}
		
		
	}
	
	
	/**
	 * Prints the graph.
	 */
	public void printGraph(){
		
		for (Node node : nodes) {
			System.out.println(node.toString());
		}
		
		
	}
	
	
}
