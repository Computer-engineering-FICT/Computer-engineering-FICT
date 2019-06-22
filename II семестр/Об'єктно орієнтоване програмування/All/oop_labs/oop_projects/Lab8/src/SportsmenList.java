import java.io.Serializable;
import java.util.ArrayList;

/**
 * Клас <code>SportsmenList</code> описує типізовану колекцію із внутрішньою 
 * структурою списку. Типом колекції є клас <code>Sportsmen</code>.
 * Клас містить методи додавання, видалення та заміщення об'єктів в колекції.
 * При додаванні об'кту до колекції виконується перевірка існування його в колекції.
 */

public class SportsmenList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -467782542549558149L;
	private Sportsmen element;
	private int size;
	
	/**
	 * Конструктор за замовчуванням
	 */
	public SportsmenList(){
		element = new Sportsmen();	
		setSize(1);
	}
	
	/**
	 * Конструктор, в який передається об'єкт класу <code>Sportsmen</code>
	 * 
	 * @param parameter об'єкт класу <code>Sportsmen</code>
	 * @throws NullPointerException якщо передається як параметр <code>null</code>
	 */
	public SportsmenList(Sportsmen parameter){
		if (parameter == null){
			throw new NullPointerException("Помилка! Параметр конструктора null");
		} else {
			element = parameter;
			setSize(1);
		}
	}
	
	/**
	 * Конструктор в який передається стандартна колекція об’єктів <code>ArrayList</code>
	 * 
	 * @param parameter стандартна колекція об'єктів <code>ArrayList</code> типу <code>Sportsmen</code>
	 * @throws NullPointerException якщо вхідна колекція пуста
	 */
	public SportsmenList(ArrayList<Sportsmen> parameter){	
		if (parameter == null){
			throw new NullPointerException("Помилка! Список спортсменів null");
		} else {
			add(parameter);
			setSize(parameter.size());
		}
	}
	
	/**
	 * @param size довжина списку
	 * @throws IndexOutOfBoundsExseption якщо довжина списку від'ємна
	 */
	public final void setSize(int size){
		if (size < 0){
			throw new IndexOutOfBoundsException("Помилка! Від'ємна довжина списку"); 
		} else {
			this.size = size;
		}
	}
	public final int getSize(){
		return size;
	}

	/**
	 * Метод перевірки колекції на пустоту
	 * 
	 * @return <b>true</b>, якщо колекція пуста і <b>false</b>, якщо елементи є
	 */
	public boolean isEmpty(){	
		if (getSize() == 0){
			return true;
		}
		return false;
	}

	/**
	 * Метод перевірки включення елемента <code>parameter</code> в колекцію
	 * Змінна <code>condition</code> зберігає значення перевірки на абсолютну
	 *  відповідність
	 * 
	 * @param parameter об'єкт типу <code>Sportsmen</code>
	 * @return <b>true</b> , якщо елемент входить в колекцію
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
	 * Метод додавання об'єкту класу <code>Sportsmen</code> до колекції
	 * Перед додаванням виконується перевірка на існування такого елемента.
	 * Якщо не існує такого елемента, то він додається
	 * 	
	 * @param parameter об'єкт класу <code>Sportsmen</code>
	 * @return <b>true</b> якщо елемент додано 
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
	 *  Метод додавання ArrayList до коллекції. 
	 *  Виконується перевірка на існування такого елемента в ArrayList
	 * 
	 * @param parameter стандартна колекція об'єктів <code>ArrayList</code>
	 * типу <code>Sportsmen</code>
	 * @return <b>true</b> якщо елемент успішно додано
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
	 * Метод видалення об'єктів з колекції з startPosition по finalPosition
	 * включно	
	 * Змінна condition зберігає значення перевірки на відсутність виняткової
	 * ситуації
	 * 
	 * @param startPosition початкова позиція
	 * @param finalPosition кінцева позиція
	 * @throws IndexOutOfBoundsException якщо позиція неіснує
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
			throw new IndexOutOfBoundsException("Помилка! Неіснуюча позиція");
		}
	}
	
	/**
	 * Метод заміни об'єкту в колекції
	 * 
	 * @param position яку позицію замінювати
	 * @param parameter об'єкт класу <code>Sportsmen</code>
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
			throw new IndexOutOfBoundsException("Помилка! Уведеної позиції неіснує");
		}
	}
	
	/**
	 *  Метод очистки коллекції
	 */
	public void clear(){	
		while(element.getPrevious() != null){
			element = element.getPrevious();
		}	
		element.setNext(null);
		setSize(0);
	}
	
	/**
	 * Метод виведення колекції на екран
	 * @throws NullPointerException якщо колекція пуста. Виняткова ситуація не критична для програми.
	 *  Виводиться повідомлення про помилку
	 */
	public void listOnScreen(){
		if (isEmpty() == true){
			try{
				throw new NullPointerException("Помилка! Колекція пуста");
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

	
