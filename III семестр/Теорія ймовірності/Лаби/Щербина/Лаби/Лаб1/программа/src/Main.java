import random.TableGenerator;
import random.TestRandom;

public class Main {
	static final int lengthSample = 10000;
	static int[] outData = new int[lengthSample];
	static final int window = 5;
	static TableGenerator tableGenerator;

	public static void main(String[] args) {
		tableGenerator = new TableGenerator(6, 8);
		for (int i = 0; i < outData.length; i++) {
			outData[i] = tableGenerator.next();
		}
		System.out.println("���������� ������:");
		System.out.println("��������� ���� = "
				+ TestRandom.frequencyTest(outData));
		System.out.println("���������������� ���� = "
				+ TestRandom.differentialTest(outData));
		
		System.out.println("�������� ����");
		double[] result = TestRandom.rankTest(outData, window);
		for (int i = 0; i < result.length; i++) {
			System.out.println(Integer.toBinaryString(i) + " = " + result[i]);
		}
		
		System.out.println("��������� = " + TestRandom.complexityTest(outData));
		
	}
}
