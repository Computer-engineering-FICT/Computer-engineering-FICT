/**
 * ���� �����. ������ � ��� ����� ��'���� ����� Sentenses.
 * ������ ���� ������ �� �������.
 * @author Vova
 *
 */
public class Text {
	/**
	 * ������� ������
	 */
	private Sentenses[] sentenses;

	/**
	 * ����������� �����. ������ �� ���� �����.
	 * @param text
	 */
	public Text(String text) {
		/**
		 * �������� ����� ������. ��� ����������� ������� ������ ����������� ����� getNumberPunctuation(text) 
		 */
		sentenses = new Sentenses [getNumberPunctuation(text)];
		int start=0;
		int k =0;
		/**
		 * ��������� ��'���� ����� �������.
		 */
		for (int i = 0; i < text.length(); i++) {
			char buf = text.charAt(i);
			if (buf=='.'||buf=='!'||buf=='?'){
				if (i+2<text.length()&&text.charAt(i+1)=='.'&&text.charAt(i+2)=='.'){
				//��� ����������� �������, ��� ���������� �� ��� ������
				sentenses [k] = new Sentenses(text.substring(start, i+3));	
				i=i+3;
				start = i;
				k++;
				}else{
					//��� ����� ����������� �������, ��� ��� ���������� �� ������, �� ���� ������ �� �������
					sentenses [k] = new Sentenses(text.substring(start, i+1));
					start = i+1;
					
					k++;
				}
			}
			
		}
	}
	
	/**
	 * ����� ���� ������� ������ � �����
	 * @param str �����
	 * @return �������� ������
	 */
	public static int getNumberPunctuation(String str) {
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == '.' || str.charAt(i) == '!'
					|| str.charAt(i) == '?') {
				if ((i + 2) < str.length() && str.charAt(i + 1) == '.'
						&& str.charAt(i + 2) == '.') {
					count++;
					i = i + 2;
				} else {
					count++;

				}
			}

		}
		return count;
	}
}
