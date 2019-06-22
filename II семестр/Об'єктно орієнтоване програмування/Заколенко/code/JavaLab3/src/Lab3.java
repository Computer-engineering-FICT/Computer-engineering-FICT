public class Lab3 {

	public static void main(String[] args) {
		String text = "Толкин подготовил несколько карт Средиземья и отдельных его областей, "
				+ "где проходят события его произведений! Не все они были опубликованы "
				+ "при жизни.";
		String Text[] = text.split("\\.|!|\\?");
		String Text2[] = text.split("\\.|!|\\?"); 
		boolean k = true;
		for (int i = 0; i < Text.length; i++) {
			int a = Text[i].indexOf('д');
			int b = Text[i].lastIndexOf('а');
			if (a != -1 && b != -1) {
				Text[i] = Text[i].substring(0, a) + Text[i].substring(b + 1);
				k = false;
			}
		}
		if (k) {
			System.out.println("В данной строке не найдено заданых символов.");
		} else {
			System.out.println("Вы ввели текст:" + "\n" + text);
			System.out.println("Отредактированный текст:");
			for (int i = 0, z = 0; i < Text.length; i++) {
				z = z + Text2[i].length();
				System.out.print(Text[i] + text.charAt(z + i));
			}
		}
	}
}
