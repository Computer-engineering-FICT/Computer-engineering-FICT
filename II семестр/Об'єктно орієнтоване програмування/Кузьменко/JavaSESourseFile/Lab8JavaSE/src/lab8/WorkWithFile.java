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
 * @author Lenovo ���� ������ 6 ������, ��� ��������� �������� � �������
 */

public class WorkWithFile {
	/** �������� ��� ������ */
	private MyCollection collection;
	/** ����������� ��*����, �� ������ ������� */
	private Ammunition[] ammunitions;

	/** ����������� ��� �������� */
	public WorkWithFile(MyCollection col) {
		collection = col;
		ammunitions = col.toArray();
	}

	/** ����������� ��� ����������� ��*���� */
	public WorkWithFile(Ammunition[] am) {
		ammunitions = am;
	}

	/** ����� ������ � ���� �������� */
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

	/** ����� ����� ��������, �� ������� �� */
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

	/** ����� ������ ����������� ��*���� */
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

	/** ����� ����� ����������� ��*����, � ������ ������ �� ������� ���� */
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

	/** ����� ������ �� ���� ���������� ��� ��*���� � ������ ������ */
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

	/** ����� ����� ���������� ��� ��*����, ������� ����� String ����� */
	public String ReadInformation() {
		File amInformation = new File(
				"C:\\Users\\Lenovo\\Desktop\\amInformation.doc");
		FileReader fr = null;
		String txt = null;
		try {
			fr = new FileReader(amInformation);
		} catch (FileNotFoundException e) {
			System.out.println("���� �����");
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
