import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * Клас для збереження збереження до файлу та зчитування з файлу колекції
 * <code>SportsmenList</code> як єдиного об’єкту; як послідовності об’єктів класу
 * <code>Sportsmen</code>; як послідовності об’єктів у вигляді тексту.
 */
public class FileSportsmen {
	
	/**
	 * Метод збереження до файлу колекції як єдиного об'єкту 
	 * @param list колекція <code>SportsmenList</code>
	 * @param f файл, в який треба зберегти
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws NullPointerException
	 */
	public static void saveList(SportsmenList list, String f) 
			throws FileNotFoundException, IOException, NullPointerException{
		// Створення потоку виводу до файлу
      ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(f));
		// Збереження колекції до файлу
		out.writeObject(list);
		// Закриття потоку
		out.close();
	}
	
	/**
	 * Метод зчитування з файлу колекції як єдиного об'єкту
	 * @param f файл, який треба читати
	 * @return список <code>Sportsmen</code>
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws NullPointerException
	 */
	public static SportsmenList loadList(String f) 
			throws FileNotFoundException, IOException, ClassNotFoundException,
					NullPointerException{
		SportsmenList temp = null;
		// Створення потоку вводу з файлу
		ObjectInputStream out = new ObjectInputStream(new FileInputStream(f));
		// Читання колекції з файлу
		temp = (SportsmenList) out.readObject();
		// Закриття потоку
		out.close();
		return temp;
	}
	
	/**
	 * Метод збереження масиву об'єктів Sportsmen до файлу
	 * @param array масив  об'єктів <code>Sportsmen</code>
	 * @param f файл, в який треба зберегти
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws NullPointerException
	 */
	public static void saveSportsmen(Sportsmen[] array, String f)
			throws FileNotFoundException, IOException, NullPointerException{
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(f));
		// Змінна temp зберігає значення довжини масиву в вигляді об'єкту
		// і записується до файлу першою
		Integer temp = new Integer(array.length);
		out.writeObject(temp);
		for(int i = 0; i < array.length; i++){
			out.writeObject(array[i]);
		}
		out.close();
	}
	
	/**
	 * Метод читання масиву об'єктів <code>Sportsmen</code> з файлу
	 * @param f файл, який треба читати
	 * @return масив об'єктів <code>Sportsmen</code>
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws NullPointerException
	 */
	public static Sportsmen[] loadSportsmen(String f)
			throws FileNotFoundException, IOException, ClassNotFoundException,
					NullPointerException{
	    ObjectInputStream out = new ObjectInputStream(new FileInputStream(f));
	    Integer temp = (Integer) out.readObject();
	    int end = temp.intValue();
	    Sportsmen[] array = new Sportsmen[end];
	    for(int i = 0; i < end; i++){
	    	array[i] = (Sportsmen) out.readObject();
	    }		
		out.close();		
		return array;
	}
	
	/**
	 * Метод збереження обєктів <code>Sportsmen</code> 
	 * у вигляді масиву у вигляді тектсу 
	 * @param array	масив об'єктів <code>Sportsmen</code> 
	 * @param f файл, який треба читати
	 * @throws IOException
	 * @throws NullPointerException
	 */
	public static void saveFields(Sportsmen[] array, String f) 
			throws IOException, NullPointerException{
		// Метод збереження масиву об'єктів Sportsmen до файлу
		// як об'єктів String
		// Кожне поле зберігається окремо
		FileWriter wr = new FileWriter(f);
		// Запис кількості компонент масиву
		wr.append(Integer.toString(array.length));
		for(int i = 0; i < array.length; i++){
			String temp;
			// Необхідні перетворення примітивних типів до String 
			// за допомогою класів-обгорток
			temp = array[i].getFName() + " " + array[i].getLName() + " "
				+ Integer.toString(array[i].getAge()) + " "
				+ array[i].getSex() + " " + array[i].getRank() + " " 
				+ array[i].getSport() + " " + array[i].getCountry();  
			wr.write(temp);
			// Запис розділювача між рядками
			wr.append('\t');
		}
		wr.close();
	}

	/**
 	 * Метод читання масиву обєктів <code>Sportsmen</code> 
	 * у вигляді тектсу 
	 * @param f файл, який треба читати
	 * @return масив об'єктів <code>Sportsmen</code>
	 * @throws IOException
	 * @throws FileNotFoundException
	 * @throws NullPointerException
	 */
	public static String[] loadFields(String f)
			throws IOException, FileNotFoundException, NullPointerException{
		// Метод читання масиву об'єктів String з файлу 
		BufferedReader br = new BufferedReader(new FileReader(f));
		// Зчитування розмірності масиву
		int temp = br.read();
		// Перетворення коду чисел 1 - 49, 2 - 50, ...
		temp = temp - 48;
		String[] array = new String[temp];
	    for(int i = 0; i < temp; i++){
	    	array[i] = "";
	    }
	    for(int i = 0; i < temp; i++){
	    	int buf = 0;
	    	while(buf != '\t'){
	    		buf = br.read();
	    		array[i] += (char)buf;
	    	}
	    }
	    br.close();
		return array;
	}

	public static void main(String[] args) 
		throws FileNotFoundException, NullPointerException, IOException,
			ClassNotFoundException { 
		Sportsmen sp1 = new Sportsmen("Яна", "Клочкова", 29, "Жінка", 
				"4-х кратна олімпійська чемпіонка", "Спортивне плавання",
				"Україна");
		Sportsmen sp2 = new Sportsmen("Ганна", "Безсонова", 27, "Жінка",
				"Дворазова бронзова призерка Олімпійських ігор", "Художня" +
				" гімнастика", "Україна");
		Sportsmen sp3 = new Sportsmen("Андрій", "Аршавін", 30, "Чоловік", 
				"Заслужений мастер спорту Росії", "Футбол", "Росія");
		SportsmenList list = new SportsmenList();
		list.add(sp1);
		list.add(sp2);
		list.add(sp3);

		saveList(list, "C:/sportsmen.dat");
		loadList("C:/sportsmen.dat");
		System.out.println("Список: ");
		list.listOnScreen();

		Sportsmen [] array = {sp1, sp2, sp3};
		saveSportsmen(array, "C:/sportsmen.dat");
		loadSportsmen("C:/sportsmen.dat");
		for(int i = 0; i < array.length; i++){
			array[i].printAll();
		}

		saveFields(array, "C:/sportsmen.dat");
		loadFields("C:/sportsmen.dat");
		for(int i = 0; i < array.length; i++){
			array[i].printAll();
		}
	}
}
	