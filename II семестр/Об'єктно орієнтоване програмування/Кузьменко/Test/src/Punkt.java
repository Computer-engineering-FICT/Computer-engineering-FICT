/**
 * @author Vova
 *���� ��� ����������
 *�������� ���������� �� � ������ ������� char � � �����, �� ���� ���� �� ���������� ��� ������, � �� ���� ������� ����������
 */
public class Punkt {
	private char[] punctuation;

	public Punkt(String s) {
		s.trim();
		punctuation = s.toCharArray();
		for (char c : punctuation) {
			//��� ���� �� � � ����, ������� ����������
			System.out.print(c);
		}
	}
}
