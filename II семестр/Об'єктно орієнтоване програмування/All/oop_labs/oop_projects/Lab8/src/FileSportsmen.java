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
 * ���� ��� ���������� ���������� �� ����� �� ���������� � ����� ��������
 * <code>SportsmenList</code> �� ������� �ᒺ���; �� ����������� �ᒺ��� �����
 * <code>Sportsmen</code>; �� ����������� �ᒺ��� � ������ ������.
 */
public class FileSportsmen {
	
	/**
	 * ����� ���������� �� ����� �������� �� ������� ��'���� 
	 * @param list �������� <code>SportsmenList</code>
	 * @param f ����, � ���� ����� ��������
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws NullPointerException
	 */
	public static void saveList(SportsmenList list, String f) 
			throws FileNotFoundException, IOException, NullPointerException{
		// ��������� ������ ������ �� �����
      ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(f));
		// ���������� �������� �� �����
		out.writeObject(list);
		// �������� ������
		out.close();
	}
	
	/**
	 * ����� ���������� � ����� �������� �� ������� ��'����
	 * @param f ����, ���� ����� ������
	 * @return ������ <code>Sportsmen</code>
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws NullPointerException
	 */
	public static SportsmenList loadList(String f) 
			throws FileNotFoundException, IOException, ClassNotFoundException,
					NullPointerException{
		SportsmenList temp = null;
		// ��������� ������ ����� � �����
		ObjectInputStream out = new ObjectInputStream(new FileInputStream(f));
		// ������� �������� � �����
		temp = (SportsmenList) out.readObject();
		// �������� ������
		out.close();
		return temp;
	}
	
	/**
	 * ����� ���������� ������ ��'���� Sportsmen �� �����
	 * @param array �����  ��'���� <code>Sportsmen</code>
	 * @param f ����, � ���� ����� ��������
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws NullPointerException
	 */
	public static void saveSportsmen(Sportsmen[] array, String f)
			throws FileNotFoundException, IOException, NullPointerException{
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(f));
		// ����� temp ������ �������� ������� ������ � ������ ��'����
		// � ���������� �� ����� ������
		Integer temp = new Integer(array.length);
		out.writeObject(temp);
		for(int i = 0; i < array.length; i++){
			out.writeObject(array[i]);
		}
		out.close();
	}
	
	/**
	 * ����� ������� ������ ��'���� <code>Sportsmen</code> � �����
	 * @param f ����, ���� ����� ������
	 * @return ����� ��'���� <code>Sportsmen</code>
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
	 * ����� ���������� ����� <code>Sportsmen</code> 
	 * � ������ ������ � ������ ������ 
	 * @param array	����� ��'���� <code>Sportsmen</code> 
	 * @param f ����, ���� ����� ������
	 * @throws IOException
	 * @throws NullPointerException
	 */
	public static void saveFields(Sportsmen[] array, String f) 
			throws IOException, NullPointerException{
		// ����� ���������� ������ ��'���� Sportsmen �� �����
		// �� ��'���� String
		// ����� ���� ���������� ������
		FileWriter wr = new FileWriter(f);
		// ����� ������� ��������� ������
		wr.append(Integer.toString(array.length));
		for(int i = 0; i < array.length; i++){
			String temp;
			// �������� ������������ ���������� ���� �� String 
			// �� ��������� �����-��������
			temp = array[i].getFName() + " " + array[i].getLName() + " "
				+ Integer.toString(array[i].getAge()) + " "
				+ array[i].getSex() + " " + array[i].getRank() + " " 
				+ array[i].getSport() + " " + array[i].getCountry();  
			wr.write(temp);
			// ����� ���������� �� �������
			wr.append('\t');
		}
		wr.close();
	}

	/**
 	 * ����� ������� ������ ����� <code>Sportsmen</code> 
	 * � ������ ������ 
	 * @param f ����, ���� ����� ������
	 * @return ����� ��'���� <code>Sportsmen</code>
	 * @throws IOException
	 * @throws FileNotFoundException
	 * @throws NullPointerException
	 */
	public static String[] loadFields(String f)
			throws IOException, FileNotFoundException, NullPointerException{
		// ����� ������� ������ ��'���� String � ����� 
		BufferedReader br = new BufferedReader(new FileReader(f));
		// ���������� ��������� ������
		int temp = br.read();
		// ������������ ���� ����� 1 - 49, 2 - 50, ...
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
		Sportsmen sp1 = new Sportsmen("���", "��������", 29, "Ƴ���", 
				"4-� ������ ��������� ��������", "��������� ��������",
				"������");
		Sportsmen sp2 = new Sportsmen("�����", "���������", 27, "Ƴ���",
				"��������� �������� �������� ���������� ����", "�������" +
				" ���������", "������");
		Sportsmen sp3 = new Sportsmen("�����", "������", 30, "������", 
				"���������� ������ ������ ���", "������", "����");
		SportsmenList list = new SportsmenList();
		list.add(sp1);
		list.add(sp2);
		list.add(sp3);

		saveList(list, "C:/sportsmen.dat");
		loadList("C:/sportsmen.dat");
		System.out.println("������: ");
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
	