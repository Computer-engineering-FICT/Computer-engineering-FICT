/**
 * @author Vova
 * ���� �������. ³������, �� ������ ���� ������� �� ����� �� ����������
 */
public class Sentenses {
	/**
	 * ����� ��� � ������
	 */
	private Word[] words ;
	/**
	 * ����� ����������
	 */
	private Punkt[] punkts ;
	/**
	 * �����������
	 * @param sentens ������� ��� ����� �������
	 */
	public Sentenses(String sentens) {
		sentens = sentens.trim();
		//���������� �����. 
		// ����� getNumberWord(sentens) ������� ������� ���
		words = new Word[getNumberWord(sentens)];
		//���������� ���������� 
		//getNumberPunctuation(sentens) ����� ������� ������� ����� ���������� 
		punkts = new Punkt[getNumberPunctuation(sentens)];	
		int k = 0;
		int r = 0;
		/**
		 * ���� ��������� ������ � ���� �� �� ������� ��������� �� ������� �� ����� ���
		 * ���� � ��� ��� ������ ������ � ��� ����������, �� ���� ����������� � ������ ���� �����
		 * ���� � ���� ��������� �� ������ � �������� �� � ��� � ���� ���� ����������
		 * ���� �, �� ��������� ����� � ���� ���������� (� ����� ��� ����� � ���� ���������� � �� ��������)
		 * ���� ���� � ���� ����������, �� ������ ��������� �����
		 */
		String[] wordAndSumbols = sentens.split(" ");
		/**
		 * �������� ����������� ����� �� ����������
		 */
		for (String word : wordAndSumbols) {
			
			if (word.charAt(word.length() - 1) == '!'
					|| word.charAt(word.length() - 1) == ','
					|| word.charAt(word.length() - 1) == '?'
					|| word.charAt(word.length() - 1) == '-'
					|| word.charAt(word.length() - 1) == '.') {
				if (word.length()>2&&word.charAt(word.length() - 2) == '.'
						&& word.charAt(word.length() - 3) == '.') {
					//��������� ������� ���� ��� ������
					/**
					 * ��������� �����
					 */
					words[k] = new Word(word.substring(0, word.length() - 3));
					/**
					 * ��������� ����������
					 */
					punkts[r] = new Punkt(word.substring(word.length() - 3));
					//��� ��������� ������ ��������� ���� ������� ����� �� ���������� ����� (�� ���� �� ��������� �� ����� ��� ������� split
					//������ �� ��� �� �����������
					System.out.print(" ");
					k++;
					r++;
				}else{
					/**
					 * ��������� �����
					 */
					words[k] = new Word(word.substring(0, word.length() - 1));
					/**
					 * ��������� ����������
					 */
					punkts[r] = new Punkt(word.substring(word.length() - 1));
					System.out.print(" ");
					k++;
					r++;
				}
			} else {
				/**
				 * ��������� �����
				 */
				words[k] = new Word(word);
				System.out.print(" ");
				k++;

			}
			;
		}
	}

	public static int getNumberWord(String str) {
		return str.split(" ").length;
	}

	public static int getNumberPunctuation(String str) {
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == '.' || str.charAt(i) == '!'
					|| str.charAt(i) == '?' || str.charAt(i) == ','
					|| str.charAt(i) == '-') {
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
