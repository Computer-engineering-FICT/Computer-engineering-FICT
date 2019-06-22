import java.io.*;
// ������������ ObjectOutputStream, ObjectInputStream, FileOutputStream, FileInputStream 

public class Lab6{
	public static void saveWeaponsList(WeaponsList parameter, String file) throws FileNotFoundException, IOException, NullPointerException{
		// ��������� ������ ������ �� �����
		ObjectOutputStream str = new ObjectOutputStream(new FileOutputStream(file));
		// ���������� �������� �� �����
		str.writeObject(parameter);
		// �������� ������
		str.close();
	}
	
	public static WeaponsList loadWeaponsList(String file) throws FileNotFoundException, IOException, ClassNotFoundException, NullPointerException{
		WeaponsList temp = null;	
		// ��������� ������ ����� � �����
		ObjectInputStream str = new ObjectInputStream(new FileInputStream(file));
		// ������� �������� � �����
		temp = (WeaponsList) str.readObject();
		// �������� ������
		str.close();
		return temp;
	}
	
	public static void saveWeapons(Weapons[] parameter, String file) throws FileNotFoundException, IOException, NullPointerException{
		// ����� ���������� ������ ��'���� Weapons �� �����
		ObjectOutputStream str = new ObjectOutputStream(new FileOutputStream(file));
		// ����� temp ������ �������� ������� ������ � ������ ��'���� � ���������� �� ����� ������
		Integer temp = new Integer(parameter.length);
		str.writeObject(temp);
		for(int i = 0; i < parameter.length; i++){
			str.writeObject(parameter[i]);
		}
		str.close();
	}
	
	public static Weapons[] loadWeapons(String file) throws FileNotFoundException, IOException, ClassNotFoundException, NullPointerException{
		// ����� ������� ������ ��'���� Weapons � �����
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
		// ����� ���������� ������ ��'���� Weapons �� ����� �� ��'���� String. ����� ���� ���������� ������
		FileWriter wr = new FileWriter(file);
		// ����� ������� ��������� ������
		wr.append(Integer.toString(parameter.length));
		for(int i = 0; i < parameter.length; i++){
			String temp;
			// �������� ������������ ���������� ���� �� String �� ��������� �����-��������
			temp = parameter[i].getName() + " " + parameter[i].getType() + " " + parameter[i].getCalibre() + " " + 
				Short.toString(parameter[i].getLength()) + " " + Float.toString(parameter[i].getMass()) + " " +
				Short.toString(parameter[i].getMagazine()) + " " + Short.toString(parameter[i].getShootingSpeed()) + " " +
				Short.toString(parameter[i].getYear());
			wr.write(temp);
			// ����� ���������� �� �������
			wr.append('\t');
		}
		wr.close();
	}
	
	public static String[] loadWeaponsFields(String file) throws IOException, FileNotFoundException, NullPointerException{
		// ����� ������� ������ ��'���� String � ����� 
		BufferedReader br = new BufferedReader(new FileReader(file));
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
}