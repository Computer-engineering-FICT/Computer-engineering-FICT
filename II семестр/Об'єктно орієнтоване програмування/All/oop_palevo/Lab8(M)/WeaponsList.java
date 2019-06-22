//Використовується для серіалізації класу WeaponsList
import java.io.Serializable;
//Використовується для реалізації методу додавання ArrayList до колекції
import java.util.*;

public class WeaponsList implements Serializable{
	private int listLength;		 // Довжина колекції
	private Weapons element;	 // Елемент колекції
	
	/* Методи GET та SET для полів */
	public final void setListLength(int listLength){
		if (listLength < 0){ // Обробка виняткової ситуації
			throw new IndexOutOfBoundsException("Помилка! Від'ємна довжина списку"); 
		} else {
			this.listLength = listLength;
		}
	}
	
	public final int getListLength(){
		return listLength;
	}
	
	/* Конструктори */
	public WeaponsList(){
	// Конструктор за замовчуванням
		element = new Weapons();	
		setListLength(1);
	}
	
	public WeaponsList(Weapons parameter){
	// Конструктор в який передається об'єкт класу Weapons 	
		if (parameter == null){ // Обробка виняткової ситуації
			throw new NullPointerException("Помилка! Параметр конструктора null");
		} else {
			element = parameter;
			setListLength(1);
		}
	}
	
	public WeaponsList(ArrayList parameter){
	// Конструктор в який передається ArrayList	
		if (parameter == null){ // Обробка виняткової ситуації
			throw new NullPointerException("Помилка! Список зброї null");
		} else {
			add(parameter);
			setListLength(parameter.size());
		}
	}

	/* Методи роботи з колекцією */
	public boolean isEmpty(){
	// Метод перевірки колекції на пустоту	
		boolean temp = false;
		if (getListLength() == 0){
			temp = true;
		}
		return temp;
	}

	public boolean contains(Weapons parameter){
	// Метод перевірки включення parameter в колекцію	
		boolean temp = false;
		if (element == null){
			return false;
		}
		// Змінна condition зберігає значення перевірки на абсолютну відповідність
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
	// Метод додавання об'єкту класу Weapons до колекції	
		boolean temp = false;
		if (element == null){
		// Додавання елемента в пусту колекцію	
			element = parameter;
			setListLength(getListLength() + 1);
			return true;
		}
		if (contains(parameter) == false){
		// Перевірка на існування такого елемента і його додавання (якщо не існує)
			element.setNext(parameter);
			parameter.setPrevious(element);
			setListLength(getListLength() + 1);
			positioning(true);
			temp = true;
		}
		return temp;
	}
	
	public boolean add(ArrayList parameter){
	// Метод додавання ArrayList до коллекції	
		boolean temp = false;
		goTo(true);		
		for(int i = 0; i < parameter.size(); i++){
			if (contains((Weapons) parameter.get(i)) == false){
			// Перевірка на існування такого елемента в ArrayList	
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
	// Метод видалення об'єктів з колекції з startPosition по finalPosition включно	
		// Змінна condition зберігає значення перевірки на відсутність виняткової ситуації
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
			// Реалізація для випадку видалення з початку	
				for(int i = 1; i <= finalPosition; i++){
					positioning(true);
				}
				if (finalPosition != getListLength()){
					element.setPrevious(null);
				}
				setListLength(getListLength() - (finalPosition - startPosition + 1));
			}
		} else {
			throw new IndexOutOfBoundsException("Помилка! Неіснуюча позиція");
		}
	}
	
	public void replace(int position, Weapons parameter){
	// Метод заміни об'єкту в колекції	
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
			throw new IndexOutOfBoundsException("Помилка! Неіснуюча позиція");
		}
	}
	
	public void clear(){
	// Метод очистки коллекції	
		goTo(false);
		element.setNext(null);
		setListLength(0);
	}
	
	public void listOnScreen(){
	// Метод виведення колекції на екран
		if (isEmpty() == true){
			try{
			// Створення виняткової ситуації	
				throw new NullPointerException("Помилка! Нічого відобразити - колекція пуста");
			} 
			// Обробка виняткової ситуації, що не критична для програми - виведення на екран повідомлення про помилку
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
	// Метод позиціонування колекції	
		if (parameter == true){
			element = element.getNext();
		} else {
			element = element.getPrevious();
		}
	}
	
	public void goTo(boolean parameter){
	// Метод руху по колекції в кінець/початок
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

	
