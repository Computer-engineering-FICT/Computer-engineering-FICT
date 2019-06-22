package Minimization;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class Kwaine_Minimization {
	
	public static double count_type; //количество неминимизированных входов
	public static double count_mini; //количество минимизированных входов
	public static double block_type; //количество элементов И, ИЛИ до минимизации
	public static double block_mini; //количество элементов И, ИЛИ после минимизации
	
	//формат: "0000v0110v10-1" нАпРиммер
	//s - строка для минимизации
	public static String minimize(String s) {
		StringTokenizer st = new StringTokenizer(s,"v"); //вычисляются все импликанты
		ArrayList<String[]> al = new ArrayList<String[]>();
		count_type = 0;
		block_type = 0; //инициализируются "средства" сбора инфы
		block_mini = 0; //об эффективности минимизаций
		
		int count = st.countTokens(); //считается количество импликант
		
		for (int i = 0; i < count; i++) {
			String[] ss = {st.nextToken(), "0"}; //создаётся особый массив, позволяющий 
			al.add(ss); 			//выделять пройденные и склееные импликанты, 
			count_type += ss[0].length();//0 - не склеен, 1 - склеен
		}
		count_mini = 0;
		block_type = 2 * count - 1;
		
		
		
		//1.4. Если не находится импликант для склеивания, тогда указатель сдвигается на одно место/элемент поближе к концу. А непомеченная из-за этого импликанта используется потом в МКНФ.
		//1.5. Обход списка заканчивается, когда указатель достигает конца списка.

		for (int i = 0; i < al.size(); i++) {
			//1.2. Из списка берётся импликанта/терм...
			char[] first = al.get(i)[0].toCharArray();
			//...и пытается склеится со всеми импликантами/термами которые находятся дальше по списку.
			for (int j = i + 1; j < al.size(); j++) {
				char[] second = al.get(j)[0].toCharArray();
				boolean flag = false, toExit = false;
				int place = -1;
				for (int z = 0; z < second.length & !toExit; z++) {
					//если это импликанта одной и той же группы
					boolean iff = ((first[z] == '-') & (second[z] == '-')) 
						| ((first[z] != '-') & (second[z] != '-'));
					
					if (iff) {
						//если находится различие в бите между импликантами...
						if ((first[z] != second[z]) & !flag) {
							//...ставится флаг, что мы возможно нашли для склеивания
							place = z; flag = true; 
						} else if ((first[z] != second[z]) & flag) { //если ещё раз разница
							place = -1; toExit = true; //то нифига не склеится, выходим из цикла
						}
					} else {
						toExit = true; //вот тут если это импликанты разных групп. Например 0-0 и -00
					}
				}
				
				//если всё же у нас флаг говорит, что склеивание возможно
				if (!toExit & (place != -1)) { 
					second[place] = '-'; //на месте разных бит ставим прочерк "-"
					al.get(i)[1] = "1"; //и маркируем обе импликанты как склееные
					al.get(j)[1] = "1";
					String buff = "";
					for (int z = 0; z < second.length; z++) {
						buff += second[z];
					}
					String[] ss = {buff , "0"}; //добавляем новую импликанту/терм в список
					al.add(ss);
				}
			}
		}
		//обход закончился! Ура! СККФ или СДНФ сформированно!
		String buff = "";
		
		ArrayList<String> implicants = new ArrayList<String>();
		for (int i = 0; i < al.size(); i++) {
			if (al.get(i)[1] == "0") { //все непомеченные импликанты,
				if (!implicants.contains(al.get(i)[0])) {//и неодинаковые к тому же
					implicants.add(al.get(i)[0]); //собираются отдельно!
				}
			}
		}
		
		//обход покрываемости! 
		for (int i = 0; i < implicants.size() & !al.isEmpty(); i++) {
			//берётся импликанта
			char[] first = implicants.get(i).toCharArray();
			for (int j = 0; j < al.size(); j++) {
				//и сравнивается с исходными импликантами побитово
				char[] second = al.get(j)[0].toCharArray();
				boolean toExit = false;
				for (int z = 0; z < second.length & !toExit; z++) {
					boolean iff = (first[z] == '-'); //если в бите стоит прочерк
					//тогда этот бит покрывает, всё по плану
					
					if (!iff & (first[z] != second[z])) { //если в бите не стояло прочерка
						toExit = true; //и к тому же биты разные, значит, увы, импликанта не для этого
					} //исходного терма.
				} //идём к следующему... терму...
				
				if (!toExit) { //но если всё же покрывает!
					al.remove(j); //удаляем исходный терм!
				}
			}
			//тут формируется окончательная строка минимизированной функции.
			if (buff != "") {
				buff += "v";
				block_mini++;
			}
			buff += implicants.get(i);
			block_mini++;
		}

		char[] ww = buff.toCharArray();
		for (int i = 0; i < ww.length; i++) {
			if ((ww[i] != 'v') & (ww[i] != '-'))
				count_mini++;
		}
		
		return buff;
	}
	
	//эффективность минимизации по количеству входов
	public static double getTermEfficient() {
		return count_type / count_mini;
	}
	//эффективность минимизации по количеству элементов/блоков	
	public static double getBlockEfficient() {
		return block_type / block_mini;
	}
}
