import java.io.*;
// Імпортуються ObjectOutputStream, ObjectInputStream, FileOutputStream, FileInputStream 

public class Lab6{
	public static void saveWeaponsList(WeaponsList parameter, String file) throws FileNotFoundException, IOException, NullPointerException{
		// Створення потоку виводу до файлу
		ObjectOutputStream str = new ObjectOutputStream(new FileOutputStream(file));
		// Збереження колекції до файлу
		str.writeObject(parameter);
		// Закриття потоку
		str.close();
	}
	
	public static WeaponsList loadWeaponsList(String file) throws FileNotFoundException, IOException, ClassNotFoundException, NullPointerException{
		WeaponsList temp = null;	
		// Створення потоку вводу з файлу
		ObjectInputStream str = new ObjectInputStream(new FileInputStream(file));
		// Читання колекції з файлу
		temp = (WeaponsList) str.readObject();
		// Закриття потоку
		str.close();
		return temp;
	}
	
	public static void saveWeapons(Weapons[] parameter, String file) throws FileNotFoundException, IOException, NullPointerException{
		// Метод збереження масиву об'єктів Weapons до файлу
		ObjectOutputStream str = new ObjectOutputStream(new FileOutputStream(file));
		// Змінна temp зберігає значення довжини масиву в вигляді об'єкту і записується до файлу першою
		Integer temp = new Integer(parameter.length);
		str.writeObject(temp);
		for(int i = 0; i < parameter.length; i++){
			str.writeObject(parameter[i]);
		}
		str.close();
	}
	
	public static Weapons[] loadWeapons(String file) throws FileNotFoundException, IOException, ClassNotFoundException, NullPointerException{
		// Метод читання масиву об'єктів Weapons з файлу
	    ObjectInputStream str = new ObjectInputStream(new FileInputStream(file));
	    Integer temp = (Integer) str.readObject();
	    int end = temp.intValue();
	    Weapons[] array = new Weapons[end];
	    for(int i = 0; i < end; i++){
	    	array[i] = (Weapons) str.readObject();
	    }		
		str.close();		
		return array;
	}
	
	public static void saveWeaponsFields(Weapons[] parameter, String file) throws IOException, NullPointerException{
		// Метод збереження масиву об'єктів Weapons до файлу як об'єктів String. Кожне поле зберігається окремо
		FileWriter wr = new FileWriter(file);
		// Запис кількості компонент масиву
		wr.append(Integer.toString(parameter.length));
		for(int i = 0; i < parameter.length; i++){
			String temp;
			// Необхідні перетворення примітивних типів до String за допомогою класів-обгорток
			temp = parameter[i].getName() + " " + parameter[i].getType() + " " + parameter[i].getCalibre() + " " + 
				Short.toString(parameter[i].getLength()) + " " + Float.toString(parameter[i].getMass()) + " " +
				Short.toString(parameter[i].getMagazine()) + " " + Short.toString(parameter[i].getShootingSpeed()) + " " +
				Short.toString(parameter[i].getYear());
			wr.write(temp);
			// Запис розділювача між рядками
			wr.append('\t');
		}
		wr.close();
	}
	
	public static String[] loadWeaponsFields(String file) throws IOException, FileNotFoundException, NullPointerException{
		// Метод читання масиву об'єктів String з файлу 
		BufferedReader br = new BufferedReader(new FileReader(file));
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
}