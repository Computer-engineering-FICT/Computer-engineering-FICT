//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//
//
//public class Main {
//
//	public static void main(String[] args) { 
//			//throws FileNotFoundException, NullPointerException, IOException,
//			//	ClassNotFoundException
//		Sportsmen sp1 = new Sportsmen("Яна", "Клочкова", 29, "Жінка", 
//				"4-х кратна олімпійська чемпіонка", "Спортивне плавання",
//				"Україна");
//		Sportsmen sp2 = new Sportsmen("Ганна", "Безсонова", 27, "Жінка",
//				"Дворазова бронзова призерка Олімпійських ігор", "Художня" +
//				" гімнастика",
//				"Україна");
//		Sportsmen sp3 = new Sportsmen("Андрій", "Аршавін", 30, "Чоловік", 
//				"Заслужений мастер спорту Росії", "Футбол", "Росія");
//		SportsmenList list = new SportsmenList();
//		list.add(sp1);
//		list.add(sp2);
//		list.add(sp3);
//		//System.out.println("Список: \n");
//		//list.listOnScreen();
//		
//		FileSportsmen fsp = new FileSportsmen();
//		//fsp.saveList(list, "C:/sportsmen.dat");
//		//fsp.loadList("C:/sportsmen.dat");
//		
//		FileSportsmen fsp2 = new FileSportsmen();
//		Sportsmen [] array = new Sportsmen[3];
//		array[0] = sp1;
//		array[1] = sp2;
//		array[2] = sp3;
//		fsp2.saveSportsmen(array, "C:/sportsmen.dat");
//		fsp2.loadSportsmen("C:/sportsmen.dat");
//		System.out.println(array[1]);
//	}
//
//}
