import java.util.*;

/**
 * Виконавчий клас, що тестує колекцію <code>SportsmenList</code> 
 * У цьому класі задаються всі початкові умови.
 */

public class Main {
	public static void main(String[] args) {
		SportsmenList list1 = new SportsmenList();
		System.out.println("Створений список:");
		list1.listOnScreen();
		System.out.println();
		
		SportsmenList list = new SportsmenList(new Sportsmen());
		System.out.println("Створений список:");
		list.listOnScreen();
		
		ArrayList<Sportsmen> arraylist = new ArrayList<Sportsmen>();
		arraylist.add(new Sportsmen("Уле-Айнар", "Бьорндален", 36, "Чоловік", "Заслужений мастер спорту", "Лижні гонки", "Норвегія"));
		list.add(arraylist);
		System.out.println("Створений список ArrayList:");
		list.listOnScreen();
		
		Sportsmen sportsmen = new Sportsmen("Яна", "Клочкова", 29, "Жінка", "4-х кратна олімпійська чемпіонка", "Спортивне плавання", "Україна");
		list.replace(1, sportsmen);
		list.add(new Sportsmen("Ганна", "Безсонова", 27, "Жінка", "Дворазова бронзова призерка Олімпійських ігор", "Художня гімнастика", "Україна"));
		list.add(new Sportsmen("Андрій", "Аршавін", 30, "Чоловік", "Заслужений мастер спорту Росії", "Футбол", "Росія"));
		System.out.println("Заміна першої позиції на sportsmen(Яна Клочкова):");
		list.listOnScreen();
		
		list.remove(1, 2);
		System.out.println("Список після видалення першої і другої позиції");
		list.listOnScreen();	
	}
}