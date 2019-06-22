package os.lab4;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Planner {

	private int[][] connectivityMatrix;
	private int[] vertexWeight;
	private ArrayList<Integer> roots = new ArrayList<Integer>();
	private ArrayList<Integer> edges = new ArrayList<Integer>();
	
	private ArrayList<Integer> tempCriticalWay;
	
	private Planner(int n) {
		connectivityMatrix = new int[n][];
		for (int i = 0; i < connectivityMatrix.length; i++) {
			connectivityMatrix[i] = new int[n];
		}
		vertexWeight = new int[n];
	}
	
	public static Planner readGraphFromFile(File file) throws FileNotFoundException {
		Scanner input = new Scanner(new FileInputStream(file));
		ArrayList<Integer> buf = new ArrayList<Integer>();
		while (input.hasNext()) {
			buf.add(input.nextInt());
		}
		input.close();
		int k = 0;
		Planner planner = new Planner(buf.get(k));
		for (int i = 0; i < planner.connectivityMatrix.length; i++) {
			for (int j = 0; j < planner.connectivityMatrix[i].length; j++) {
				planner.connectivityMatrix[i][j] = buf.get(++k); 
			}
		}
		for (int i = 0; i < planner.vertexWeight.length; i++) {
			planner.vertexWeight[i] = buf.get(++k);
		}	
		getRootsAndEdges(planner);
		return planner;
	}
	
	public String getLog() {
		StringBuilder logger = new StringBuilder("");
		logger.append("--------------------------------------------\n");
		outputMatrix(logger);
		boolean last = false;
		int i = 1;
		while (!last) {
			ArrayList<Integer> criticalWay = findCriticalWay();
			logger.append("Критический путь №");
			logger.append(String.valueOf(i++));
			logger.append("\n");
			int sum = 0;
			for (int j = 0; j < (criticalWay.size() - 1); j++) {
				logger.append(String.valueOf(criticalWay.get(j)));
				logger.append(" -> ");
				sum += vertexWeight[criticalWay.get(j)];
			}
			sum += vertexWeight[criticalWay.get(criticalWay.size() - 1)];
			logger.append(String.valueOf(criticalWay.get(criticalWay.size() - 1)));
			logger.append("\n");
			logger.append("Tкр(вершин) = ");
			logger.append(String.valueOf(sum));
			logger.append("\n");
			int allSum = 0;
			for (int j = 0; j < vertexWeight.length; j++) {
				allSum += vertexWeight[j];
			}
			logger.append("Tmax(вершин) = ");
			logger.append(String.valueOf(allSum));
			logger.append("\n");
			logger.append("Nlow = ");
			logger.append(String.valueOf(allSum / sum));
			logger.append("\n");
			int connectSum = 0;
			for (int j = 0; j < (criticalWay.size() - 1); j++) {
				connectSum += connectivityMatrix[criticalWay.get(j)][criticalWay.get(j + 1)];
			}
			logger.append("Tкр(пересылок) = ");
			logger.append(String.valueOf(connectSum));
			logger.append("\n");
			int allConnectSum = 0;
			for (int j = 0; j < connectivityMatrix.length; j++) {
				for (int k = 0; k < connectivityMatrix[j].length; k++) {
					allConnectSum += connectivityMatrix[j][k];
				}
			}
			logger.append("Tmax(пересылок) = ");
			logger.append(String.valueOf(allConnectSum));
			logger.append("\n");
			logger.append("N = ");
			logger.append(String.valueOf(connectivityMatrix.length));
			logger.append("\n");
			while (criticalWay.size() > 0) {
				int min = criticalWay.get(0);
				int minPosition = 0;
				for (int j = 0; j < criticalWay.size(); j++) {
					if (criticalWay.get(j) < min) {
						min = criticalWay.get(j);
						minPosition = j;
					}
				}
				int[][] newConnectiveMatrix = new int[connectivityMatrix.length - 1][];
				for (int j = 0; j < newConnectiveMatrix.length; j++) {
					newConnectiveMatrix[j] = new int[newConnectiveMatrix.length];
				}
				for (int j = 0; j < min; j++) {
					for (int k = 0; k < min; k++) {
						newConnectiveMatrix[j][k] = connectivityMatrix[j][k];
					}
				}
				for (int j = min + 1; j < connectivityMatrix.length; j++) {
					for (int k = 0; k < min; k++) {
						newConnectiveMatrix[j - 1][k] = connectivityMatrix[j][k];
					}
				}
				for (int j = 0; j < min; j++) {
					for (int k = min + 1; k < connectivityMatrix[j].length; k++) {
						newConnectiveMatrix[j][k - 1] = connectivityMatrix[j][k];
					}
				}
				for (int j = min + 1; j < connectivityMatrix.length; j++) {
					for (int k = min + 1; k < connectivityMatrix[j].length; k++) {
						newConnectiveMatrix[j - 1][k - 1] = connectivityMatrix[j][k];
					}
				}
				criticalWay.remove(minPosition);
				for (int j = 0; j < criticalWay.size(); j++) {
					criticalWay.set(j, criticalWay.get(j) - 1);
				}
				connectivityMatrix = newConnectiveMatrix;
				getRootsAndEdges(this);
				int[] newVertexWeight = new int[vertexWeight.length - 1];
				for (int j = 0; j < min; j++) {
					newVertexWeight[j] = vertexWeight[j];
				}
				for (int j = min + 1; j < vertexWeight.length; j++) {
					newVertexWeight[j -1] = vertexWeight[j];
				}
				vertexWeight = newVertexWeight;
				if (newConnectiveMatrix.length == 0) {
					last = true;
				}
			}
			logger.append("Произведено зануление критического пути.\n");
			logger.append("--------------------------------------------\n");
			if (!last) {
				outputMatrix(logger);
			}
		}
		return logger.toString();
	}
	
	private static void getRootsAndEdges(Planner planner) {
		planner.roots = new ArrayList<Integer>();
		planner.edges = new ArrayList<Integer>();
		for (int i = 0; i < planner.connectivityMatrix.length; i++) {
			boolean edgeFlag = true;
			boolean rootFlag = true;
			int j = 0;
			while (j < planner.connectivityMatrix.length) {
				if (planner.connectivityMatrix[i][j] != 0) {
					edgeFlag = false;
				}
				if (planner.connectivityMatrix[j][i] != 0) {
					rootFlag = false;
				}
				j++;
			}
			if (edgeFlag) {
				planner.edges.add(i);
			}
			if (rootFlag) {
				planner.roots.add(i);
			}
		}
	}
	
	private void outputMatrix(StringBuilder logger) {
		logger.append("Матрица связности графа:\n");
		for (int i = 0; i < connectivityMatrix.length; i++) {
			for (int j = 0; j < connectivityMatrix[i].length; j++) {
				logger.append(String.valueOf(connectivityMatrix[i][j]));
				logger.append(" ");
			}
			logger.append("\n");
		}
		logger.append("Веса вершин графа:\n");
		for (int i = 0; i < vertexWeight.length; i++) {
			logger.append(String.valueOf(vertexWeight[i]));
			logger.append(" ");
		}
		logger.append("\n");
	}
	
	private ArrayList<Integer> findCriticalWay() {
		int maxSum = 0;
		ArrayList<Integer> way = new ArrayList<Integer>();
		for (int i = 0; i < roots.size(); i++) {
			ArrayList<Integer> tempWay = new ArrayList<Integer>();
			int tempSum = 0;
			tempSum = step(roots.get(i), tempWay, tempSum);
			if (tempSum > maxSum) {
				maxSum = tempSum;
				way = tempCriticalWay;
			}
		}
		return way;
	}
	
	private int step(int position, ArrayList<Integer> way, int sum) {
		if (!edges.contains(position)) {
			ArrayList<Integer> criticalWay = new ArrayList<Integer>();
			int criticalSum = 0;
			for (int i = 0; i < connectivityMatrix[position].length; i++) {
				if (connectivityMatrix[position][i] > 0) {
					ArrayList<Integer> tempWay = new ArrayList<Integer>();
					for (int j = 0; j < way.size(); j++) {
						tempWay.add(way.get(j));
					}
					tempWay.add(position);
					int tempSum = sum + vertexWeight[position];
					tempSum = step(i, tempWay, tempSum);
					if (tempSum > criticalSum) {
						criticalSum = tempSum;
						criticalWay = tempCriticalWay;
					}
				}
			}
			tempCriticalWay = criticalWay;
			return criticalSum;
		}
		else {
			way.add(position);
			tempCriticalWay = way;
			sum += vertexWeight[position];
			return sum;
		}
	}
	
}