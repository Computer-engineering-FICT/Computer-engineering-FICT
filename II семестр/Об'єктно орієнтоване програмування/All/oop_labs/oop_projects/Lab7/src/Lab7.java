//import java.util.ArrayList;


public class Lab7 {
	public static void main(String[] args) {
//		SportsmenList list1 = new SportsmenList();
//		System.out.println("Створений список:");
//		list1.view();
//		System.out.println();
		
		SportsmenList list = new SportsmenList(new Sportsmen());
		System.out.println("Створений список1:");
		list.view();
		list.add(new Sportsmen("Уле-Айнар", "Бьорндален", 36, "Чоловік", "Заслужений мастер спорту", "Лижні гонки", "Норвегія"));
		System.out.println("Створений список2:");
		list.view();
		list.add(new Sportsmen("Яна", "Клочкова", 29, "Жінка", "4-х кратна олімпійська чемпіонка", "Спортивне плавання", "Україна"));
		System.out.println("Створений список3:");
		list.view();
		
//		ArrayList<Sportsmen> arraylist = new ArrayList<Sportsmen>();
//		arraylist.add(new Sportsmen("Уле-Айнар", "Бьорндален", 36, "Чоловік", "Заслужений мастер спорту", "Лижні гонки", "Норвегія"));
//		list.add(arraylist);
//		System.out.println("Створений список ArrayList:");
//		list.listOnScreen();
//		
//		Sportsmen sportsmen = new Sportsmen("Яна", "Клочкова", 29, "Жінка", "4-х кратна олімпійська чемпіонка", "Спортивне плавання", "Україна");
//		list.replace(1, sportsmen);
//		list.add(new Sportsmen("Ганна", "Безсонова", 27, "Жінка", "Дворазова бронзова призерка Олімпійських ігор", "Художня гімнастика", "Україна"));
//		list.add(new Sportsmen("Андрій", "Аршавін", 30, "Чоловік", "Заслужений мастер спорту Росії", "Футбол", "Росія"));
//		System.out.println("Заміна першої позиції на sportsmen(Яна Клочкова):");
//		list.listOnScreen();
//		
//		list.remove(1, 2);
//		System.out.println("Список після видалення першої і другої позиції");
//		list.listOnScreen();	

	}

}
