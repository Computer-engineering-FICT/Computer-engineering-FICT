//��������������� ��� ���������� ����� WeaponsList
import java.io.Serializable;
//��������������� ��� ��������� ������ ��������� ArrayList �� ��������
import java.util.*;

public class WeaponsList implements Serializable{
	private int listLength;		 // ������� ��������
	private Weapons element;	 // ������� ��������
	
	/* ������ GET �� SET ��� ���� */
	public final void setListLength(int listLength){
		if (listLength < 0){ // ������� ��������� ��������
			throw new IndexOutOfBoundsException("�������! ³�'���� ������� ������"); 
		} else {
			this.listLength = listLength;
		}
	}
	
	public final int getListLength(){
		return listLength;
	}
	
	/* ������������ */
	public WeaponsList(){
	// ����������� �� �������������
		element = new Weapons();	
		setListLength(1);
	}
	
	public WeaponsList(Weapons parameter){
	// ����������� � ���� ���������� ��'��� ����� Weapons 	
		if (parameter == null){ // ������� ��������� ��������
			throw new NullPointerException("�������! �������� ������������ null");
		} else {
			element = parameter;
			setListLength(1);
		}
	}
	
	public WeaponsList(ArrayList parameter){
	// ����������� � ���� ���������� ArrayList	
		if (parameter == null){ // ������� ��������� ��������
			throw new NullPointerException("�������! ������ ���� null");
		} else {
			add(parameter);
			setListLength(parameter.size());
		}
	}

	/* ������ ������ � ��������� */
	public boolean isEmpty(){
	// ����� �������� �������� �� �������	
		boolean temp = false;
		if (getListLength() == 0){
			temp = true;
		}
		return temp;
	}

	public boolean contains(Weapons parameter){
	// ����� �������� ��������� parameter � ��������	
		boolean temp = false;
		if (element == null){
			return false;
		}
		// ����� condition ������ �������� �������� �� ��������� ����������
		boolean condition = ((element.getName() == parameter.getName()) && (element.getType() == parameter.getType())
				&& (element.getCalibre() == parameter.getCalibre()) && (element.getLength() == parameter.getLength())
				&& (element.getMass() == parameter.getMass()) && (element.getMagazine() == parameter.getMagazine())
				&& (element.getShootingSpeed() == parameter.getShootingSpeed()) && (element.getYear() == parameter.getYear()));
		
		for(int i = 1; i <= getListLength(); i++){
			if (condition == true){
				temp = true;
				goTo(true);
			}
		}
		return temp;
	}

	public boolean add(Weapons parameter){	
	// ����� ��������� ��'���� ����� Weapons �� ��������	
		boolean temp = false;
		if (element == null){
		// ��������� �������� � ����� ��������	
			element = parameter;
			setListLength(getListLength() + 1);
			return true;
		}
		if (contains(parameter) == false){
		// �������� �� ��������� ������ �������� � ���� ��������� (���� �� ����)
			element.setNext(parameter);
			parameter.setPrevious(element);
			setListLength(getListLength() + 1);
			positioning(true);
			temp = true;
		}
		return temp;
	}
	
	public boolean add(ArrayList parameter){
	// ����� ��������� ArrayList �� ���������	
		boolean temp = false;
		goTo(true);		
		for(int i = 0; i < parameter.size(); i++){
			if (contains((Weapons) parameter.get(i)) == false){
			// �������� �� ��������� ������ �������� � ArrayList	
				element.setNext((Weapons) parameter.get(i));
				((Weapons) parameter.get(i)).setPrevious(element);
				temp = true;
				setListLength(getListLength() + parameter.size());
			}
			goTo(true);
		}
		return temp;
	}

	public void remove(int startPosition, int finalPosition){
	// ����� ��������� ��'���� � �������� � startPosition �� finalPosition �������	
		// ����� condition ������ �������� �������� �� ��������� ��������� ��������
		boolean condition = (startPosition >= 1) && (startPosition <= getListLength())
		&& (finalPosition <= getListLength()) && (finalPosition >= startPosition);
		Weapons bufer = element;
		
		goTo(false);		
		if (condition == true){
			if (startPosition != 1){
				for(int i = 1; i < finalPosition; i++){
					positioning(true);
					bufer = element;
				}
				goTo(false);				
				for(int i = 1; i < startPosition; i++){
					positioning(true);
				}
				(element.getPrevious()).setNext(bufer.getNext());
				bufer.setPrevious(element.getPrevious());
				setListLength(getListLength() - (finalPosition - startPosition + 1));
			} else {
			// ��������� ��� ������� ��������� � �������	
				for(int i = 1; i <= finalPosition; i++){
					positioning(true);
				}
				if (finalPosition != getListLength()){
					element.setPrevious(null);
				}
				setListLength(getListLength() - (finalPosition - startPosition + 1));
			}
		} else {
			throw new IndexOutOfBoundsException("�������! �������� �������");
		}
	}
	
	public void replace(int position, Weapons parameter){
	// ����� ����� ��'���� � ��������	
		if ((position >= 1) && (position <= getListLength())){
			goTo(false);
			for(int i = 1; i < position; i++){
				positioning(true);
			}
			element.setName(parameter.getName());
			element.setType(parameter.getType());
			element.setCalibre(parameter.getCalibre());
			element.setLength(parameter.getLength());			
			element.setMass(parameter.getMass());
			element.setMagazine(parameter.getMagazine());			
			element.setShootingSpeed(parameter.getShootingSpeed());
			element.setYear(parameter.getYear());
			goTo(true);	
		} else {
			throw new IndexOutOfBoundsException("�������! �������� �������");
		}
	}
	
	public void clear(){
	// ����� ������� ���������	
		goTo(false);
		element.setNext(null);
		setListLength(0);
	}
	
	public void listOnScreen(){
	// ����� ��������� �������� �� �����
		if (isEmpty() == true){
			try{
			// ��������� ��������� ��������	
				throw new NullPointerException("�������! ͳ���� ���������� - �������� �����");
			} 
			// ������� ��������� ��������, �� �� �������� ��� �������� - ��������� �� ����� ����������� ��� �������
			catch(NullPointerException e){
				e.printStackTrace();
			}
		} else { 
			goTo(false);
			for(int i = 1; i <= getListLength(); i++){
				element.onScreen();				
				if (element.getNext() != null){
					positioning(true);
				}
			}
		}
	}
	
	public void positioning(boolean parameter){
	// ����� �������������� ��������	
		if (parameter == true){
			element = element.getNext();
		} else {
			element = element.getPrevious();
		}
	}
	
	public void goTo(boolean parameter){
	// ����� ���� �� �������� � �����/�������
		if (parameter == true){
			while(element.getNext() != null){
				positioning(true);
			}
		} else {
			while(element.getPrevious() != null){
				positioning(false);
			}			
		}		
	}
}

	
