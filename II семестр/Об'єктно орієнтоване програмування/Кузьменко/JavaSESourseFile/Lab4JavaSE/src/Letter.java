public class Letter {
	private char data;
	

	public Letter(char sumbol) {
		data = sumbol;
	}

	// ����� ������� ������ �����
	public char getLetter() {
		return data;
	}

	// ����� �������� �� � ������ ����� ��������
	public boolean isVowelLetter() {
		String letter=String.valueOf(data);
		if ((letter.equalsIgnoreCase("a")) | (letter.equalsIgnoreCase("e"))
				| (letter.equalsIgnoreCase("u"))
				| (letter.equalsIgnoreCase("y"))
				| (letter.equalsIgnoreCase("i"))
				| (letter.equalsIgnoreCase("o")))
			return true;
		else
			return false;
	}
}
