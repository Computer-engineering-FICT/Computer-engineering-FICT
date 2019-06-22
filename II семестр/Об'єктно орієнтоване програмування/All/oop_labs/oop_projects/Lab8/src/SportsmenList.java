import java.io.Serializable;
import java.util.ArrayList;

/**
 * ���� <code>SportsmenList</code> ����� ��������� �������� �� ���������� 
 * ���������� ������. ����� �������� � ���� <code>Sportsmen</code>.
 * ���� ������ ������ ���������, ��������� �� �������� ��'���� � ��������.
 * ��� �������� ��'��� �� �������� ���������� �������� ��������� ���� � ��������.
 */

public class SportsmenList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -467782542549558149L;
	private Sportsmen element;
	private int size;
	
	/**
	 * ����������� �� �������������
	 */
	public SportsmenList(){
		element = new Sportsmen();	
		setSize(1);
	}
	
	/**
	 * �����������, � ���� ���������� ��'��� ����� <code>Sportsmen</code>
	 * 
	 * @param parameter ��'��� ����� <code>Sportsmen</code>
	 * @throws NullPointerException ���� ���������� �� �������� <code>null</code>
	 */
	public SportsmenList(Sportsmen parameter){
		if (parameter == null){
			throw new NullPointerException("�������! �������� ������������ null");
		} else {
			element = parameter;
			setSize(1);
		}
	}
	
	/**
	 * ����������� � ���� ���������� ���������� �������� �ᒺ��� <code>ArrayList</code>
	 * 
	 * @param parameter ���������� �������� ��'���� <code>ArrayList</code> ���� <code>Sportsmen</code>
	 * @throws NullPointerException ���� ������ �������� �����
	 */
	public SportsmenList(ArrayList<Sportsmen> parameter){	
		if (parameter == null){
			throw new NullPointerException("�������! ������ ���������� null");
		} else {
			add(parameter);
			setSize(parameter.size());
		}
	}
	
	/**
	 * @param size ������� ������
	 * @throws IndexOutOfBoundsExseption ���� ������� ������ ��'����
	 */
	public final void setSize(int size){
		if (size < 0){
			throw new IndexOutOfBoundsException("�������! ³�'���� ������� ������"); 
		} else {
			this.size = size;
		}
	}
	public final int getSize(){
		return size;
	}

	/**
	 * ����� �������� �������� �� �������
	 * 
	 * @return <b>true</b>, ���� �������� ����� � <b>false</b>, ���� �������� �
	 */
	public boolean isEmpty(){	
		if (getSize() == 0){
			return true;
		}
		return false;
	}

	/**
	 * ����� �������� ��������� �������� <code>parameter</code> � ��������
	 * ����� <code>condition</code> ������ �������� �������� �� ���������
	 *  ����������
	 * 
	 * @param parameter ��'��� ���� <code>Sportsmen</code>
	 * @return <b>true</b> , ���� ������� ������� � ��������
	 */
	public boolean contains(Sportsmen parameter){
		boolean temp = false;
		if (element == null){
			return false;
		}
		boolean condition = ((element.getFName() == parameter.getFName()) 
				&& (element.getLName() == parameter.getLName())	
				&& (element.getAge() == parameter.getAge())
				&& (element.getSex() == parameter.getSex())
				&& (element.getRank() == parameter.getRank()) 
				&& (element.getSport() == parameter.getSport())	
				&& (element.getCountry() == parameter.getCountry()));
		for(int i = 1; i <= getSize(); i++){
			if (condition == true){
				temp = true;
				while(element.getNext() != null){
					element = element.getNext();
				}
			}
		}
		return temp;
	}
	
	/**
	 * ����� ��������� ��'���� ����� <code>Sportsmen</code> �� ��������
	 * ����� ���������� ���������� �������� �� ��������� ������ ��������.
	 * ���� �� ���� ������ ��������, �� �� ��������
	 * 	
	 * @param parameter ��'��� ����� <code>Sportsmen</code>
	 * @return <b>true</b> ���� ������� ������ 
	 */
	public boolean add(Sportsmen parameter){	
		if (element == null){
			element = parameter;
			setSize(getSize() + 1);
			return true;
		}
		if (contains(parameter) == false){
			element.setNext(parameter);
			parameter.setPrevious(element);
			setSize(getSize() + 1);
			element = element.getNext();
		}
		return false;
	}
	
	/**
	 *  ����� ��������� ArrayList �� ���������. 
	 *  ���������� �������� �� ��������� ������ �������� � ArrayList
	 * 
	 * @param parameter ���������� �������� ��'���� <code>ArrayList</code>
	 * ���� <code>Sportsmen</code>
	 * @return <b>true</b> ���� ������� ������ ������
	 */
	public boolean add(ArrayList<Sportsmen> parameter){
		boolean temp = false;
		while(element.getNext() != null){
			element = element.getNext();
		}	
		for(int i = 0; i < parameter.size(); i++){
			if (contains((Sportsmen) parameter.get(i)) == false){	
				element.setNext((Sportsmen) parameter.get(i));
				((Sportsmen) parameter.get(i)).setPrevious(element);
				temp = true;
				setSize(getSize() + parameter.size());
			}
			while(element.getNext() != null){
				element = element.getNext();
			}
		}
		return temp;
	}
	
	/**
	 * ����� ��������� ��'���� � �������� � startPosition �� finalPosition
	 * �������	
	 * ����� condition ������ �������� �������� �� ��������� ���������
	 * ��������
	 * 
	 * @param startPosition ��������� �������
	 * @param finalPosition ������ �������
	 * @throws IndexOutOfBoundsException ���� ������� �����
	 */
	public void remove(int startPosition, int finalPosition){
		boolean condition = (startPosition >= 1)
				&& (startPosition <= getSize()) && (finalPosition <= getSize()) 
				&& (finalPosition >= startPosition);
		Sportsmen bufer = element;
		
		while(element.getPrevious() != null){
			element = element.getPrevious();
		}			
		if (condition == true){
			if (startPosition != 1){
				for(int i = 1; i < finalPosition; i++){
					element = element.getNext();
					bufer = element;
				}
				while(element.getPrevious() != null){
					element = element.getPrevious();
				}					
				for(int i = 1; i < startPosition; i++){
					element = element.getNext();
				}
				(element.getPrevious()).setNext(bufer.getNext());
				bufer.setPrevious(element.getPrevious());
				setSize(getSize() - (finalPosition - startPosition + 1));
			} else {
				for(int i = 1; i <= finalPosition; i++){
					element = element.getNext();
				}
				if (finalPosition != getSize()){
					element.setPrevious(null);
				}
				setSize(getSize() - (finalPosition - startPosition + 1));
			}
		} else {
			throw new IndexOutOfBoundsException("�������! �������� �������");
		}
	}
	
	/**
	 * ����� ����� ��'���� � ��������
	 * 
	 * @param position ��� ������� ���������
	 * @param parameter ��'��� ����� <code>Sportsmen</code>
	 */
	public void replace(int position, Sportsmen parameter){	
		if ((position >= 1) && (position <= getSize())){
			while(element.getPrevious() != null){
				element = element.getPrevious();
			}	
			for(int i = 1; i < position; i++){
				element = element.getNext();
			}
			element.setFName(parameter.getFName());
			element.setLName(parameter.getLName());
			element.setAge(parameter.getAge());
			element.setSex(parameter.getSex());			
			element.setRank(parameter.getRank());
			element.setSport(parameter.getSport());			
			element.setCountry(parameter.getCountry());
			while(element.getNext() != null){
				element = element.getNext();
			}
		} else {
			throw new IndexOutOfBoundsException("�������! ������� ������� �����");
		}
	}
	
	/**
	 *  ����� ������� ���������
	 */
	public void clear(){	
		while(element.getPrevious() != null){
			element = element.getPrevious();
		}	
		element.setNext(null);
		setSize(0);
	}
	
	/**
	 * ����� ��������� �������� �� �����
	 * @throws NullPointerException ���� �������� �����. ��������� �������� �� �������� ��� ��������.
	 *  ���������� ����������� ��� �������
	 */
	public void listOnScreen(){
		if (isEmpty() == true){
			try{
				throw new NullPointerException("�������! �������� �����");
			} 
			catch(NullPointerException e){
				e.printStackTrace();
			}
		} else { 
			while(element.getPrevious() != null){
				element = element.getPrevious();
			}	
			for(int i = 1; i <= getSize(); i++){
				element.printAll();				
				if (element.getNext() != null){
					element = element.getNext();
				}
			}
		}
	}
}

	
