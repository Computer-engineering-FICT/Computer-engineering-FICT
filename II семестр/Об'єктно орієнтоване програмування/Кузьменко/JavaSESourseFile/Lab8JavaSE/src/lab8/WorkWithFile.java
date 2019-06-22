package lab8;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

/**
 * @author Lenovo Клас включає 6 методів, для виконання операції з файлами
 */

public class WorkWithFile {
	/** Колекція для запису */
	private MyCollection collection;
	/** послідовність об*єктів, які обєднані масивом */
	private Ammunition[] ammunitions;

	/** конструктор для колекції */
	public WorkWithFile(MyCollection col) {
		collection = col;
		ammunitions = col.toArray();
	}

	/** конструктор для послідовності об*єктів */
	public WorkWithFile(Ammunition[] am) {
		ammunitions = am;
	}

	/** метод записує у файл колекцію */
	public void WriteMyCollection() {
		File myCollectionFile = new File(
				"C:\\Users\\Lenovo\\Desktop\\MyCollection.txt");
		OutputStream os = null;
		try {
			os = new FileOutputStream(myCollectionFile);
		} catch (FileNotFoundException e) {
			System.out.println("FileNotFoundException");
		}
		ObjectOutputStream oos = null;
		try {
			oos = new ObjectOutputStream(os);
			oos.writeObject(collection);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				oos.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/** метод зчитує колекцію, та повертає її */
	public MyCollection ReadMyCollection() {
		File myCollectionFile = new File(
				"C:\\Users\\Lenovo\\Desktop\\MyCollection.txt");
		InputStream is = null;
		MyCollection col = null;
		try {
			is = new FileInputStream(myCollectionFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		ObjectInputStream ois = null;
		try {
			ois = new ObjectInputStream(is);
			col = (MyCollection) (ois.readObject());

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ois.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return col;
	}

	/** метод записує послідовність об*єктів */
	public void WriteAmmunitions() {
		File ammunitionsFile = new File(
				"C:\\Users\\Lenovo\\Desktop\\ammunitions.txt");
		OutputStream os = null;
		try {
			os = new FileOutputStream(ammunitionsFile);
		} catch (FileNotFoundException e) {
			System.out.println("FileNotFoundException");
			try {
				os.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		ObjectOutputStream oos = null;
		try {
			oos = new ObjectOutputStream(os);
			oos.writeObject(ammunitions);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				oos.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/** метод зчитує послідовність об*єктів, у вигляді масиву та повертає його */
	public Ammunition[] ReadAmmunition() {
		File ammunitionsFile = new File(
				"C:\\Users\\Lenovo\\Desktop\\ammunitions.txt");
		InputStream is = null;
		Ammunition[] am = null;
		try {
			is = new FileInputStream(ammunitionsFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			try {
				is.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		ObjectInputStream ois = null;
		try {
			ois = new ObjectInputStream(is);
			am = (Ammunition[]) ois.readObject();

		} catch (IOException e) {
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ois.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();

			}
		}
		return am;
	}

	/** метод записує на файл інформацію про об*єкти у вигляді тексту */
	public void WriteInformation() {
		File amInformation = new File(
				"C:\\Users\\Lenovo\\Desktop\\amInformation.doc");
		FileWriter fw = null;
		try {
			fw = new FileWriter(amInformation);
		} catch (IOException e) {
			e.printStackTrace();
			try {
				fw.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		for (Ammunition ammunition : ammunitions) {
			try {
				fw.write(ammunition.getInformation());
			} catch (IOException e) {
				e.printStackTrace();
			} catch (NullPointerException e) {
				System.out.println("null");
			}
		}
		try {
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/** метод зчитує інформацію про об*єкти, повертає текст String даних */
	public String ReadInformation() {
		File amInformation = new File(
				"C:\\Users\\Lenovo\\Desktop\\amInformation.doc");
		FileReader fr = null;
		String txt = null;
		try {
			fr = new FileReader(amInformation);
		} catch (FileNotFoundException e) {
			System.out.println("Нема файла");
			e.printStackTrace();
			try {
				fr.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		BufferedReader br = new BufferedReader(fr);
		try {
			txt = br.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return txt;
	}
}
